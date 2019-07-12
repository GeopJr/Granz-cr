module Granz
  module Temperature
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if PREFIX.any? { |p| payload.content.starts_with?("#{p}temperature") }
        no_space = payload.content.gsub("#{PREFIX[1]} ", "#{PREFIX[1]}").gsub("#{PREFIX[3]} ", "#{PREFIX[3]}")
        args_count = no_space.split(" ")
        if args_count.size > 4
          embed = Discord::Embed.new(
            colour: 0xffff00,
            title: "Too many arguments"
          )
          BOT.create_message(payload.channel_id, "", embed)
        elsif args_count.size > 3
          args = no_space.gsub("temperature ", "").gsub("#{PREFIX[1]}", "").gsub("#{PREFIX[3]}", "").gsub("#{PREFIX[0]}", "").split(" ")
          embeded = Discord::Embed.new(

            colour: 0xffff00,
            title: "Only Numbers Please"
          )
          next BOT.create_message(payload.channel_id, "", embeded) unless args[0].to_s.match(/^[0-9_\-+ ]*$/)
          begin
            bef = args[1].to_s.downcase
            aft = args[2].to_s.downcase
            temp = args[0]
            if bef == "celsius" || bef == "c"
              if aft == "celsius" || aft == "c"
                done = "INFINITY"
              elsif aft == "kelvin" || aft == "k"
                done = temp.to_i + 273.15
              elsif aft == "fahrenheit" || aft == "f"
                prepare = temp.to_i * 1.8
                done = prepare + 32
              else
                embed = Discord::Embed.new(

                  colour: 0xffff00,
                  title: "Check what you have typed and try again !"
                )
                BOT.create_message(payload.channel_id, "", embed)
              end
            elsif bef == "fahrenheit" || bef == "f"
              if aft == "celsius" || aft == "c"
                prepare = temp.to_i - 32
                done = prepare / 1.8
              elsif aft == "kelvin" || aft == "k"
                prepare = temp.to_i + 459.67
                done = prepare / 1.8
              elsif aft == "fahrenheit" || aft == "f"
                done = "INFINITY"
              else
                embed = Discord::Embed.new(

                  colour: 0xffff00,
                  title: "Check what you have typed and try again !"
                )
                BOT.create_message(payload.channel_id, "", embed)
              end
            elsif bef == "kelvin" || bef == "k"
              if aft == "celsius" || aft == "c"
                done = temp.to_i - 273.15
              elsif aft == "kelvin" || aft == "k"
                done = "INFINITY"
              elsif aft == "fahrenheit" || aft == "f"
                prepare = temp.to_i * 1.8
                done = prepare - 459.67
              else
                embed = Discord::Embed.new(

                  colour: 0xffff00,
                  title: "Check what you have typed and try again !"
                )
                BOT.create_message(payload.channel_id, "", embed)
              end
            else
              embed = Discord::Embed.new(

                colour: 0xffff00,
                title: "Check what you have typed and try again !"
              )
              BOT.create_message(payload.channel_id, "", embed)
            end
            embed = Discord::Embed.new(

              colour: 0xffff00,
              title: "#{done} #{aft.upcase}"
            )
            BOT.create_message(payload.channel_id, "", embed)
          rescue
            embed = Discord::Embed.new(

              colour: 0xffff00,
              title: "Check what you have typed and try again !"
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
