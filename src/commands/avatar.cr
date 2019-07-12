module Granz
  module Avatar
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if PREFIX.any? { |p| payload.content.starts_with?("#{p}avatar") }
        no_space = payload.content.gsub("#{PREFIX[1]} ", "#{PREFIX[1]}").gsub("#{PREFIX[3]} ", "#{PREFIX[3]}")
        args_count = no_space.split(" ")
        if args_count.size > 2
          embed = Discord::Embed.new(
            colour: 0xffff00,
            title: "Too many arguments"
          )
          BOT.create_message(payload.channel_id, "", embed)
        elsif args_count.size > 1
          mentioned_user = payload.mentions[0]
          begin
            if (mentioned_user)
              embed = Discord::Embed.new(

                colour: 0xffff00,
                image: Discord::EmbedImage.new(
                  url: "https://cdn.discordapp.com/avatars/#{mentioned_user.id}/#{mentioned_user.avatar}.webp?size=1024"
                )
              )
            else
              embed = Discord::Embed.new(

                colour: 0xffff00,
                title: "Mention a user"
              )
            end
            BOT.create_message(payload.channel_id, "", embed)
          rescue
            embed = Discord::Embed.new(
              colour: 0xffff00,
              title: "Mention a user"
            )
            BOT.create_message(payload.channel_id, "", embed)
          end
        elsif args_count.size == 1
          begin
            embed = Discord::Embed.new(

              colour: 0xffff00,
              image: Discord::EmbedImage.new(
                url: "https://cdn.discordapp.com/avatars/#{payload.author.id}/#{payload.author.avatar}.webp?size=1024"
              )
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
