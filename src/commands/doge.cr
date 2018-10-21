module Granz
  module Doge
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if (payload.content.starts_with? PREFIX[0] + "doge") || (payload.content.starts_with? PREFIX[1] + "doge") || (payload.content.starts_with? PREFIX[2] + "doge") || (payload.content.starts_with? PREFIX[3] + "doge") || (payload.content.starts_with? PREFIX[4] + "doge")
        channel = BOT.get_channel(payload.channel_id)
        begin
          response = HTTP::Client.get "http://shibe.online/api/shibes?count=1"
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
