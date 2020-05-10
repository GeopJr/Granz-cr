module Granz
  command = Command.new("choose", "fun", "#{CONFIG["prefix"]}choose <choice1|choice2|choiceN>", "#{CONFIG["prefix"]}choose chocolate|ice cream", "Chooses something between the given choices")
  Granz::COMMANDS << command
  module Choose
    BOT.on_message_create do |payload|
      next if payload.author.bot
      next unless Prefix_check.new(command.name, payload.content).check
      next BOT.create_message(payload.channel_id, "", Discord::Embed.new(colour: 0xff0000, title: "Sorry, I only respond on guilds")) unless CACHE.resolve_channel(payload.channel_id).type.guild_text?
      args = Args.new(command.name, payload.content).args
      next if Min_max_arg.new(1, args.size, 1, BOT, payload.channel_id).check
      choices = args.join(" ").split("|")
      next BOT.create_message(payload.channel_id, "", Discord::Embed.new(colour: 0xff0000, title: "Please provide at least 2 choices")) unless choices.size > 1
      embed = Discord::Embed.new(
        title: "Hmm, I pick :",
        description: "#{choices.sample}",
        colour: 0xffff00,
      )
      BOT.create_message(payload.channel_id, "", embed)
    end
  end
end
