module Granz
  module Bird
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if PREFIX.any? { |p| payload.content.starts_with?("#{p}bird") }
        channel = BOT.get_channel(payload.channel_id)
        begin
          response = HTTP::Client.get "http://shibe.online/api/birds?count=1"
          value = JSON.parse(response.body)
          embed = Discord::Embed.new(
            
            colour: 0xffff00,
            image: Discord::EmbedImage.new(
              url: "#{value[0].as_s}"
            )
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
