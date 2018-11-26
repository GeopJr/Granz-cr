module Granz
  module Uptime
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if PREFIX.any? { |p| payload.content.starts_with?("#{p}uptime") }
        begin
          timee = Time.now - UPTIMER
          embed = Discord::Embed.new(
            
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
