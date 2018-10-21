module Granz
  module Acronym
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if (payload.content.starts_with? PREFIX[0] + "acronym") || (payload.content.starts_with? PREFIX[1] + "acronym") || (payload.content.starts_with? PREFIX[2] + "acronym") || (payload.content.starts_with? PREFIX[3] + "acronym") || (payload.content.starts_with? PREFIX[4] + "acronym")
        pres = payload.content.gsub("#{PREFIX[1]} ", "#{PREFIX[1]}").gsub("#{PREFIX[3]} ", "#{PREFIX[3]}")
        argscount = pres.split(" ")
        if argscount.size > 2
          embed = Discord::Embed.new(
            colour: 0xffff00,
            title: "Too many arguments"
          )
          BOT.create_message(payload.channel_id, "", embed)
        elsif argscount.size > 1
          acro = pres.gsub("acronym ", "").gsub("#{PREFIX[1]} ", "").gsub("#{PREFIX[1]}", "").gsub("#{PREFIX[3]}", "").gsub("#{PREFIX[3]} ", "").gsub("#{PREFIX[0]}", "")
          embeded = Discord::Embed.new(
            timestamp: Time.now,
            colour: 0xffff00,
            title: "Only Latin Letters Please"
          )
          next BOT.create_message(payload.channel_id, "", embeded) unless acro.match(/^[a-zA-Z_\-+ ]*$/)
          begin
            response = HTTP::Client.get "https://api.chew.pro/acronym/#{acro}"
            value = JSON.parse(response.body)
            embed = Discord::Embed.new(
              timestamp: Time.now,
              colour: 0xffff00,
              title: "#{acro} Stands For :",
              description: "#{value["phrase"]}"
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
