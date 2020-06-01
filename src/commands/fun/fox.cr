module Granz
  command = Command.new("fox", "fun", "#{CONFIG["prefix"]}fox", "#{CONFIG["prefix"]}fox", "Returns an image of a fox")
  Granz::COMMANDS[command.name] = command

  module Commands
    module Fox
      extend self

      def execute(payload : Discord::Message, args : Array(String))
        response = HTTP::Client.get "https://randomfox.ca/floof/"
        return BOT.create_message(payload.channel_id, "", Discord::Embed.new(colour: 0xff0000, title: "API returned #{response.status_code}")) unless response.status_code == 200
        value = JSON.parse(response.body)
        embed = Discord::Embed.new(

          colour: 0xffff00,
          image: Discord::EmbedImage.new(
            url: "#{value["image"].as_s}"
          )
        )
        BOT.create_message(payload.channel_id, "", embed)
      end
    end
  end
end
