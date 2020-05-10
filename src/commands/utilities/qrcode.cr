module Granz
  command = Command.new("qrcode", "utilities", "#{CONFIG["prefix"]}qrcode <text>", "#{CONFIG["prefix"]}qrcode https://geopjr.xyz/", "Returns a qrcode from the provided text")
  Granz::COMMANDS << command
  module Qrcode
    BOT.on_message_create do |payload|
      next if payload.author.bot
      next unless Prefix_check.new(command.name, payload.content).check
      next BOT.create_message(payload.channel_id, "", Discord::Embed.new(colour: 0xff0000, title: "Sorry, I only respond on guilds")) unless CACHE.resolve_channel(payload.channel_id).type.guild_text?
      args = Args.new(command.name, payload.content).args
      next if Min_max_arg.new(1, args.size, 1, BOT, payload.channel_id).check
      embed = Discord::Embed.new(
        colour: 0xffff00,
        image: Discord::EmbedImage.new(
          url: "https://chart.googleapis.com/chart?cht=qr&chs=512x512&chl=#{args.join("+")}"
        )
      )
      BOT.create_message(payload.channel_id, "", embed)
    end
  end
end
