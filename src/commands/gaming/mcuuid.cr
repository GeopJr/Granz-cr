module Granz
  module Mcuuid
    BOT.on_message_create do |payload|
      next if payload.author.bot
      next unless Prefix_check.new("mcuuid", payload.content).check
      next BOT.create_message(payload.channel_id, "", Discord::Embed.new(colour: 0xff0000, title: "Sorry, I only respond on guilds")) unless CACHE.resolve_channel(payload.channel_id).type.guild_text?
      args = Args.new("mcuuid", payload.content).args
      next if Min_max_arg.new(1, args.size, 1, BOT, payload.channel_id).check
      next if Min_max_arg.new(2, args.size, 1, BOT, payload.channel_id).check

      response = HTTP::Client.get "https://api.mojang.com/users/profiles/minecraft/#{args[0]}"
      next BOT.create_message(payload.channel_id, "", Discord::Embed.new(colour: 0xff0000, title: "Name was not found")) if response.status_code == 404
      next BOT.create_message(payload.channel_id, "", Discord::Embed.new(colour: 0xff0000, title: "API returned #{response.status_code}")) unless response.status_code == 200
      value = JSON.parse(response.body)
      head = HTTP::Client.get "https://crafatar.com/renders/head/#{value["id"]}?overlay"
      next BOT.create_message(payload.channel_id, "", Discord::Embed.new(colour: 0xff0000, title: "API returned #{response.status_code}")) unless head.status_code == 200

      embed = Discord::Embed.new(

        colour: 0xffff00,
        title: "#{value["name"].as_s}'s UUID is:",
        description: "`#{value["id"].as_s}`",
        thumbnail: Discord::EmbedThumbnail.new(
          url: "https://crafatar.com/renders/head/#{value["id"]}?overlay"
        )
      )
      BOT.create_message(payload.channel_id, "", embed)
    end
  end
end
