module Granz
  module Poke
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if PREFIX.any? { |p| payload.content.starts_with?("#{p}poke") }
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
          argss = pres.gsub("poke ", "").gsub("#{PREFIX[1]} ", "").gsub("#{PREFIX[1]}", "").gsub("#{PREFIX[3]}", "").gsub("#{PREFIX[3]} ", "").gsub("#{PREFIX[0]}", "")
          begin
            if mentioned_user[0].id == payload.author.id
              embed = Discord::Embed.new(
                colour: 0xffff00,
                description: "<@#{payload.author.id}> Sorry , you can't poke yourself :cry:. But I can poke you if you want :blush:"
              )
              BOT.create_message(payload.channel_id, "", embed)
            elsif mentioned_user[0].id == 443053627419000833_u64
              embed = Discord::Embed.new(
                colour: 0xffff00,
                title: "NO"
              )
              BOT.create_message(payload.channel_id, "", embed)
            elsif mentioned_user[0].id != payload.author.id
              response = HTTP::Client.get "https://nekos.life/api/v2/img/poke"
              value = JSON.parse(response.body)
              embed = Discord::Embed.new(
                image: Discord::EmbedImage.new(
                  url: "#{value["url"]}"
                ),
                colour: 0xffff00,
                description: "<@#{mentioned_user[0].id}> , got poked by <@#{payload.author.id}> :point_right:"
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
