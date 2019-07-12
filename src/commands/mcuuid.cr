module Granz
  module Mcuuid
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if PREFIX.any? { |p| payload.content.starts_with?("#{p}mcuuid") }
        no_space = payload.content.gsub("#{PREFIX[1]} ", "#{PREFIX[1]}").gsub("#{PREFIX[3]} ", "#{PREFIX[3]}")
        args_count = no_space.split(" ")
        if args_count.size > 2
          embed = Discord::Embed.new(
            colour: 0xffff00,
            title: "Too many arguments"
          )
          BOT.create_message(payload.channel_id, "", embed)
        elsif args_count.size > 1
          args = no_space.gsub("mcuuid ", "").gsub("#{PREFIX[1]}", "").gsub("#{PREFIX[3]}", "").gsub("#{PREFIX[0]}", "")
          begin
            response = HTTP::Client.get "https://api.mojang.com/users/profiles/minecraft/#{args}"
            value = JSON.parse(response.body)
            embed = Discord::Embed.new(

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
