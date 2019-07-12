module Granz
  module Acronym
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if PREFIX.any? { |p| payload.content.starts_with?("#{p}acronym") }
        no_space = payload.content.gsub("#{PREFIX[1]} ", "#{PREFIX[1]}").gsub("#{PREFIX[3]} ", "#{PREFIX[3]}")
        args_count = no_space.split(" ")
        if args_count.size > 2
          embed = Discord::Embed.new(
            colour: 0xffff00,
            title: "Too many arguments"
          )
          BOT.create_message(payload.channel_id, "", embed)
        elsif args_count.size > 1
          text = no_space.gsub("acronym ", "").gsub("#{PREFIX[1]}", "").gsub("#{PREFIX[3]}", "").gsub("#{PREFIX[0]}", "")
          doesnt_match = Discord::Embed.new(
            colour: 0xffff00,
            title: "Only Latin Letters Please"
          )
          next BOT.create_message(payload.channel_id, "", doesnt_match) unless text.match(/^[a-zA-Z_\-+ ]*$/)
          begin
            response = HTTP::Client.get "https://api.chew.pro/acronym/#{text}"
            value = JSON.parse(response.body)
            embed = Discord::Embed.new(

              colour: 0xffff00,
              title: "#{text} Stands For :",
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
