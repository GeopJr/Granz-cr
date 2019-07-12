module Granz
  module Pride
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if PREFIX.any? { |p| payload.content.starts_with?("#{p}ring") }
        no_space = payload.content.gsub("#{PREFIX[1]} ", "#{PREFIX[1]}").gsub("#{PREFIX[3]} ", "#{PREFIX[3]}")
        args_count = no_space.split(" ")

        args = no_space.gsub("ring ", "").gsub("#{PREFIX[1]}", "").gsub("#{PREFIX[3]}", "").gsub("#{PREFIX[0]}", "").split(" ")
        begin
          if /^#(?:[0-9a-fA-F]{3}){1,2}$/.match(args[0])
            color_hex = args[0]
          else
            another_number = args[999999]
          end
          if args_count.size > 3
            embed = Discord::Embed.new(
              colour: 0xffff00,
              title: "Too many arguments"
            )
            BOT.create_message(payload.channel_id, "", embed)
          elsif args_count.size > 2
            mentioned_user = payload.mentions[0]
            begin
              if (mentioned_user == payload.author) || (mentioned_user != payload.author)
                random_number = rand(1..1650)

                HTTP::Client.get("https://cdn.discordapp.com/avatars/#{mentioned_user.id}/#{mentioned_user.avatar}.png?size=1024") do |response|
                  File.write("#{random_number}u.png", response.body_io)
                end
                LibMagick.magickWandGenesis
                wand1 = LibMagick.newMagickWand
                p_wand = LibMagick.newPixelWand
                d_wand = LibMagick.newDrawingWand
                LibMagick.magickReadImage wand1, "#{random_number}u.png"
                LibMagick.magickAdaptiveResizeImage wand1, 1024, 1024

                LibMagick.pixelSetColor p_wand, "#{color_hex}"
                LibMagick.drawSetStrokeOpacity d_wand, 1
                LibMagick.drawSetStrokeColor d_wand, p_wand
                LibMagick.drawSetStrokeWidth d_wand, 80
                LibMagick.drawSetStrokeAntialias d_wand, true

                LibMagick.pixelSetColor p_wand, "rgba(0,0,0,0)"
                LibMagick.drawSetFillColor d_wand, p_wand
                LibMagick.drawCircle d_wand, 512, 512, 180, 180
                LibMagick.magickDrawImage wand1, d_wand

                LibMagick.magickWriteImage wand1, "#{another_number}#{random_number}.png"
                LibMagick.destroyMagickWand wand1
                LibMagick.destroyDrawingWand d_wand
                LibMagick.destroyPixelWand p_wand
                LibMagick.magickWandTerminus
                BOT.upload_file(payload.channel_id, "", File.open("#{another_number}#{random_number}.png", "r"))
                File.delete("./#{random_number}u.png")
                File.delete("./#{another_number}#{random_number}.png")
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
          elsif args_count.size == 2
            begin
              random_number = rand(1..1650)

              HTTP::Client.get("https://cdn.discordapp.com/avatars/#{payload.author.id}/#{payload.author.avatar}.png?size=1024") do |response|
                File.write("#{random_number}u.png", response.body_io)
              end

              LibMagick.magickWandGenesis
              wand1 = LibMagick.newMagickWand
              wand2 = LibMagick.newMagickWand
              p_wand = LibMagick.newPixelWand
              d_wand = LibMagick.newDrawingWand
              LibMagick.magickReadImage wand2, "#{another_number}.png"
              LibMagick.magickReadImage wand1, "#{random_number}u.png"
              LibMagick.magickAdaptiveResizeImage wand1, 1024, 1024
              LibMagick.pixelSetColor p_wand, "#{color_hex}"
              LibMagick.drawSetStrokeOpacity d_wand, 1
              LibMagick.drawSetStrokeColor d_wand, p_wand
              LibMagick.drawSetStrokeWidth d_wand, 80
              LibMagick.drawSetStrokeAntialias d_wand, true

              LibMagick.pixelSetColor p_wand, "rgba(0,0,0,0)"
              LibMagick.drawSetFillColor d_wand, p_wand
              LibMagick.drawCircle d_wand, 512, 512, 180, 180
              LibMagick.magickDrawImage wand1, d_wand
              LibMagick.magickWriteImage wand1, "#{another_number}#{random_number}.png"
              LibMagick.destroyMagickWand wand1
              LibMagick.destroyDrawingWand d_wand
              LibMagick.destroyPixelWand p_wand
              LibMagick.magickWandTerminus
              BOT.upload_file(payload.channel_id, "", File.open("#{another_number}#{random_number}.png", "r"))
              File.delete("./#{random_number}u.png")
              File.delete("./#{another_number}#{random_number}.png")
            rescue
              embed = Discord::Embed.new(
                colour: 0xffff00,
                title: "Mention a user"
              )
              BOT.create_message(payload.channel_id, "", embed)
            end
          end
        rescue
          embed = Discord::Embed.new(
            colour: 0xffff00,
            title: "#{PREFIX[0]}ring <color> [mention]",
            description: "Color must be in this format **#FFFF00**"
          )
          BOT.create_message(payload.channel_id, "", embed)
        end
      end
    end
  end
end
