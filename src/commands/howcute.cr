module Granz
  module Howcute
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if PREFIX.any? { |p| payload.content.starts_with?("#{p}howcute") }
        no_space = payload.content.gsub("#{PREFIX[1]} ", "#{PREFIX[1]}").gsub("#{PREFIX[3]} ", "#{PREFIX[3]}")
        args_count = no_space.split(" ")
        if args_count.size > 1
          random_number = (0..100).to_a
          args = no_space.gsub("howcute ", "").gsub("#{PREFIX[1]}", "").gsub("#{PREFIX[3]}", "").gsub("#{PREFIX[0]}", "")
          begin
            embed = Discord::Embed.new(
              title: "How cute are you?",
              description: "**#{args}** is **#{random_number.sample}/100** cute :blush:",

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
          random_number = (0..100).to_a
          embed = Discord::Embed.new(
            title: "How cute are you?",
            description: "**<@#{payload.author.id}>** is **#{random_number.sample}/100** cute :blush:",

            colour: 0xffff00,
          )
          BOT.create_message(payload.channel_id, "", embed)
        end
      end
    end
  end
end
