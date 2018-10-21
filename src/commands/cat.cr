module Granz
  module Cat
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if (payload.content.starts_with? PREFIX[0] + "cat") || (payload.content.starts_with? PREFIX[1] + "cat") || (payload.content.starts_with? PREFIX[2] + "cat") || (payload.content.starts_with? PREFIX[3] + "cat") || (payload.content.starts_with? PREFIX[4] + "cat")
        channel = BOT.get_channel(payload.channel_id)
        begin
          response = HTTP::Client.get "http://shibe.online/api/cats?count=1"
          value = JSON.parse(response.body)
          embed = Discord::Embed.new(
            timestamp: Time.now,
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
