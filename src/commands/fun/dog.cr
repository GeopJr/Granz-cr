module Granz
  command = Command.new("dog", "fun", "#{CONFIG["prefix"]}dog", "#{CONFIG["prefix"]}dog", "Returns an image of a dog")
  Granz::COMMANDS[command.name] = command

  module Commands
    module Dog
      extend self

      def execute(payload : Discord::Message, args : Array(String))
        response = HTTP::Client.get "https://nekos.life/api/v2/img/woof"
        return BOT.create_message(payload.channel_id, "", Discord::Embed.new(colour: 0xff0000, title: "API returned #{response.status_code}")) unless response.status_code == 200
        value = JSON.parse(response.body)
        embed = Discord::Embed.new(

          colour: 0xffff00,
          image: Discord::EmbedImage.new(
            url: "#{value["url"].as_s}"
          )
        )
        BOT.create_message(payload.channel_id, "", embed)
      end
    end
  end
end
