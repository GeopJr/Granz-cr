module Granz
  command = Command.new("coffee", "fun", "#{CONFIG["prefix"]}coffee", "#{CONFIG["prefix"]}coffee", "Returns an image of coffee")
  Granz::COMMANDS[command.name] = command

  module Commands
    module Coffee
      extend self

      def execute(payload : Discord::Message, args : Array(String))
        response = HTTP::Client.get "https://coffee.alexflipnote.dev/random.json"
        return BOT.create_message(payload.channel_id, "", Discord::Embed.new(colour: 0xff0000, title: "API returned #{response.status_code}")) unless response.status_code == 200
        value = JSON.parse(response.body)
        embed = Discord::Embed.new(

          colour: 0xffff00,
          image: Discord::EmbedImage.new(
            url: "#{value["file"].as_s}"
          )
        )
        BOT.create_message(payload.channel_id, "", embed)
      end
    end
  end
end
