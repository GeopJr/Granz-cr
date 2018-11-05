module Granz
  module Background
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if (payload.content.starts_with? PREFIX[0] + "background") || (payload.content.starts_with? PREFIX[1] + "background") || (payload.content.starts_with? PREFIX[2] + "background") || (payload.content.starts_with? PREFIX[3] + "background") || (payload.content.starts_with? PREFIX[4] + "background")
        pres = payload.content.gsub("#{PREFIX[1]} ", "#{PREFIX[1]}").gsub("#{PREFIX[3]} ", "#{PREFIX[3]}")
        argscount = pres.split(" ")
        if argscount.size > 1
          argss = pres.gsub("background ", "").gsub("#{PREFIX[1]} ", "").gsub("#{PREFIX[1]}", "").gsub("#{PREFIX[3]}", "").gsub("#{PREFIX[3]} ", "").gsub("#{PREFIX[0]}", "")
          begin
            responsee = HTTP::Client.get "url_for_db"
            value = JSON.parse(responsee.body).as_h
            valuue = JSON.parse(responsee.body)
            argsss = argss.to_i
            if value["#{payload.author.id}"]?
              if (0..10) === argsss
                slogann = valuue["#{payload.author.id}"]["slogan"]
                eggss = valuue["#{payload.author.id}"]["eggplants"]
                barcoins = valuue["#{payload.author.id}"]["baracoins"]
                aaa = value.merge({"#{payload.author.id}" => {"username" => "#{payload.author.username}", "discriminator" => "#{payload.author.discriminator}", "background" => argsss, "baracoins" => barcoins, "eggplants" => eggss, "slogan" => slogann, "avatar" => "#{payload.author.avatar}"}})

                headersss = HTTP::Headers{"User-agent" => "GranzBot", "Content-Type" => "application/json"}
                bodyyy = aaa.to_json
                HTTP::Client.put("url_for_db", headers: headersss, body: bodyyy) do |res|
                  statusss = res.status_code
                  if statusss != 200
                    puts "Uh oh! Register returned : #{statusss}!"
                  end
                end

                embed = Discord::Embed.new(
                  title: "Your background got changed to:",
                  description: "#{argsss}",
                  colour: 0xffff00
                )
                BOT.create_message(payload.channel_id, "", embed)
              else
                embed = Discord::Embed.new(
                  title: "Use numbers between 0 - 10",
                  description: "The backgrounds are located [here](https://imgur.com/a/Rb81ip7)\nThe backgrounds match their corresponding numbers",
                  colour: 0xffff00
                )
                BOT.create_message(payload.channel_id, "", embed)
              end
            else
              embed = Discord::Embed.new(
                colour: 0xffff00,
                title: "User not registered!",
                description: "Type #{PREFIX[0]}register to register!"
              )
              BOT.create_message(payload.channel_id, "", embed)
            end
          rescue
            embed = Discord::Embed.new(
              title: "Use numbers between 0 - 10",
              description: "The backgrounds are located [here](https://imgur.com/a/Rb81ip7)\nThe backgrounds match their corresponding numbers",
              colour: 0xffff00
            )
            BOT.create_message(payload.channel_id, "", embed)
          end
        else
          embed = Discord::Embed.new(
            colour: 0xffff00,
            title: "Usage:",
            description: "#{PREFIX[0]}background <number>\nThe backgrounds are located [here](https://imgur.com/a/Rb81ip7)\nThe backgrounds match their corresponding numbers"
          )
          BOT.create_message(payload.channel_id, "", embed)
        end
      end
    end
  end
end
