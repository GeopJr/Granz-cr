module Granz
  command = Command.new("shoot", "roleplay", "#{CONFIG["prefix"]}shoot [ID/MENTION]", "#{CONFIG["prefix"]}shoot @『Geop』#4066", "Shoots provided user")
  Granz::COMMANDS << command
  module Shoot
    BOT.on_message_create do |payload|
      next if payload.author.bot
      next unless Prefix_check.new(command.name, payload.content).check
      next BOT.create_message(payload.channel_id, "", Discord::Embed.new(colour: 0xff0000, title: "Sorry, I only respond on guilds")) unless CACHE.resolve_channel(payload.channel_id).type.guild_text?
      args = Args.new(command.name, payload.content).args
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
          description: "<@#{payload.author.id}> If you are feeling suicidal, talk to someone or call your country's suicide prevention hotline"
        )
        BOT.create_message(payload.channel_id, "", embed)
      else
        gifs = ["https://i.imgur.com/l4cSv1H.gif", "https://i.imgur.com/eZ49dBC.gif"]
        embed = Discord::Embed.new(
          colour: 0xffff00,
          description: "<@#{mentioned_user.id}> , got shot by <@#{payload.author.id}> :gun:",
          image: Discord::EmbedImage.new(
            url: "#{gifs.sample}"
          )
        )
        BOT.create_message(payload.channel_id, "", embed)
      end
    end
  end
end
