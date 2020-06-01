module Granz
  command = Command.new("norris", "fun", "#{CONFIG["prefix"]}norris", "#{CONFIG["prefix"]}norris", "Returns a Chuck Norris joke")
  Granz::COMMANDS[command.name] = command

  module Commands
    module Norris
      extend self

      def execute(payload : Discord::Message, args : Array(String))
        response = HTTP::Client.get "http://api.icndb.com/jokes/random"
        return BOT.create_message(payload.channel_id, "", Discord::Embed.new(colour: 0xff0000, title: "API returned #{response.status_code}")) unless response.status_code == 200
        value = JSON.parse(response.body)
        embed = Discord::Embed.new(
          colour: 0xffff00,
          title: "#{value["value"]["joke"].as_s}",
        )
        BOT.create_message(payload.channel_id, "", embed)
      end
    end
  end
end
