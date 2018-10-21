module Granz
  module Ping
    BOT.on_message_create do |payload|
      next if payload.author.bot
      begin
        if (payload.content.starts_with? PREFIX[0] + "ping") || (payload.content.starts_with? PREFIX[1] + "ping") || (payload.content.starts_with? PREFIX[2] + "ping") || (payload.content.starts_with? PREFIX[3] + "ping") || (payload.content.starts_with? PREFIX[4] + "ping")
          time = Time.utc_now - payload.timestamp
          embed = Discord::Embed.new(
            title: ":ping_pong: Pong! :ping_pong: (#{time.total_milliseconds.round(0)} ms.)",
            timestamp: Time.now,
            colour: 0xffff00,
          )
          BOT.create_message(payload.channel_id, "", embed)
        end
      rescue
        embed = Discord::Embed.new(
          title: "Error",
          url: "https://granz.geopjr.xyz"
        )
        BOT.create_message(payload.channel_id, "", embed)
      end
    end
  end
end
