module Granz
  module Bara
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if (payload.content.starts_with? PREFIX[0] + "bara") || (payload.content.starts_with? PREFIX[1] + "bara") || (payload.content.starts_with? PREFIX[2] + "bara") || (payload.content.starts_with? PREFIX[3] + "bara") || (payload.content.starts_with? PREFIX[4] + "bara")
        channel = BOT.get_channel(payload.channel_id)
        embeded = Discord::Embed.new(
          colour: 0xffff00,
          image: Discord::EmbedImage.new(
            url: "https://i.imgur.com/yVs6TqV.gif"
          ),
          title: "I'm sorry. I can't do that because this is a SFW channel."
        )
        next BOT.create_message(payload.channel_id, "", embeded) unless channel.nsfw == true
        begin
          response = HTTP::Client.get "https://baraapi.herokuapp.com/random.php"
          value = JSON.parse(response.body)
          embed = Discord::Embed.new(
            title: "Link",
            url: "#{value["link"]}",
            colour: 0xffff00,
            image: Discord::EmbedImage.new(
              url: "#{value["link"].as_s}"
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
