module Granz
  module Howgay
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if PREFIX.any? { |p| payload.content.starts_with?("#{p}howgay") }
        no_space = payload.content.gsub("#{PREFIX[1]} ", "#{PREFIX[1]}").gsub("#{PREFIX[3]} ", "#{PREFIX[3]}")
        args_count = no_space.split(" ")
        if args_count.size > 1
          random_number = (0..100).to_a
          args = no_space.gsub("#{PREFIX[1]} howgay ", "").gsub("#{PREFIX[1]}howgay ", "").gsub("#{PREFIX[3]} howgay ", "").gsub("#{PREFIX[3]}howgay ", "").gsub("#{PREFIX[0]}howgay ", "")
          begin
            embed = Discord::Embed.new(
              title: "How much of a homosexual are you?",
              description: "**#{args}** is **#{random_number.sample}/100** homosexual :gay_pride_flag:",

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
            title: "How much of a homosexual are you?",
            description: "**<@#{payload.author.id}>** is **#{random_number.sample}/100** homosexual :gay_pride_flag:",

            colour: 0xffff00,
          )
          BOT.create_message(payload.channel_id, "", embed)
        end
      end
    end
  end
end
