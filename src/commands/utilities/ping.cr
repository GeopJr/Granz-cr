module Granz
  module Ping
    BOT.on_message_create do |payload|
      next if payload.author.bot
      next unless Prefix_check.new("ping", payload.content).check
      time = Time.utc - payload.timestamp
      embed = Discord::Embed.new(
        title: ":ping_pong: Pong! :ping_pong: (#{time.total_milliseconds.round(0)} ms.)",

        colour: 0xffff00,
      )
      BOT.create_message(payload.channel_id, "", embed)
    end
  end
end
