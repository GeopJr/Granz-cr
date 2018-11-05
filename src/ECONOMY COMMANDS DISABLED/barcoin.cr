module Granz
  module Barcoin
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if (payload.content.starts_with? PREFIX[0] + "barcoin") || (payload.content.starts_with? PREFIX[1] + "barcoin") || (payload.content.starts_with? PREFIX[2] + "barcoin") || (payload.content.starts_with? PREFIX[3] + "barcoin") || (payload.content.starts_with? PREFIX[4] + "barcoin")
        pres = payload.content.gsub("#{PREFIX[1]} ", "#{PREFIX[1]}").gsub("#{PREFIX[3]} ", "#{PREFIX[3]}")
        argscount = pres.split(" ")
        if payload.author.id == CONFIG["my_id"].to_s.to_u64
          if argscount.size > 1
            mentioned_user = payload.mentions
            argss = pres.gsub("barcoin ", "").gsub("#{PREFIX[1]} ", "").gsub("#{PREFIX[1]}", "").gsub("#{PREFIX[3]}", "").gsub("#{PREFIX[3]} ", "").gsub("#{PREFIX[0]}", "").gsub("<@#{mentioned_user[0].id}> ", "").gsub("<@!#{mentioned_user[0].id}> ", "")
            begin
              responsee = HTTP::Client.get "url_for_db"
              value = JSON.parse(responsee.body).as_h
              valuue = JSON.parse(responsee.body)
              argsss = argss.to_i
              if value["#{mentioned_user[0].id}"]?
                bacc = valuue["#{mentioned_user[0].id}"]["background"]
                slogann = valuue["#{mentioned_user[0].id}"]["slogan"]
                eggss = valuue["#{mentioned_user[0].id}"]["eggplants"]
                barcoins = valuue["#{mentioned_user[0].id}"]["baracoins"]
                baracoinss = barcoins.to_s.to_i + argsss
                aaa = value.merge({"#{mentioned_user[0].id}" => {"username" => "#{mentioned_user[0].username}", "discriminator" => "#{mentioned_user[0].discriminator}", "background" => bacc, "baracoins" => baracoinss, "eggplants" => eggss, "slogan" => slogann, "avatar" => "#{mentioned_user[0].avatar}"}})

                headersss = HTTP::Headers{"User-agent" => "GranzBot", "Content-Type" => "application/json"}
                bodyyy = aaa.to_json
                HTTP::Client.put("url_for_db", headers: headersss, body: bodyyy) do |res|
                  statusss = res.status_code
                  if statusss != 200
                    puts "Uh oh! Register returned : #{statusss}!"
                  end
                end

                embed = Discord::Embed.new(
                  title: "You gave #{mentioned_user[0].username}:",
                  description: "#{argsss} coins!",
                  thumbnail: Discord::EmbedThumbnail.new(
                    url: "https://i.imgur.com/2K7FXik.png"
                  ),
                  colour: 0xffff00
                )
                BOT.create_message(payload.channel_id, "", embed)
              else
                embed = Discord::Embed.new(
                  colour: 0xffff00,
                  title: "User not registered!",
                  description: "Type #{PREFIX[0]}register to give coins!"
                )
                BOT.create_message(payload.channel_id, "", embed)
              end
            rescue
              embed = Discord::Embed.new(
                title: "Error",
                colour: 0xffff00
              )
              BOT.create_message(payload.channel_id, "", embed)
            end
          else
            embed = Discord::Embed.new(
              colour: 0xffff00,
              title: "Usage:",
              description: "#{PREFIX[0]}barcoin <user> <number>"
            )
            BOT.create_message(payload.channel_id, "", embed)
          end
        end
      end
    end
  end
end
