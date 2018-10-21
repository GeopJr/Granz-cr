module Granz
  module Mcskin
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if (payload.content.starts_with? PREFIX[0] + "mcskin") || (payload.content.starts_with? PREFIX[1] + "mcskin") || (payload.content.starts_with? PREFIX[2] + "mcskin") || (payload.content.starts_with? PREFIX[3] + "mcskin") || (payload.content.starts_with? PREFIX[4] + "mcskin")
        pres = payload.content.gsub("#{PREFIX[1]} ", "#{PREFIX[1]}").gsub("#{PREFIX[3]} ", "#{PREFIX[3]}")
        argscount = pres.split(" ")
        if argscount.size > 2
          embed = Discord::Embed.new(
            colour: 0xffff00,
            title: "Too many arguments"
          )
          BOT.create_message(payload.channel_id, "", embed)
        elsif argscount.size > 1
          argss = pres.gsub("mcskin ", "").gsub("#{PREFIX[1]} ", "").gsub("#{PREFIX[1]}", "").gsub("#{PREFIX[3]}", "").gsub("#{PREFIX[3]} ", "").gsub("#{PREFIX[0]}", "")
          begin
            embed = Discord::Embed.new(
              title: "Here you go :",
              image: Discord::EmbedImage.new(
                url: "https://crafatar.com/skins/#{argss}"
              ),
              thumbnail: Discord::EmbedThumbnail.new(
                url: "https://crafatar.com/renders/head/#{argss}?overlay"
              ),
              timestamp: Time.now,
              colour: 0xffff00,
            )
            BOT.create_message(payload.channel_id, "", embed)
          rescue
            embed = Discord::Embed.new(
              colour: 0xffff00,
              title: "UUID's only"
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
