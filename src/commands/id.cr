module Granz
  module Id
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if (payload.content.starts_with? PREFIX[0] + "id") || (payload.content.starts_with? PREFIX[1] + "id") || (payload.content.starts_with? PREFIX[2] + "id") || (payload.content.starts_with? PREFIX[3] + "id") || (payload.content.starts_with? PREFIX[4] + "id")
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
          begin
            if (mentioned_user[0] == payload.author) || (mentioned_user[0] != payload.author)
              embed = Discord::Embed.new(
                timestamp: Time.now,
                colour: 0xffff00,
                title: "#{mentioned_user[0].id}"
              )
            else
              embed = Discord::Embed.new(
                timestamp: Time.now,
                colour: 0xffff00,
                title: "Mention a user"
              )
            end
            BOT.create_message(payload.channel_id, "", embed)
          rescue
            embed = Discord::Embed.new(
              colour: 0xffff00,
              title: "Mention a user"
            )
            BOT.create_message(payload.channel_id, "", embed)
          end
        elsif argscount.size == 1
          begin
            embed = Discord::Embed.new(
              timestamp: Time.now,
              colour: 0xffff00,
              title: "#{payload.author.id}"
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
