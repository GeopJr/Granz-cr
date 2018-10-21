module Granz
  module Mcuuid
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if (payload.content.starts_with? PREFIX[0] + "mcuuid") || (payload.content.starts_with? PREFIX[1] + "mcuuid") || (payload.content.starts_with? PREFIX[2] + "mcuuid") || (payload.content.starts_with? PREFIX[3] + "mcuuid") || (payload.content.starts_with? PREFIX[4] + "mcuuid")
        pres = payload.content.gsub("#{PREFIX[1]} ", "#{PREFIX[1]}").gsub("#{PREFIX[3]} ", "#{PREFIX[3]}")
        argscount = pres.split(" ")
        if argscount.size > 2
          embed = Discord::Embed.new(
            colour: 0xffff00,
            title: "Too many arguments"
          )
          BOT.create_message(payload.channel_id, "", embed)
        elsif argscount.size > 1
          argss = pres.gsub("mcuuid ", "").gsub("#{PREFIX[1]} ", "").gsub("#{PREFIX[1]}", "").gsub("#{PREFIX[3]}", "").gsub("#{PREFIX[3]} ", "").gsub("#{PREFIX[0]}", "")
          begin
            response = HTTP::Client.get "https://api.mojang.com/users/profiles/minecraft/#{argss}"
            value = JSON.parse(response.body)
            embed = Discord::Embed.new(
              timestamp: Time.now,
              colour: 0xffff00,
              title: "#{value["name"].as_s}'s UUID is:",
              description: "#{value["id"].as_s}",
              thumbnail: Discord::EmbedThumbnail.new(
                url: "https://crafatar.com/renders/head/#{value["id"]}?overlay"
              )
            )
            BOT.create_message(payload.channel_id, "", embed)
          rescue
            embed = Discord::Embed.new(
              colour: 0xffff00,
              title: "User Not Found"
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
