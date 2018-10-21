module Granz
  module Coffee
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if (payload.content.starts_with? PREFIX[0] + "coffee") || (payload.content.starts_with? PREFIX[1] + "coffee") || (payload.content.starts_with? PREFIX[2] + "coffee") || (payload.content.starts_with? PREFIX[3] + "coffee") || (payload.content.starts_with? PREFIX[4] + "coffee")
        channel = BOT.get_channel(payload.channel_id)
        begin
          response = HTTP::Client.get "https://coffee.alexflipnote.xyz/random.json"
          value = JSON.parse(response.body)
          embed = Discord::Embed.new(
            timestamp: Time.now,
            colour: 0xffff00,
            image: Discord::EmbedImage.new(
              url: "#{value["file"].as_s}"
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
