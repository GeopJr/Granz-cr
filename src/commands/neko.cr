module Granz
  module Neko
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if PREFIX.any? { |p| payload.content.starts_with?("#{p}neko") }
        channel = BOT.get_channel(payload.channel_id)
        nsfw_warning = Discord::Embed.new(
          colour: 0xffff00,
          image: Discord::EmbedImage.new(
            url: "https://i.imgur.com/yVs6TqV.gif"
          ),
          title: "I'm sorry. I can't do that because this is a SFW channel."
        )
        next BOT.create_message(payload.channel_id, "", nsfw_warning) unless channel.nsfw == true
        begin
          response = HTTP::Client.get "https://nekos.life/api/lewd/neko"
          value = JSON.parse(response.body)
          embed = Discord::Embed.new(

            colour: 0xffff00,
            image: Discord::EmbedImage.new(
              url: "#{value["neko"].as_s}"
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
