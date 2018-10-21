module Granz
  module Ratehusbando
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if (payload.content.starts_with? PREFIX[0] + "ratehusbando") || (payload.content.starts_with? PREFIX[1] + "ratehusbando") || (payload.content.starts_with? PREFIX[2] + "ratehusbando") || (payload.content.starts_with? PREFIX[3] + "ratehusbando") || (payload.content.starts_with? PREFIX[4] + "ratehusbando")
        pres = payload.content.gsub("#{PREFIX[1]} ", "#{PREFIX[1]}").gsub("#{PREFIX[3]} ", "#{PREFIX[3]}")
        argscount = pres.split(" ")
        if argscount.size > 1
          arr = (0..100).to_a
          argss = pres.gsub("ratehusbando ", "").gsub("#{PREFIX[1]} ", "").gsub("#{PREFIX[1]}", "").gsub("#{PREFIX[3]}", "").gsub("#{PREFIX[3]} ", "").gsub("#{PREFIX[0]}", "")
          begin
            embed = Discord::Embed.new(
              title: "Husbando O' Meter",
              description: "My rating for **#{argss}** is **#{arr.sample}/100** :prince:",
              timestamp: Time.now,
              colour: 0xffff00,
            )
            BOT.create_message(payload.channel_id, "", embed)
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
            title: "Too few arguments"
          )
          BOT.create_message(payload.channel_id, "", embed)
        end
      end
    end
  end
end
