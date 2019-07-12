module Granz
  module Neko
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if PREFIX.any? { |p| payload.content.starts_with?("#{p}furry") }
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
          args = payload.content.gsub("#{PREFIX[1]} ", "#{PREFIX[1]}").gsub("#{PREFIX[3]} ", "#{PREFIX[3]}").split(" ")
          if args.size > 1
            tags = args.join(" ").gsub("furry ", "").gsub("#{PREFIX[1]}", "").gsub("#{PREFIX[3]}", "").gsub("#{PREFIX[0]}", "")
            limit = 150
          elsif args.size == 1
            tags = ""
            limit = 220
          else
            tags = ""
            limit = 1
          end

          tagged_body = {"tags" => tags, "limit" => limit}.to_json
          response = HTTP::Client.post("https://e621.net/post/index.json", headers: HTTP::Headers{"User-Agent" => "Granz by GeopJr (geopjr@geopjr.xyz)", "Content-Type" => "application/json"}, body: tagged_body)
          bad_status = Discord::Embed.new(
            colour: 0xffff00,
            title: "API returned #{response.status_code}. Please wait a bit before using!"
          )
          next BOT.create_message(payload.channel_id, "", bad_status) unless response.status_code == 200

          value = JSON.parse(response.body)
          nothing_found = Discord::Embed.new(
            colour: 0xffff00,
            title: "Nothing found for those tags!"
          )
          next BOT.create_message(payload.channel_id, "", nothing_found) unless value.as_a.size != 0
          random_image = rand(0..value.as_a.size)
          embed = Discord::Embed.new(
            colour: 0xffff00,
            title: "Link",
            url: "#{value[random_image]["file_url"].as_s}",
            image: Discord::EmbedImage.new(
              url: "#{value[random_image]["file_url"].as_s}"
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
