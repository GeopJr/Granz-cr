module Granz
  module Lowercase
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if PREFIX.any? { |p| payload.content.starts_with?("#{p}lowercase") }
        pres = payload.content.gsub("#{PREFIX[1]} ", "#{PREFIX[1]}").gsub("#{PREFIX[3]} ", "#{PREFIX[3]}")
        argscount = pres.split(" ")
        if argscount.size > 1
          acro = pres.gsub("lowercase ", "").gsub("#{PREFIX[1]} ", "").gsub("#{PREFIX[1]}", "").gsub("#{PREFIX[3]}", "").gsub("#{PREFIX[3]} ", "").gsub("#{PREFIX[0]}", "")
          begin
            embed = Discord::Embed.new(
              
              colour: 0xffff00,
              title: "#{acro.downcase}"
            )
            BOT.create_message(payload.channel_id, "", embed)
          rescue
            embed = Discord::Embed.new(
              
              colour: 0xffff00,
              title: "Error",
              url: "https://geopjr.xyz"
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
