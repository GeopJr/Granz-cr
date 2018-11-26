module Granz
  module Avatar
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if PREFIX.any? { |p| payload.content.starts_with?("#{p}avatar") }
        pres = payload.content.gsub("#{PREFIX[1]} ", "#{PREFIX[1]}").gsub("#{PREFIX[3]} ", "#{PREFIX[3]}")
        argscount = pres.split(" ")
        if argscount.size > 2
          embed = Discord::Embed.new(
            colour: 0xffff00,
            title: "Too many arguments"
          )
          BOT.create_message(payload.channel_id, "", embed)
        elsif argscount.size > 1
          mentioned_user = payload.mentions
          begin
            if (mentioned_user[0] == payload.author) || (mentioned_user[0] != payload.author)
              embed = Discord::Embed.new(
                
                colour: 0xffff00,
                image: Discord::EmbedImage.new(
                  url: "https://cdn.discordapp.com/avatars/#{mentioned_user[0].id}/#{mentioned_user[0].avatar}.webp?size=1024"
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
        elsif argscount.size == 1
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
