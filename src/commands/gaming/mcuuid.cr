module Granz
  command = Command.new("mcuuid", "gaming", "#{CONFIG["prefix"]}mcuuid <name>", "#{CONFIG["prefix"]}mcskin Geop_Junior", "Returns the uuid of the provided username", true)
  Granz::COMMANDS[command.name] = command

  module Commands
    module Mcuuid
      extend self

      def execute(payload : Discord::Message, args : Array(String))
        return false if Granz::Args.min(1, args, payload.channel_id)
        return false if Granz::Args.max(1, args, payload.channel_id)

        response = HTTP::Client.get "https://api.mojang.com/users/profiles/minecraft/#{args[0]}"
        return BOT.create_message(payload.channel_id, "", Discord::Embed.new(colour: 0xff0000, title: "Name was not found")) if response.status_code == 404
        return BOT.create_message(payload.channel_id, "", Discord::Embed.new(colour: 0xff0000, title: "API returned #{response.status_code}")) unless response.status_code == 200
        value = JSON.parse(response.body)
        head = HTTP::Client.get "https://crafatar.com/renders/head/#{value["id"]}?overlay"
        return BOT.create_message(payload.channel_id, "", Discord::Embed.new(colour: 0xff0000, title: "API returned #{response.status_code}")) unless head.status_code == 200

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
end
