module Granz
  module Pat
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if PREFIX.any? { |p| payload.content.starts_with?("#{p}pat") }
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
                description: "<@#{payload.author.id}> Sorry , you can't pat yourself :cry:. But I can pat you if you want :blush:"
              )
              BOT.create_message(payload.channel_id, "", embed)
            elsif mentioned_user.id != payload.author.id
              response = HTTP::Client.get "https://nekos.life/api/v2/img/pat"
              value = JSON.parse(response.body)
              embed = Discord::Embed.new(
                image: Discord::EmbedImage.new(
                  url: "#{value["url"]}"
                ),
                colour: 0xffff00,
                description: "<@#{mentioned_user.id}> , you received a pat from <@#{payload.author.id}> :blush:"
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
