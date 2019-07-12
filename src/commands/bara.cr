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
            # BOT probably doesn't have perms or something
          end
        end
        nsfw_warning = Discord::Embed.new(
          colour: 0xffff00,
          image: Discord::EmbedImage.new(
            url: "https://i.imgur.com/yVs6TqV.gif"
          ),
          title: "I'm sorry. I can't do that because this is a SFW channel."
        )
        next BOT.create_message(payload.channel_id, "", nsfw_warning) unless channel.nsfw == true

        response = HTTP::Client.get "http://barapi.geopjr.xyz/json.php"
        value = JSON.parse(response.body)
        no_space = payload.content.gsub("#{PREFIX[1]} ", "#{PREFIX[1]}").gsub("#{PREFIX[3]} ", "#{PREFIX[3]}")
        args_count = no_space.split(" ")
        if args_count.size > 1
          begin
            args = no_space.gsub("bara ", "").gsub("#{PREFIX[1]}", "").gsub("#{PREFIX[3]}", "").gsub("#{PREFIX[0]}", "")
            if (args.to_i64 <= value["totalImages"].as_i) && (args.to_i64 >= 0)
              response_num = HTTP::Client.get "http://barapi.geopjr.xyz/json.php?num=#{args.to_i64}"
              value_num = JSON.parse(response_num.body)
              embed = Discord::Embed.new(
                title: "Link",
                url: "#{value_num["link"]}",
                colour: 0xffff00,
                footer: Discord::EmbedFooter.new(
                  text: "##{args.to_i64}"
                ),
                image: Discord::EmbedImage.new(
                  url: "#{value_num["link"].as_s}"
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
