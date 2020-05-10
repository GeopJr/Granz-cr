module Granz
  command = Command.new("yesno", "fun", "#{CONFIG["prefix"]}yesno", "#{CONFIG["prefix"]}yesno", "Replies positively or negatively")
  Granz::COMMANDS << command
  module Yesno
    BOT.on_message_create do |payload|
      next if payload.author.bot
      next unless Prefix_check.new(command.name, payload.content).check
      next BOT.create_message(payload.channel_id, "", Discord::Embed.new(colour: 0xff0000, title: "Sorry, I only respond on guilds")) unless CACHE.resolve_channel(payload.channel_id).type.guild_text?
      arr = ["Yes.", "No.", "Negative.", "Positive.", "Sure.", "Nah."]
      embed = Discord::Embed.new(
        title: "#{arr.sample.to_s}",

        colour: 0xffff00,
      )
      BOT.create_message(payload.channel_id, "", embed)
    end
  end
end
