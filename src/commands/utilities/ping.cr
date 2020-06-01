module Granz
  command = Command.new("ping", "utilities", "#{CONFIG["prefix"]}ping", "#{CONFIG["prefix"]}ping", "Returns \"Pong!\" with the amount of time it took it to reply")
  Granz::COMMANDS[command.name] = command

  module Commands
    module Ping
      extend self

      def execute(payload : Discord::Message, args : Array(String))
        time = Time.utc - payload.timestamp
        embed = Discord::Embed.new(
          title: ":ping_pong: Pong! :ping_pong: (#{time.total_milliseconds.round(0)} ms.)",

          colour: 0xffff00,
        )
        BOT.create_message(payload.channel_id, "", embed)
      end
    end
  end
end
