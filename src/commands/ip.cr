module Granz
  module Ip
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if (payload.content.starts_with? PREFIX[0] + "ip") || (payload.content.starts_with? PREFIX[1] + "ip") || (payload.content.starts_with? PREFIX[2] + "ip") || (payload.content.starts_with? PREFIX[3] + "ip") || (payload.content.starts_with? PREFIX[4] + "ip")
        pres = payload.content.gsub("#{PREFIX[1]} ", "#{PREFIX[1]}").gsub("#{PREFIX[3]} ", "#{PREFIX[3]}")
        argscount = pres.split(" ")
        if argscount.size > 2
          embed = Discord::Embed.new(
            colour: 0xffff00,
            title: "Too many arguments"
          )
          BOT.create_message(payload.channel_id, "", embed)
        elsif argscount.size > 1
          acro = pres.gsub("ip ", "").gsub("#{PREFIX[1]} ", "").gsub("#{PREFIX[1]}", "").gsub("#{PREFIX[3]}", "").gsub("#{PREFIX[3]} ", "").gsub("#{PREFIX[0]}", "")
          begin
            response = HTTP::Client.get "https://ipvigilante.com/json/#{acro}"
            value = JSON.parse(response.body)
            embed = Discord::Embed.new(
              timestamp: Time.now,
              colour: 0xffff00,
              title: "IP INFO :",
              fields: [Discord::EmbedField.new(
                name: "__ipv4__",
                value: "#{value["data"]["ipv4"]}"
              ),
                       Discord::EmbedField.new(
                         name: "__Continent__",
                         value: "#{value["data"]["continent_name"]}"
                       ),
                       Discord::EmbedField.new(
                         name: "__Country__",
                         value: "#{value["data"]["country_name"]}"
                       ),
                       Discord::EmbedField.new(
                         name: "__Location__",
                         value: "Lat: #{value["data"]["latitude"]}\nLong: #{value["data"]["longitude"]}\nOther:\n#{value["data"]["subdivision_1_name"]}\n#{value["data"]["city_name"]}\n#{value["data"]["subdivision_2_name"]}"
                       ),
              ]
            )
            BOT.create_message(payload.channel_id, "", embed)
          rescue
            embed = Discord::Embed.new(
              colour: 0xffff00,
              title: "Not found!"
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
