module Granz
  module Slogan
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if PREFIX.any? { |p| payload.content.starts_with?("#{p}slogan") }
        pres = payload.content.gsub("#{PREFIX[1]} ", "#{PREFIX[1]}").gsub("#{PREFIX[3]} ", "#{PREFIX[3]}")
        argscount = pres.split(" ")
        if argscount.size > 1
          argss = pres.gsub("slogan ", "").gsub("#{PREFIX[1]} ", "").gsub("#{PREFIX[1]}", "").gsub("#{PREFIX[3]}", "").gsub("#{PREFIX[3]} ", "").gsub("#{PREFIX[0]}", "")
          begin
          responsee = HTTP::Client.get "url_for_db"
          value = JSON.parse(responsee.body).as_h
          valuue = JSON.parse(responsee.body)
          if value["#{payload.author.id}"]?
            if argss.size <= 15
              bacc = valuue["#{payload.author.id}"]["background"]
              eggss = valuue["#{payload.author.id}"]["eggplants"]
              barcoins = valuue["#{payload.author.id}"]["baracoins"]
              aaa = value.merge({"#{payload.author.id}" => {"username" => "#{payload.author.username}", "discriminator" => "#{payload.author.discriminator}", "background" => bacc, "baracoins" => barcoins, "eggplants" => eggss, "slogan" => "#{argss}", "avatar" => "#{payload.author.avatar}"}})

            headersss = HTTP::Headers{"User-agent" => "GranzBot", "Content-Type" => "application/json"}
            bodyyy = aaa.to_json
            HTTP::Client.put("url_for_db", headers: headersss, body: bodyyy) do |res|
              statusss = res.status_code
              if statusss != 200
                puts "Uh oh! Register returned : #{statusss}!"
              end
            end

            embed = Discord::Embed.new(
              title: "Your slogan got changed to:",
              description: "#{argss}",
              colour: 0xffff00
            )
            BOT.create_message(payload.channel_id, "", embed)
            else
              embed = Discord::Embed.new(
              title: "Too many characters, keep it under 15!\nYou can also use the online dashboard [here](https://economy.geopjr.xyz/account)",
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
              colour: 0xffff00,
              title: "Error",
              url: "https://geopjr.xyz"
            )
            BOT.create_message(payload.channel_id, "", embed)
          end
        else
          embed = Discord::Embed.new(
            colour: 0xffff00,
            title: "Usage:",
            description: "#{PREFIX[0]}slogan <anything>\nYou can also use the online dashboard [here](https://economy.geopjr.xyz/account)"
          )
          BOT.create_message(payload.channel_id, "", embed)
        end
      end
    end
  end
end
