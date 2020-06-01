module Granz
  command = Command.new("mcskin", "gaming", "#{CONFIG["prefix"]}mcskin <uuid>", "#{CONFIG["prefix"]}mcskin 870629c31ddb49f0a940e20abff3df55", "Returns the skin of the provided uuid", true)
  Granz::COMMANDS[command.name] = command

  module Commands
    module Mcskin
      extend self

      def execute(payload : Discord::Message, args : Array(String))
        return false if Granz::Args.min(1, args, payload.channel_id)
        return false if Granz::Args.max(1, args, payload.channel_id)
        uuid = args[0]
        response = HTTP::Client.get "https://crafatar.com/renders/body/#{uuid}?overlay"
        return BOT.create_message(payload.channel_id, "", Discord::Embed.new(colour: 0xff0000, title: "UUIDs ONLY", description: "Use `#{CONFIG["prefix"]}mcuuid <username>` to get yours")) if response.status_code == 422
        return BOT.create_message(payload.channel_id, "", Discord::Embed.new(colour: 0xff0000, title: "API returned #{response.status_code}")) unless response.status_code == 200

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
end
