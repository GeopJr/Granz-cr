module Granz
  module Maths
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if (payload.content.starts_with? PREFIX[0] + "maths") || (payload.content.starts_with? PREFIX[1] + "maths") || (payload.content.starts_with? PREFIX[2] + "maths") || (payload.content.starts_with? PREFIX[3] + "maths") || (payload.content.starts_with? PREFIX[4] + "maths")
        pres = payload.content.gsub("#{PREFIX[1]} ", "#{PREFIX[1]}").gsub("#{PREFIX[3]} ", "#{PREFIX[3]}")
        argscount = pres.split(" ")
        if argscount.size > 3
          embed = Discord::Embed.new(
            colour: 0xffff00,
            title: "Too many arguments"
          )
          BOT.create_message(payload.channel_id, "", embed)
        elsif argscount.size > 2
          acro = pres.gsub("maths ", "").gsub("#{PREFIX[1]} ", "").gsub("#{PREFIX[1]}", "").gsub("#{PREFIX[3]}", "").gsub("#{PREFIX[3]} ", "").gsub("#{PREFIX[0]}", "")
          aeee = acro.split(" ")
          aooo = aeee.join(" ").gsub("#{aeee[0]} ", "")
          begin
            response = HTTP::Client.get "https://newton.now.sh/#{aeee[0].downcase}/#{aooo}"
            value = JSON.parse(response.body)
            embed = Discord::Embed.new(
              timestamp: Time.now,
              colour: 0xffff00,
              title: "Advanced Maths:",
              fields: [Discord::EmbedField.new(
                name: "__Operation__",
                value: "#{value["operation"]}"
              ),
                       Discord::EmbedField.new(
                         name: "__Expression__",
                         value: "#{value["expression"]}"
                       ),
                       Discord::EmbedField.new(
                         name: "__Result__",
                         value: "#{value["result"]}"
                       ),
              ]
            )
            BOT.create_message(payload.channel_id, "", embed)
          rescue
            embed = Discord::Embed.new(
              colour: 0xffff00,
              title: "Usage :",
              description: "#{PREFIX[0]}maths <operation> <expression>",
              url: "https://granz.geopjr.xyz/operations"
            )
            BOT.create_message(payload.channel_id, "", embed)
          end
        else
          embed = Discord::Embed.new(
            colour: 0xffff00,
            title: "Too few arguments",
            description: "#{PREFIX[0]}maths <operation> <expression>",
            url: "https://granz.geopjr.xyz/operations"
          )
          BOT.create_message(payload.channel_id, "", embed)
        end
      end
    end
  end
end
