module Granz
  command = Command.new("trump", "fun", "#{CONFIG["prefix"]}trump", "#{CONFIG["prefix"]}trump", "Returns a Trump quote")
  Granz::COMMANDS[command.name] = command

  module Commands
    module Trump
      extend self

      def execute(payload : Discord::Message, args : Array(String))
        response = HTTP::Client.get "https://api.whatdoestrumpthink.com/api/v1/quotes/random"
        return BOT.create_message(payload.channel_id, "", Discord::Embed.new(colour: 0xff0000, title: "API returned #{response.status_code}")) unless response.status_code == 200
        value = JSON.parse(response.body)
        embed = Discord::Embed.new(

          colour: 0xffff00,
          title: "#{value["message"].as_s}"
        )
        BOT.create_message(payload.channel_id, "", embed)
      end
    end
  end
end
