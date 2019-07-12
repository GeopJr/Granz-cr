module Granz
  module Gay
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if PREFIX.any? { |p| payload.content.starts_with?("#{p}gay") }
        no_space = payload.content.gsub("#{PREFIX[1]} ", "#{PREFIX[1]}").gsub("#{PREFIX[3]} ", "#{PREFIX[3]}")
        args_count = no_space.split(" ")
        if args_count.size > 2
          embed = Discord::Embed.new(
            colour: 0xffff00,
            title: "Too many arguments"
          )
          BOT.create_message(payload.channel_id, "", embed)
        elsif args_count.size > 1
          mentioned_user = payload.mentions[0]
          begin
            if (mentioned_user)
              random_number = rand(1..1650)

              HTTP::Client.get("https://cdn.discordapp.com/avatars/#{mentioned_user.id}/#{mentioned_user.avatar}.jpg?size=1024") do |response|
                File.write("#{random_number}y.jpg", response.body_io)
              end

              LibMagick.magickWandGenesis
              wand1 = LibMagick.newMagickWand
              wand2 = LibMagick.newMagickWand
              LibMagick.magickReadImage wand2, "./src/images/gay.png"
              LibMagick.magickReadImage wand1, "#{random_number}y.jpg"
              LibMagick.magickAdaptiveResizeImage wand1, 1024, 1024
              LibMagick.magickCompositeImage wand1, wand2, LibMagick::CompositeOperator::OverCompositeOp, 0, 0
              LibMagick.magickWriteImage wand1, "gay#{random_number}.png"
              LibMagick.destroyMagickWand wand2
              LibMagick.destroyMagickWand wand1
              LibMagick.magickWandTerminus
              BOT.upload_file(payload.channel_id, "", File.open("gay#{random_number}.png", "r"))
              File.delete("./#{random_number}y.jpg")
              File.delete("./gay#{random_number}.png")
            else
              embed = Discord::Embed.new(

                colour: 0xffff00,
                title: "Mention a user"
              )

              BOT.create_message(payload.channel_id, "", embed)
            end
          rescue
            embed = Discord::Embed.new(
              colour: 0xffff00,
              title: "Mention a user"
            )
            BOT.create_message(payload.channel_id, "", embed)
          end
        elsif args_count.size == 1
          begin
            random_number = rand(1..1650)

            HTTP::Client.get("https://cdn.discordapp.com/avatars/#{payload.author.id}/#{payload.author.avatar}.jpg?size=1024") do |response|
              File.write("#{random_number}y.jpg", response.body_io)
            end

            LibMagick.magickWandGenesis
            wand1 = LibMagick.newMagickWand
            wand2 = LibMagick.newMagickWand
            LibMagick.magickReadImage wand2, "./src/images/gay.png"
            LibMagick.magickReadImage wand1, "#{random_number}y.jpg"
            LibMagick.magickAdaptiveResizeImage wand1, 1024, 1024
            LibMagick.magickCompositeImage wand1, wand2, LibMagick::CompositeOperator::OverCompositeOp, 0, 0
            LibMagick.magickWriteImage wand1, "gay#{random_number}.png"
            LibMagick.destroyMagickWand wand2
            LibMagick.destroyMagickWand wand1
            LibMagick.magickWandTerminus
            BOT.upload_file(payload.channel_id, "", File.open("gay#{random_number}.png", "r"))
            File.delete("./#{random_number}y.jpg")
            File.delete("./gay#{random_number}.png")
          rescue
            embed = Discord::Embed.new(
              colour: 0xffff00,
              title: "Mention a user"
            )
            BOT.create_message(payload.channel_id, "", embed)
          end
        end
      end
    end
  end
end
