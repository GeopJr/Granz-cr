module Granz
  module Maths
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if PREFIX.any? { |p| payload.content.starts_with?("#{p}maths") }
        no_space = payload.content.gsub("#{PREFIX[1]} ", "#{PREFIX[1]}").gsub("#{PREFIX[3]} ", "#{PREFIX[3]}")
        args_count = no_space.split(" ")
        if args_count.size > 3
          embed = Discord::Embed.new(
            colour: 0xffff00,
            title: "Too many arguments"
          )
          BOT.create_message(payload.channel_id, "", embed)
        elsif args_count.size > 2
          args = no_space.gsub("maths ", "").gsub("#{PREFIX[1]}", "").gsub("#{PREFIX[3]}", "").gsub("#{PREFIX[0]}", "").split(" ")
          math_op = args.join(" ").gsub("#{args[0]} ", "")
          begin
            response = HTTP::Client.get "https://newton.now.sh/#{args[0].downcase}/#{math_op}"
            value = JSON.parse(response.body)
            embed = Discord::Embed.new(

              colour: 0xffff00,
              title: "Advanced Maths:",
              fields: [Discord::EmbedField.new(
                name: "__Operation__",
                value: "#{value["operation"]}"
              ),
              Discord::EmbedField.new(
                name: "__Exno_spacesion__",
                value: "#{value["exno_spacesion"]}"
              ),
              Discord::EmbedField.new(
                name: "__Result__",
                value: "#{value["result"]}"
              ),
              ]
            )
            BOT.create_message(payload.channel_id, "", embed)
          rescue
            embed = Discord::Embed.new(
              colour: 0xffff00,
              title: "Usage :",
              description: "#{PREFIX[0]}maths <operation> <exno_spacesion>",
              url: "https://granz.geopjr.xyz/operations"
            )
            BOT.create_message(payload.channel_id, "", embed)
          end
        else
          embed = Discord::Embed.new(
            colour: 0xffff00,
            title: "Too few arguments",
            description: "#{PREFIX[0]}maths <operation> <exno_spacesion>",
            url: "https://granz.geopjr.xyz/operations"
          )
          BOT.create_message(payload.channel_id, "", embed)
        end
      end
    end
  end
end
