module Granz
  module Achievement
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if PREFIX.any? { |p| payload.content.starts_with?("#{p}achievement") }
        no_space = payload.content.gsub("#{PREFIX[1]} ", "#{PREFIX[1]}").gsub("#{PREFIX[3]} ", "#{PREFIX[3]}")
        args_count = no_space.split(" ")
        if args_count.size > 1
          args = no_space.gsub("achievement ", "").gsub("#{PREFIX[1]}", "").gsub("#{PREFIX[3]}", "").gsub("#{PREFIX[0]}", "")
          id = args.split(" ")[0]
          text = args.gsub("#{id} ", "").split("|")
          begin
            embed = Discord::Embed.new(
              title: "Achievement Unlocked",

              colour: 0xffff00,
              image: Discord::EmbedImage.new(
                url: "https://www.minecraftskinstealer.com/achievement/a.php?i=#{id.gsub("+", "%2B").gsub(" ", "+")}&h=#{text[0].gsub("+", "%2B").gsub(" ", "+")}&t=#{text[1].gsub("+", "%2B").gsub(" ", "+")}"
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
