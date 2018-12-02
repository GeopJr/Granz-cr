module Granz
  module Tanki
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if PREFIX.any? { |p| payload.content.starts_with?("#{p}tanki") }
        pres = payload.content.gsub("#{PREFIX[1]} ", "#{PREFIX[1]}").gsub("#{PREFIX[3]} ", "#{PREFIX[3]}")
        argscount = pres.split(" ")
        if argscount.size > 1
          begin
            argss = pres.gsub("tanki ", "").gsub("#{PREFIX[1]} ", "").gsub("#{PREFIX[1]}", "").gsub("#{PREFIX[3]}", "").gsub("#{PREFIX[3]} ", "").gsub("#{PREFIX[0]}", "")
            response = HTTP::Client.get "https://ratings.tankionline.com/api/eu/profile/?user=#{argss}"
            value = JSON.parse(response.body)
            if value["responseType"] == "OK"
              responsee = HTTP::Client.get "https://api.myjson.com/bins/15dlne"
              valuee = JSON.parse(responsee.body).as_h
              aaa = valuee.merge({"#{payload.author.id}" => "#{value["response"]["name"]}"})

              headersss = HTTP::Headers{"User-agent" => "GranzBot", "Content-Type" => "application/json"}
              bodyyy = aaa.to_json
              HTTP::Client.put("https://api.myjson.com/bins/15dlne", headers: headersss, body: bodyyy) do |res|
                statusss = res.status_code
                if statusss != 200
                  puts "Uh oh! Register returned : #{statusss}!"
                end
              end

              embed = Discord::Embed.new(
                colour: 0xffff00,
                title: "Your username was set to: #{value["response"]["name"]}"
              )
              BOT.create_message(payload.channel_id, "", embed)
            else
              embed = Discord::Embed.new(
                colour: 0xffff00,
                title: "User Not Found"
              )
              BOT.create_message(payload.channel_id, "", embed)
            end
          rescue
            embed = Discord::Embed.new(
              colour: 0xffff00,
              title: "Error",
              url: "https://granz.geopjr.xyz"
            )
            BOT.create_message(payload.channel_id, "", embed)
          end
        else
          begin
            embed = Discord::Embed.new(
              colour: 0xffff00,
              title: "Things changed!",
              description: "For ratings use: __**#{PREFIX[0]}tratings <username>**__\n\nFor weekly ratings use: __**#{PREFIX[0]}tweekly <username>**__\n\nFor supplies use: __**#{PREFIX[0]}tsupplies <username>**__\n\n**IF YOU WANT TO SET YOUR USERNAME DO __#{PREFIX[0]}tanki <username>__**"
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
