module Granz
  module Amiibo
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if (payload.content.starts_with? PREFIX[0] + "amiibo") || (payload.content.starts_with? PREFIX[1] + "amiibo") || (payload.content.starts_with? PREFIX[2] + "amiibo") || (payload.content.starts_with? PREFIX[3] + "amiibo") || (payload.content.starts_with? PREFIX[4] + "amiibo")
        pres = payload.content.gsub("#{PREFIX[1]} ", "#{PREFIX[1]}").gsub("#{PREFIX[3]} ", "#{PREFIX[3]}")
        argscount = pres.split(" ")
        if argscount.size > 2
          embed = Discord::Embed.new(
            colour: 0xffff00,
            title: "Too many arguments"
          )
          BOT.create_message(payload.channel_id, "", embed)
        elsif argscount.size > 1
          argss = pres.gsub("amiibo ", "").gsub("#{PREFIX[1]} ", "").gsub("#{PREFIX[1]}", "").gsub("#{PREFIX[3]}", "").gsub("#{PREFIX[3]} ", "").gsub("#{PREFIX[0]}", "")
          begin
            response = HTTP::Client.get "http://www.amiiboapi.com/api/amiibo/?name=#{argss}"
            value = JSON.parse(response.body)
            img = value["amiibo"][0]["image"]
            eu = value["amiibo"][0]["release"]["eu"]
            au = value["amiibo"][0]["release"]["au"]
            jp = value["amiibo"][0]["release"]["jp"]
            na = value["amiibo"][0]["release"]["na"]

            embed = Discord::Embed.new(
              title: "#{value["amiibo"][0]["character"]}",
              timestamp: Time.now,
              colour: 0xffff00,
              footer: Discord::EmbedFooter.new(
                text: "\xE3\x80\x8EGeop\xE3\x80\x8F#4066",
                icon_url: "https://cdn.discordapp.com/avatars/216156825978929152/c7eaee00bbe99b16304429fb9b9116ea.png"
              ),
              thumbnail: Discord::EmbedThumbnail.new(
                url: "#{img}"
              ),
              author: Discord::EmbedAuthor.new(
                name: "Granz#8561",
                icon_url: "https://cdn.discordapp.com/avatars/443053627419000833/333d3868fa0837e800e6515558fd8179.png"
              ),
              fields: [Discord::EmbedField.new(
                name: "__Amiibo Series__",
                value: "#{value["amiibo"][0]["amiiboSeries"]}"
              ),
                       Discord::EmbedField.new(
                         name: "__Game Series__",
                         value: "#{value["amiibo"][0]["gameSeries"]}"
                       ),
                       Discord::EmbedField.new(
                         name: "__Release Day__",
                         value: "**AU:** #{au}\n**EU:** #{eu}\n**JP:** #{jp}\n**NA:** #{na}"
                       ),
              ]
            )
            BOT.create_message(payload.channel_id, "", embed)
          rescue
            embed = Discord::Embed.new(
              colour: 0xffff00,
              title: "I am afraid there is not such user in existance"
            )
            BOT.create_message(payload.channel_id, "", embed)
          end
        else
          embed = Discord::Embed.new(
            colour: 0xffff00,
            title: "Too few arguments"
          )
          BOT.create_message(payload.channel_id, "", embed)
        end
      end
    end
  end
end
