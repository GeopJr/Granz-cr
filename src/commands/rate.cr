module Granz
  module Rate
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if PREFIX.any? { |p| payload.content.starts_with?("#{p}rate ") }
        no_space = payload.content.gsub("#{PREFIX[1]} ", "#{PREFIX[1]}").gsub("#{PREFIX[3]} ", "#{PREFIX[3]}")
        args_count = no_space.split(" ")
        if args_count.size > 1
          random_number = (0..100).to_a
          args = no_space.gsub("rate ", "").gsub("#{PREFIX[1]}", "").gsub("#{PREFIX[3]}", "").gsub("#{PREFIX[0]}", "")
          if args == ""
            rate = PREFIX[1]
          else
            rate = args
          end
          begin
            embed = Discord::Embed.new(
              description: "I give **#{rate}** a **#{random_number.sample / 10}/10** \n~Granz",
              colour: 0xffff00,
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
