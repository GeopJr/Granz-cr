module Granz
  module Pride
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if PREFIX.any? { |p| payload.content.starts_with?("#{p}ring") }
        pres = payload.content.gsub("#{PREFIX[1]} ", "#{PREFIX[1]}").gsub("#{PREFIX[3]} ", "#{PREFIX[3]}")
        argscount = pres.split(" ")

        args = pres.gsub("ring ", "").gsub("#{PREFIX[1]} ", "").gsub("#{PREFIX[1]}", "").gsub("#{PREFIX[3]}", "").gsub("#{PREFIX[3]} ", "").gsub("#{PREFIX[0]}", "").split(" ")
        begin
          if /^#(?:[0-9a-fA-F]{3}){1,2}$/.match(args[0])
            colorring = args[0]
          else
            imgname = args[999999]
          end
          if argscount.size > 3
            embed = Discord::Embed.new(
              colour: 0xffff00,
              title: "Too many arguments"
            )
            BOT.create_message(payload.channel_id, "", embed)
          elsif argscount.size > 2
            mentioned_user = payload.mentions
            begin
              if (mentioned_user[0] == payload.author) || (mentioned_user[0] != payload.author)
                imggnamee = rand(1..1650)

                HTTP::Client.get("https://cdn.discordapp.com/avatars/#{mentioned_user[0].id}/#{mentioned_user[0].avatar}.png?size=1024") do |response|
                  File.write("#{imggnamee}u.png", response.body_io)
                end
                LibMagick.magickWandGenesis
                wand1 = LibMagick.newMagickWand
                p_wand = LibMagick.newPixelWand
                d_wand = LibMagick.newDrawingWand
                LibMagick.magickReadImage wand1, "#{imggnamee}u.png"
                LibMagick.magickAdaptiveResizeImage wand1, 1024, 1024

                LibMagick.pixelSetColor p_wand, "#{colorring}"
                LibMagick.drawSetStrokeOpacity d_wand, 1
                LibMagick.drawSetStrokeColor d_wand, p_wand
                LibMagick.drawSetStrokeWidth d_wand, 80
                LibMagick.drawSetStrokeAntialias d_wand, true

                LibMagick.pixelSetColor p_wand, "rgba(0,0,0,0)"
                LibMagick.drawSetFillColor d_wand, p_wand
                LibMagick.drawCircle d_wand, 512, 512, 180, 180
                LibMagick.magickDrawImage wand1, d_wand

                LibMagick.magickWriteImage wand1, "#{imgname}#{imggnamee}.png"
                LibMagick.destroyMagickWand wand1
                LibMagick.destroyDrawingWand d_wand
                LibMagick.destroyPixelWand p_wand
                LibMagick.magickWandTerminus
                BOT.upload_file(payload.channel_id, "", File.open("#{imgname}#{imggnamee}.png", "r"))
                File.delete("./#{imggnamee}u.png")
                File.delete("./#{imgname}#{imggnamee}.png")
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
          elsif argscount.size == 2
            begin
              imggnamee = rand(1..1650)

              HTTP::Client.get("https://cdn.discordapp.com/avatars/#{payload.author.id}/#{payload.author.avatar}.png?size=1024") do |response|
                File.write("#{imggnamee}u.png", response.body_io)
              end

              LibMagick.magickWandGenesis
              wand1 = LibMagick.newMagickWand
              wand2 = LibMagick.newMagickWand
              p_wand = LibMagick.newPixelWand
              d_wand = LibMagick.newDrawingWand
              LibMagick.magickReadImage wand2, "#{imgname}.png"
              LibMagick.magickReadImage wand1, "#{imggnamee}u.png"
              LibMagick.magickAdaptiveResizeImage wand1, 1024, 1024
              LibMagick.pixelSetColor p_wand, "#{colorring}"
              LibMagick.drawSetStrokeOpacity d_wand, 1
              LibMagick.drawSetStrokeColor d_wand, p_wand
              LibMagick.drawSetStrokeWidth d_wand, 80
              LibMagick.drawSetStrokeAntialias d_wand, true

              LibMagick.pixelSetColor p_wand, "rgba(0,0,0,0)"
              LibMagick.drawSetFillColor d_wand, p_wand
              LibMagick.drawCircle d_wand, 512, 512, 180, 180
              LibMagick.magickDrawImage wand1, d_wand
              LibMagick.magickWriteImage wand1, "#{imgname}#{imggnamee}.png"
              LibMagick.destroyMagickWand wand1
              LibMagick.destroyDrawingWand d_wand
              LibMagick.destroyPixelWand p_wand
              LibMagick.magickWandTerminus
              BOT.upload_file(payload.channel_id, "", File.open("#{imgname}#{imggnamee}.png", "r"))
              File.delete("./#{imggnamee}u.png")
              File.delete("./#{imgname}#{imggnamee}.png")
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
