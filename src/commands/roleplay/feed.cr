module Granz
  module Feed
    BOT.on_message_create do |payload|
      next if payload.author.bot
      next unless Prefix_check.new("feed", payload.content).check
      next BOT.create_message(payload.channel_id, "", Discord::Embed.new(colour: 0xff0000, title: "Sorry, I only respond on guilds")) unless CACHE.resolve_channel(payload.channel_id).type.guild_text?
      args = Args.new("feed", payload.content).args
      next if Min_max_arg.new(2, args.size, 1, BOT, payload.channel_id).check

      if args.any? && args[0].to_u64?
        begin
          mentioned_user = CACHE.resolve_user(args[0].to_u64)
        rescue
          mentioned_user = payload.author
        end
      elsif payload.mentions.any? && args.any?
        mentioned_user = payload.mentions.last
      else
        mentioned_user = payload.author
      end

      if mentioned_user.id == payload.author.id
        embed = Discord::Embed.new(
          colour: 0xffff00,
          description: "<@#{payload.author.id}> Sorry , you can't feed yourself :cry:. But I can feed you if you want :blush:"
        )
        BOT.create_message(payload.channel_id, "", embed)
      else
        response = HTTP::Client.get "https://nekos.life/api/v2/img/feed"
        next BOT.create_message(payload.channel_id, "", Discord::Embed.new(colour: 0xff0000, title: "API returned #{response.status_code}")) unless response.status_code == 200
        value = JSON.parse(response.body)
        embed = Discord::Embed.new(
          image: Discord::EmbedImage.new(
            url: "#{value["url"]}"
          ),
          colour: 0xffff00,
          description: "<@#{mentioned_user.id}> , got fed by <@#{payload.author.id}> :spoon:"
        )
        BOT.create_message(payload.channel_id, "", embed)
      end
    end
  end
end
