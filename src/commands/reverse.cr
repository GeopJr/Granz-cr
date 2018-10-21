module Granz
  module Reverse
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if (payload.content.starts_with? PREFIX[0] + "reverse") || (payload.content.starts_with? PREFIX[1] + "reverse") || (payload.content.starts_with? PREFIX[2] + "reverse") || (payload.content.starts_with? PREFIX[3] + "reverse") || (payload.content.starts_with? PREFIX[4] + "reverse")
        pres = payload.content.gsub("#{PREFIX[1]} ", "#{PREFIX[1]}").gsub("#{PREFIX[3]} ", "#{PREFIX[3]}")
        argscount = pres.split(" ")
        if argscount.size > 1
          acro = pres.gsub("reverse ", "").gsub("#{PREFIX[1]} ", "").gsub("#{PREFIX[1]}", "").gsub("#{PREFIX[3]}", "").gsub("#{PREFIX[3]} ", "").gsub("#{PREFIX[0]}", "")
          begin
            embed = Discord::Embed.new(
              timestamp: Time.now,
              colour: 0xffff00,
              title: "#{acro.reverse.to_s}"
            )
            BOT.create_message(payload.channel_id, "", embed)
          rescue
            embed = Discord::Embed.new(
              timestamp: Time.now,
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
