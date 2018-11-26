module Granz
  module Noticeme
    BOT.on_message_create do |payload|
      next if payload.author.bot
      begin
        if PREFIX.any? { |p| payload.content.starts_with?("#{p}noticeme") }
          embed = Discord::Embed.new(
            description: "<@#{payload.author.id}>, I notice you :relaxed:",
            colour: 0xffff00
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
