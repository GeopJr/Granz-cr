module Granz
  command = Command.new("smug", "roleplay", "#{CONFIG["prefix"]}smug", "#{CONFIG["prefix"]}smug", "Smugs")
  Granz::COMMANDS[command.name] = command

  module Commands
    module Smug
      extend self

      def execute(payload : Discord::Message, args : Array(String))
        response = HTTP::Client.get "https://nekos.life/api/v2/img/smug"
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
