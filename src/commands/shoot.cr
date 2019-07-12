module Granz
  module Shoot
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if PREFIX.any? { |p| payload.content.starts_with?("#{p}shoot") }
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
            if mentioned_user.id == payload.author.id
              embed = Discord::Embed.new(
                colour: 0xffff00,
                description: "<@#{payload.author.id}> If you are feeling suicidal, talk to someone or call your country's suicide prevention hotline"
              )
              BOT.create_message(payload.channel_id, "", embed)
            elsif mentioned_user.id != payload.author.id
              arrr = ["https://i.imgur.com/l4cSv1H.gif", "https://i.imgur.com/eZ49dBC.gif"]
              embed = Discord::Embed.new(
                colour: 0xffff00,
                description: "<@#{mentioned_user.id}> , got shot by <@#{payload.author.id}> :gun:",
                image: Discord::EmbedImage.new(
                  url: "#{arrr.sample}"
                )
              )
              BOT.create_message(payload.channel_id, "", embed)
            else
              embed = Discord::Embed.new(
                colour: 0xffff00,
                title: "Mention a user"
              )
              BOT.create_message(payload.channel_id, "", embed)
            end
          rescue
            embed = Discord::Embed.new(
              colour: 0xffff00,
              title: "Mention a user"
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
