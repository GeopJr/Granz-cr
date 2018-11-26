module Granz
  module Slots
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if PREFIX.any? { |p| payload.content.starts_with?("#{p}slots") }
        pres = payload.content.gsub("#{PREFIX[1]} ", "#{PREFIX[1]}").gsub("#{PREFIX[3]} ", "#{PREFIX[3]}")
        argscount = pres.split(" ")
        if argscount.size > 1
          mentioned_user = payload.mentions
          argss = pres.gsub("slots ", "").gsub("#{PREFIX[1]} ", "").gsub("#{PREFIX[1]}", "").gsub("#{PREFIX[3]}", "").gsub("#{PREFIX[3]} ", "").gsub("#{PREFIX[0]}", "")
          begin
            responsee = HTTP::Client.get "url_for_db"
            value = JSON.parse(responsee.body).as_h
            valuue = JSON.parse(responsee.body)
            argsss = argss.to_i
            baramoji = "<:baracoin:508999232775258112><:baracoin:508999232775258112><:baracoin:508999232775258112>"
            if argsss < 1
              emmbeed = Discord::Embed.new(
                title: "No negative numbers",
                thumbnail: Discord::EmbedThumbnail.new(
                  url: "https://i.imgur.com/2K7FXik.png"
                ),
                colour: 0xffff00
              )
              BOT.create_message(payload.channel_id, "", emmbeed)
            else
              if value["#{payload.author.id}"]?
                if valuue["#{payload.author.id}"]["baracoins"].to_s.to_i < argsss
                  emmbed = Discord::Embed.new(
                    title: "You don't have enough coins",
                    thumbnail: Discord::EmbedThumbnail.new(
                      url: "https://i.imgur.com/2K7FXik.png"
                    ),
                    colour: 0xffff00
                  )
                  BOT.create_message(payload.channel_id, "", emmbed)
                else
                  rancheck = rand(1..100)

                  stat = [
                    "💩",
                    "☘",
                    "💣",
                    "❌",
                    "⚰",
                    "<:baracoin:508999232775258112>",
                  ]

                  staat = [
                    "💩",
                    "💣",
                    "❌",
                    "⚰",
                  ]

                  if rancheck <= 5
                    bacc = valuue["#{payload.author.id}"]["background"]
                    slogann = valuue["#{payload.author.id}"]["slogan"]
                    eggss = valuue["#{payload.author.id}"]["eggplants"]
                    barcoins = valuue["#{payload.author.id}"]["baracoins"]
                    baracoinss = barcoins.to_s.to_i + argsss + argsss
                    aaa = value.merge({"#{payload.author.id}" => {"username" => "#{payload.author.username}", "discriminator" => "#{payload.author.discriminator}", "background" => bacc, "baracoins" => baracoinss, "eggplants" => eggss, "slogan" => slogann, "avatar" => "#{payload.author.avatar}"}})

                    headersss = HTTP::Headers{"User-agent" => "GranzBot", "Content-Type" => "application/json"}
                    bodyyy = aaa.to_json
                    HTTP::Client.put("url_for_db", headers: headersss, body: bodyyy) do |res|
                      statusss = res.status_code
                      if statusss != 200
                        puts "Uh oh! Register returned : #{statusss}!"
                      end
                    end
                    wonn = "**WON**"
                    watt = argsss + argsss
                    wlat = "#{baramoji}"
                  elsif (rancheck > 5) && (rancheck <= 50)
                    bacc = valuue["#{payload.author.id}"]["background"]
                    slogann = valuue["#{payload.author.id}"]["slogan"]
                    eggss = valuue["#{payload.author.id}"]["eggplants"]
                    barcoins = valuue["#{payload.author.id}"]["baracoins"]
                    baracoinss = barcoins.to_s.to_i + argsss
                    aaa = value.merge({"#{payload.author.id}" => {"username" => "#{payload.author.username}", "discriminator" => "#{payload.author.discriminator}", "background" => bacc, "baracoins" => baracoinss, "eggplants" => eggss, "slogan" => slogann, "avatar" => "#{payload.author.avatar}"}})

                    headersss = HTTP::Headers{"User-agent" => "GranzBot", "Content-Type" => "application/json"}
                    bodyyy = aaa.to_json
                    HTTP::Client.put("url_for_db", headers: headersss, body: bodyyy) do |res|
                      statusss = res.status_code
                      if statusss != 200
                        puts "Uh oh! Register returned : #{statusss}!"
                      end
                    end
                    wonn = "**WON**"
                    watt = argsss
                    wlat = "☘☘☘"
                  else
                    bacc = valuue["#{payload.author.id}"]["background"]
                    slogann = valuue["#{payload.author.id}"]["slogan"]
                    eggss = valuue["#{payload.author.id}"]["eggplants"]
                    barcoins = valuue["#{payload.author.id}"]["baracoins"]
                    baracoinss = barcoins.to_s.to_i - argsss
                    aaa = value.merge({"#{payload.author.id}" => {"username" => "#{payload.author.username}", "discriminator" => "#{payload.author.discriminator}", "background" => bacc, "baracoins" => baracoinss, "eggplants" => eggss, "slogan" => slogann, "avatar" => "#{payload.author.avatar}"}})

                    headersss = HTTP::Headers{"User-agent" => "GranzBot", "Content-Type" => "application/json"}
                    bodyyy = aaa.to_json
                    HTTP::Client.put("url_for_db", headers: headersss, body: bodyyy) do |res|
                      statusss = res.status_code
                      if statusss != 200
                        puts "Uh oh! Register returned : #{statusss}!"
                      end
                    end
                    wonn = "**LOST**"
                    watt = argsss
                    wlat = "#{staat.sample}#{staat.sample}#{staat.sample}"
                  end

                  embed = Discord::Embed.new(
                    title: "You #{wonn}:",
                    description: "--#{stat.sample}#{stat.sample}#{stat.sample}--\n\n> #{wlat} <\n\n--#{stat.sample}#{stat.sample}#{stat.sample}--\n\nYou #{wonn} #{watt} coins!",
                    thumbnail: Discord::EmbedThumbnail.new(
                      url: "https://i.imgur.com/2K7FXik.png"
                    ),
                    colour: 0xffff00
                  )
                  BOT.create_message(payload.channel_id, "", embed)
                end
              else
                embed = Discord::Embed.new(
                  colour: 0xffff00,
                  title: "User not registered!",
                  description: "Type #{PREFIX[0]}register to give coins!"
                )
                BOT.create_message(payload.channel_id, "", embed)
              end
            end
          rescue
            embed = Discord::Embed.new(
              colour: 0xffff00,
              title: "Usage:",
              description: "#{PREFIX[0]}slots <number>"
            )
            BOT.create_message(payload.channel_id, "", embed)
          end
        else
          embed = Discord::Embed.new(
            colour: 0xffff00,
            title: "Usage:",
            description: "#{PREFIX[0]}slots <number>"
          )
          BOT.create_message(payload.channel_id, "", embed)
        end
      end
    end
  end
end
