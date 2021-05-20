module Granz
  command = Command.new("qrcode", "utilities", "#{CONFIG["prefix"]}qrcode <text>", "#{CONFIG["prefix"]}qrcode https://geopjr.dev/", "Returns a qrcode from the provided text", true)
  Granz::COMMANDS[command.name] = command

  module Commands
    module Qrcode
      extend self

      def execute(payload : Discord::Message, args : Array(String))
        return false if Granz::Args.min(1, args, payload.channel_id)
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
end
