module Granz
  module Embed
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if PREFIX.any? { |p| payload.content.starts_with?("#{p}embed") }
        if payload.author.id == CONFIG["my_id"].to_s.to_u64
          no_space = payload.content.gsub("#{PREFIX[1]} ", "#{PREFIX[1]}").gsub("#{PREFIX[3]} ", "#{PREFIX[3]}")
          args_count = no_space.split(" ")
          if args_count.size > 1
            args = no_space.gsub("embed ", "").gsub("#{PREFIX[1]}", "").gsub("#{PREFIX[3]}", "").gsub("#{PREFIX[0]}", "").split("|")
            begin
              embed = Discord::Embed.new(
                title: "#{args[0]}",
                description: "#{args[1]}",
                colour: 0xffff00,
              )
              BOT.create_message(args[2].to_u64, "", embed)
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
