module Granz
  module Restart
    BOT.on_message_create do |payload|
      next if payload.author.bot
      next unless Prefix_check.new("restart", payload.content).check
      next unless payload.author.id == CONFIG["my_id"].to_s.to_u64
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Restarting"
      )
      BOT.create_message(payload.channel_id, "", embed)
      BOT.stop
      exit
    end
  end
end
