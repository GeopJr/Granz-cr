module Granz
  module Twimg
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if PREFIX.any? { |p| payload.content.starts_with?("#{p}twimg") }
        pres = payload.content.gsub("#{PREFIX[1]} ", "#{PREFIX[1]}").gsub("#{PREFIX[3]} ", "#{PREFIX[3]}")
        argscount = pres.split(" ")
        if argscount.size > 1
          acro = pres.gsub("twimg ", "").gsub("#{PREFIX[1]} ", "").gsub("#{PREFIX[1]}", "").gsub("#{PREFIX[3]}", "").gsub("#{PREFIX[3]} ", "").gsub("#{PREFIX[0]}", "")
          begin
            query = acro.split("?")[-1]
            url_base = acro.split("?")[-2]
            url_ext = query.gsub("format=", ".").split("&")[0]
            url_formatted = url_base + url_ext + ":large"
            BOT.create_message(payload.channel_id, url_formatted)
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
