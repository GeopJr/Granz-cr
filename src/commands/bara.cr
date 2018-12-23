module Granz
  module Bara
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if PREFIX.any? { |p| payload.content.starts_with?("#{p}bara") }
        channel = BOT.get_channel(payload.channel_id)
	if guild_id = channel.guild_id
          begin
            BOT.delete_message(payload.channel_id, payload.id)
          rescue
          end
        else
        end
        embeded = Discord::Embed.new(
          colour: 0xffff00,
          image: Discord::EmbedImage.new(
            url: "https://i.imgur.com/yVs6TqV.gif"
          ),
          title: "I'm sorry. I can't do that because this is a SFW channel."
        )
        next BOT.create_message(payload.channel_id, "", embeded) unless channel.nsfw == true

        response = HTTP::Client.get "https://barapi.geopjr.xyz/json"
        value = JSON.parse(response.body)
        pres = payload.content.gsub("#{PREFIX[1]} ", "#{PREFIX[1]}").gsub("#{PREFIX[3]} ", "#{PREFIX[3]}")
        argscount = pres.split(" ")
        if argscount.size > 1
          begin
            acro = pres.gsub("bara ", "").gsub("#{PREFIX[1]} ", "").gsub("#{PREFIX[1]}", "").gsub("#{PREFIX[3]}", "").gsub("#{PREFIX[3]} ", "").gsub("#{PREFIX[0]}", "")
            if (acro.to_i64 <= value["totalImages"].as_i) && (acro.to_i64 >= 0)
            responsee = HTTP::Client.get "https://barapi.geopjr.xyz/json?num=#{acro.to_i64}"
            vvalue = JSON.parse(responsee.body)
              embed = Discord::Embed.new(
                title: "Link",
                url: "#{vvalue["link"]}",
                colour: 0xffff00,
                footer: Discord::EmbedFooter.new(
                  text: "##{acro.to_i64}"
                ),
                image: Discord::EmbedImage.new(
                  url: "#{vvalue["link"].as_s}"
                )
              )
              BOT.create_message(payload.channel_id, "", embed)
            else
              embed = Discord::Embed.new(
                title: "Link",
                url: "#{value["link"]}",
                colour: 0xffff00,
                footer: Discord::EmbedFooter.new(
                  text: "##{value["imageNum"]}"
                ),
                image: Discord::EmbedImage.new(
                  url: "#{value["link"].as_s}"
                )
              )
              BOT.create_message(payload.channel_id, "", embed)
            end
          rescue
            embed = Discord::Embed.new(
              title: "Link",
              url: "#{value["link"]}",
              colour: 0xffff00,
              footer: Discord::EmbedFooter.new(
                text: "##{value["imageNum"]}"
              ),
              image: Discord::EmbedImage.new(
                url: "#{value["link"].as_s}"
              )
            )
            BOT.create_message(payload.channel_id, "", embed)
          end
        else
          begin
            embed = Discord::Embed.new(
              title: "Link",
              url: "#{value["link"]}",
              colour: 0xffff00,
              footer: Discord::EmbedFooter.new(
                text: "##{value["imageNum"]}"
              ),
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
end
