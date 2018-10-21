module Granz
  module Achievement
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if (payload.content.starts_with? PREFIX[0] + "achievement") || (payload.content.starts_with? PREFIX[1] + "achievement") || (payload.content.starts_with? PREFIX[2] + "achievement") || (payload.content.starts_with? PREFIX[3] + "achievement") || (payload.content.starts_with? PREFIX[4] + "achievement")
        pres = payload.content.gsub("#{PREFIX[1]} ", "#{PREFIX[1]}").gsub("#{PREFIX[3]} ", "#{PREFIX[3]}")
        argscount = pres.split(" ")
        if argscount.size > 1
          argss = pres.gsub("achievement ", "").gsub("#{PREFIX[1]} ", "").gsub("#{PREFIX[1]}", "").gsub("#{PREFIX[3]}", "").gsub("#{PREFIX[3]} ", "").gsub("#{PREFIX[0]}", "")
          id = argss.split(" ")
          mooor = argss.gsub("#{id[0]} ", "").split("|")
          begin
            embed = Discord::Embed.new(
              title: "Achievement Unlocked",
              timestamp: Time.now,
              colour: 0xffff00,
              image: Discord::EmbedImage.new(
                url: "https://www.minecraftskinstealer.com/achievement/a.php?i=#{id[0].gsub("+", "%2B").gsub(" ", "+")}&h=#{mooor[0].gsub("+", "%2B").gsub(" ", "+")}&t=#{mooor[1].gsub("+", "%2B").gsub(" ", "+")}"
              )
            )
            BOT.create_message(payload.channel_id, "", embed)
          rescue
            embed = Discord::Embed.new(
              colour: 0xffff00,
              title: "Error",
              description: "**#{PREFIX[0]}achievement <id> <title>|<description>**\n\nThe id's are located [__here__](https://granz.geopjr.xyz/ids.html)"
            )
            BOT.create_message(payload.channel_id, "", embed)
          end
        else
          embed = Discord::Embed.new(
            colour: 0xffff00,
            title: "Too few arguments",
            description: "**#{PREFIX[0]}achievement <id> <title>|<description>**\n\nThe id's are located [__here__](https://granz.geopjr.xyz/ids.html)"
          )
          BOT.create_message(payload.channel_id, "", embed)
        end
      end
    end
  end
end
