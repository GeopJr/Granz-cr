module Granz
  command = Command.new("rate", "fun", "#{CONFIG["prefix"]}rate <something>", "#{CONFIG["prefix"]}rate <something>", "Rates something on a scale of 0-10", true)
  Granz::COMMANDS[command.name] = command

  module Commands
    module Rate
      extend self

      def execute(payload : Discord::Message, args : Array(String))
        return false if Granz::Args.min(1, args, payload.channel_id)

        random_number = rand(1..100)

        embed = Discord::Embed.new(
          description: "I give **#{args.join(" ")}** a **#{random_number / 10}/10**",
          colour: 0xffff00,
        )
        BOT.create_message(payload.channel_id, "", embed)
      end
    end
  end
end
