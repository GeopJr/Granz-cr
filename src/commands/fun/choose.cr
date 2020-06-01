module Granz
  command = Command.new("choose", "fun", "#{CONFIG["prefix"]}choose <choice1|choice2|choiceN>", "#{CONFIG["prefix"]}choose chocolate|ice cream", "Chooses something between the given choices", true)
  Granz::COMMANDS[command.name] = command

  module Commands
    module Choose
      extend self

      def execute(payload : Discord::Message, args : Array(String))
        return false if Granz::Args.min(1, args, payload.channel_id)
        choices = args.join(" ").split(/ ?\| ?/)
        return BOT.create_message(payload.channel_id, "", Discord::Embed.new(colour: 0xff0000, title: "Please provide at least 2 choices")) unless choices.size > 1
        embed = Discord::Embed.new(
          title: "Hmm, I pick :",
          description: "#{choices.sample}",
          colour: 0xffff00,
        )
        BOT.create_message(payload.channel_id, "", embed)
      end
    end
  end
end
