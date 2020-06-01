module Granz
  command = Command.new("uptime", "utilities", "#{CONFIG["prefix"]}uptime", "#{CONFIG["prefix"]}uptime", "Returns the amount of time the bot has been up")
  Granz::COMMANDS[command.name] = command

  module Commands
    module Uptime
      command_info = {"name" => "whois"}
      extend self

      def execute(payload : Discord::Message, args : Array(String))
        time = Time.utc - UPTIMER
        embed = Discord::Embed.new(

          colour: 0xffff00,
          title: "I've been up for:",
          description: "#{time.hours} Hours, #{time.minutes} Minutes, #{time.seconds} Seconds"
        )
        BOT.create_message(payload.channel_id, "", embed)
      end
    end
  end
end
