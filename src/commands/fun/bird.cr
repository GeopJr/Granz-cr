module Granz
  command = Command.new("bird", "fun", "#{CONFIG["prefix"]}bird", "#{CONFIG["prefix"]}bird", "Returns an image of a bird")
  Granz::COMMANDS[command.name] = command

  module Commands
    module Bird
      extend self

      def execute(payload : Discord::Message, args : Array(String))
        response = HTTP::Client.get "http://shibe.online/api/birds?count=1"
        return BOT.create_message(payload.channel_id, "", Discord::Embed.new(colour: 0xff0000, title: "API returned #{response.status_code}")) unless response.status_code == 200
        value = JSON.parse(response.body)
        embed = Discord::Embed.new(

          colour: 0xffff00,
          image: Discord::EmbedImage.new(
            url: "#{value[0].as_s}"
          )
        )
        BOT.create_message(payload.channel_id, "", embed)
      end
    end
  end
end
