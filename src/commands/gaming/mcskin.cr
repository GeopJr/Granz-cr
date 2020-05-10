module Granz
  command = Command.new("mcskin", "gaming", "#{CONFIG["prefix"]}mcskin <uuid>", "#{CONFIG["prefix"]}mcskin 870629c31ddb49f0a940e20abff3df55", "Returns the skin of the provided uuid")
  Granz::COMMANDS << command
  module Mcskin
    BOT.on_message_create do |payload|
      next if payload.author.bot
      next unless Prefix_check.new(command.name, payload.content).check
      next BOT.create_message(payload.channel_id, "", Discord::Embed.new(colour: 0xff0000, title: "Sorry, I only respond on guilds")) unless CACHE.resolve_channel(payload.channel_id).type.guild_text?
      args = Args.new(command.name, payload.content).args
      next if Min_max_arg.new(1, args.size, 1, BOT, payload.channel_id).check
      next if Min_max_arg.new(2, args.size, 1, BOT, payload.channel_id).check
      uuid = args[0]
      response = HTTP::Client.get "https://crafatar.com/renders/body/#{uuid}?overlay"
      next BOT.create_message(payload.channel_id, "", Discord::Embed.new(colour: 0xff0000, title: "UUIDs ONLY", description: "Use `#{CONFIG["prefix"]}mcuuid <username>` to get yours")) if response.status_code == 422
      next BOT.create_message(payload.channel_id, "", Discord::Embed.new(colour: 0xff0000, title: "API returned #{response.status_code}")) unless response.status_code == 200

      embed = Discord::Embed.new(
        title: "Here you go :",
        image: Discord::EmbedImage.new(
          url: "https://crafatar.com/renders/body/#{uuid}?overlay"
        ),
        thumbnail: Discord::EmbedThumbnail.new(
          url: "https://crafatar.com/skins/#{uuid}"
        ),
        colour: 0xffff00,
      )
      BOT.create_message(payload.channel_id, "", embed)
    end
  end
end
