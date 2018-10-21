module Granz
  module Google
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if (payload.content.starts_with? PREFIX[0] + "google") || (payload.content.starts_with? PREFIX[1] + "google") || (payload.content.starts_with? PREFIX[2] + "google") || (payload.content.starts_with? PREFIX[3] + "google") || (payload.content.starts_with? PREFIX[4] + "google")
        pres = payload.content.gsub("#{PREFIX[1]} ", "#{PREFIX[1]}").gsub("#{PREFIX[3]} ", "#{PREFIX[3]}")
        argscount = pres.split(" ")
        if argscount.size > 1
          argss = pres.gsub("google", "").split(" ")
          argsss = argss.delete_at(0)
          args = argss.join("+")
          begin
            embed = Discord::Embed.new(
              timestamp: Time.now,
              colour: 0xffff00,
              title: "<https://www.google.com/search?q=#{args}>",
              description: "Replying to: <@#{payload.author.id}>"
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
