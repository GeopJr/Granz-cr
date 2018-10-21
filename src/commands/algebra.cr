module Granz
  module Algebra
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if (payload.content.starts_with? PREFIX[0] + "algebra") || (payload.content.starts_with? PREFIX[1] + "algebra") || (payload.content.starts_with? PREFIX[2] + "algebra") || (payload.content.starts_with? PREFIX[3] + "algebra") || (payload.content.starts_with? PREFIX[4] + "algebra")
        pres = payload.content.gsub("#{PREFIX[1]} ", "#{PREFIX[1]}").gsub("#{PREFIX[3]} ", "#{PREFIX[3]}")
        argscount = pres.split(" ")
        if argscount.size > 1
          argss = pres.gsub("algebra ", "").gsub("#{PREFIX[1]} ", "").gsub("#{PREFIX[1]}", "").gsub("#{PREFIX[3]}", "").gsub("#{PREFIX[3]} ", "").gsub("#{PREFIX[0]}", "")
          argsss = argss.split(" ").join("").gsub("+", "%2B").gsub("=", "%3D").gsub("/", "%2F").gsub(",", "%2C").gsub(".", "%2E")
          begin
            embed = Discord::Embed.new(
              colour: 0xffff00,
              image: Discord::EmbedImage.new(
                url: "https://chart.googleapis.com/chart?cht=tx&chl=#{argsss}"
              )
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
