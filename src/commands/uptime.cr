module Granz
  module Uptime
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if (payload.content.starts_with? PREFIX[0] + "uptime") || (payload.content.starts_with? PREFIX[1] + "uptime") || (payload.content.starts_with? PREFIX[2] + "uptime") || (payload.content.starts_with? PREFIX[3] + "uptime") || (payload.content.starts_with? PREFIX[4] + "uptime")
        begin
          timee = Time.now - UPTIMER
          embed = Discord::Embed.new(
            timestamp: Time.now,
            colour: 0xffff00,
            title: "I've been up for:",
            description: "#{timee.hours} Hours, #{timee.minutes} Minutes, #{timee.seconds} Seconds"
          )
          BOT.create_message(payload.channel_id, "", embed)
        rescue
          embed = Discord::Embed.new(
            colour: 0xffff00,
            title: "Error",
            url: "https://granz.geopjr.xyz"
          )
          BOT.create_message(payload.channel_id, "", embed)
        end
      end
    end
  end
end
