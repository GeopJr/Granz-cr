module Granz
  module Pikachu
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if PREFIX.any? { |p| payload.content.starts_with?("#{p}pikachu") }
        begin
          response = HTTP::Client.get "https://api-to.get-a.life/pikachuimg"
          value = JSON.parse(response.body)
          embed = Discord::Embed.new(

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
