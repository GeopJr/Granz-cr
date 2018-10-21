module Granz
  module Bo4
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if (payload.content.starts_with? PREFIX[0] + "bo4") || (payload.content.starts_with? PREFIX[1] + "bo4") || (payload.content.starts_with? PREFIX[2] + "bo4") || (payload.content.starts_with? PREFIX[3] + "bo4") || (payload.content.starts_with? PREFIX[4] + "bo4")
        pres = payload.content.gsub("#{PREFIX[1]} ", "#{PREFIX[1]}").gsub("#{PREFIX[3]} ", "#{PREFIX[3]}")
        argscount = pres.split(" ")
        if argscount.size > 3
          embed = Discord::Embed.new(
            colour: 0xffff00,
            title: "Too many arguments"
          )
          BOT.create_message(payload.channel_id, "", embed)
        elsif argscount.size > 2
          argss = pres.gsub("bo4 ", "").gsub("#{PREFIX[1]} ", "").gsub("#{PREFIX[1]}", "").gsub("#{PREFIX[3]}", "").gsub("#{PREFIX[3]} ", "").gsub("#{PREFIX[0]}", "")
          begin
            argsss = argss.split(" ")
            response = HTTP::Client.get "https://bo4tracker.com/api/stats/bo4/#{argsss[0]}/#{argsss[1]}"
            value = JSON.parse(response.body)

            timee = value["stats"]["timeplayed"].as_i / 3600

            embed = Discord::Embed.new(
              title: "#{value["user"]["username"]}",
              timestamp: Time.now,
              colour: 0xffff00,
              thumbnail: Discord::EmbedThumbnail.new(
                url: "#{value["user"]["avatar"]}"
              ),
              author: Discord::EmbedAuthor.new(
                name: "Granz#8561",
                icon_url: "https://cdn.discordapp.com/avatars/443053627419000833/333d3868fa0837e800e6515558fd8179.png"
              ),
              fields: [Discord::EmbedField.new(
                name: "__Identifier__",
                value: "#{value["identifier"]}",
                inline: true
              ),
                       Discord::EmbedField.new(
                         name: "__ID__",
                         value: "#{value["user"]["id"]}",
                         inline: true
                       ),
                       Discord::EmbedField.new(
                         name: "__Level__",
                         value: "#{value["stats"]["level"]}"
                       ),
                       Discord::EmbedField.new(
                         name: "__RankXp__",
                         value: "#{value["stats"]["rankxp"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}",
                         inline: true
                       ),
                       Discord::EmbedField.new(
                         name: "__Time Played__",
                         value: "#{timee.round(0)} Hours",
                         inline: true
                       ),
                       Discord::EmbedField.new(
                         name: "__Kills__",
                         value: "#{value["stats"]["kills"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                       ),
                       Discord::EmbedField.new(
                         name: "__Kills Confirmed__",
                         value: "#{value["stats"]["killsconfirmed"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                       ),
                       Discord::EmbedField.new(
                         name: "__Kills Denied__",
                         value: "#{value["stats"]["killsdenied"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                       ),
                       Discord::EmbedField.new(
                         name: "__Deaths__",
                         value: "#{value["stats"]["deaths"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                       ),
                       Discord::EmbedField.new(
                         name: "__Wins__",
                         value: "#{value["stats"]["wins"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                       ),
                       Discord::EmbedField.new(
                         name: "__Losses__",
                         value: "#{value["stats"]["losses"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                       ),
                       Discord::EmbedField.new(
                         name: "__Hits__",
                         value: "#{value["stats"]["hits"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                       ),
                       Discord::EmbedField.new(
                         name: "__Misses__",
                         value: "#{value["stats"]["misses"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                       ),

                       Discord::EmbedField.new(
                         name: "__Total Heals__",
                         value: "#{value["stats"]["totalheals"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                       ),
                       Discord::EmbedField.new(
                         name: "__EKIA__",
                         value: "#{value["stats"]["ekia"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                       ),
                       Discord::EmbedField.new(
                         name: "__Current Winstreak__",
                         value: "#{value["stats"]["curwinstreak"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                       ),
                       Discord::EmbedField.new(
                         name: "__Longest Winstreak__",
                         value: "#{value["stats"]["longestkillstreak"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                       ),
                       Discord::EmbedField.new(
                         name: "__Team Kills__",
                         value: "#{value["stats"]["teamkills"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                       ),
                       Discord::EmbedField.new(
                         name: "__Suicides__",
                         value: "#{value["stats"]["suicides"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                       ),
                       Discord::EmbedField.new(
                         name: "__Offends__",
                         value: "#{value["stats"]["offends"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                       ),
                       Discord::EmbedField.new(
                         name: "__Captures__",
                         value: "#{value["stats"]["captures"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                       ),

                       Discord::EmbedField.new(
                         name: "__Defends__",
                         value: "#{value["stats"]["defends"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                       ),

              ]
            )
            BOT.create_message(payload.channel_id, "", embed)
          rescue
            embed = Discord::Embed.new(
              colour: 0xffff00,
              title: "I am afraid there is not such user in existance",
              description: "Try a different platform (psn/xbl/steam/bnet)"
            )
            BOT.create_message(payload.channel_id, "", embed)
          end
        else
          embed = Discord::Embed.new(
            colour: 0xffff00,
            title: "Too few arguments",
            description: "Platforms (psn/xbl/steam/bnet)"
          )
          BOT.create_message(payload.channel_id, "", embed)
        end
      end
    end
  end
end
