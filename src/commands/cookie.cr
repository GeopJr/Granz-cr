module Granz
  module Cookie
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if (payload.content.starts_with? PREFIX[0] + "cookie") || (payload.content.starts_with? PREFIX[1] + "cookie") || (payload.content.starts_with? PREFIX[2] + "cookie") || (payload.content.starts_with? PREFIX[3] + "cookie") || (payload.content.starts_with? PREFIX[4] + "cookie")
        channel = BOT.get_channel(payload.channel_id)
        begin
          response = HTTP::Client.get "http://www.yerkee.com/api/fortune"
          value = JSON.parse(response.body)
          embed = Discord::Embed.new(
            timestamp: Time.now,
            colour: 0xffff00,
            title: "#{value["fortune"].as_s}"
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
