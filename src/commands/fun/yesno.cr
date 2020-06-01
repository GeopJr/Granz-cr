module Granz
  command = Command.new("yesno", "fun", "#{CONFIG["prefix"]}yesno", "#{CONFIG["prefix"]}yesno", "Replies positively or negatively", true)
  Granz::COMMANDS[command.name] = command

  module Commands
    module Yesno
      extend self

      def execute(payload : Discord::Message, args : Array(String))
        arr = ["Yes.", "No.", "Negative.", "Positive.", "Sure.", "Nah."]
        embed = Discord::Embed.new(
          title: "#{arr.sample.to_s}",

          colour: 0xffff00,
        )
        BOT.create_message(payload.channel_id, "", embed)
      end
    end
  end
end
