module Granz
  module Embed
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if (payload.content.starts_with? PREFIX[0] + "embed") || (payload.content.starts_with? PREFIX[1] + "embed") || (payload.content.starts_with? PREFIX[2] + "embed") || (payload.content.starts_with? PREFIX[3] + "embed") || (payload.content.starts_with? PREFIX[4] + "embed")
        if payload.author.id == CONFIG["my_id"].to_s.to_u64
          pres = payload.content.gsub("#{PREFIX[1]} ", "#{PREFIX[1]}").gsub("#{PREFIX[3]} ", "#{PREFIX[3]}")
          argscount = pres.split(" ")
          if argscount.size > 1
            argss = pres.gsub("embed ", "").gsub("#{PREFIX[1]} ", "").gsub("#{PREFIX[1]}", "").gsub("#{PREFIX[3]}", "").gsub("#{PREFIX[3]} ", "").gsub("#{PREFIX[0]}", "").split("|")
            begin
              embed = Discord::Embed.new(
                title: "#{argss[0]}",
                description: "#{argss[1]}",
                colour: 0xffff00,
              )
              BOT.create_message(argss[2].to_u64, "", embed)
            rescue
              embed = Discord::Embed.new(
                colour: 0xffff00,
                title: "Erorr"
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
end
