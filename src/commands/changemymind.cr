module Granz
  module Changemymind
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if (payload.content.starts_with? PREFIX[0] + "changemymind") || (payload.content.starts_with? PREFIX[1] + "changemymind") || (payload.content.starts_with? PREFIX[2] + "changemymind") || (payload.content.starts_with? PREFIX[3] + "changemymind") || (payload.content.starts_with? PREFIX[4] + "changemymind")
        pres = payload.content.gsub("#{PREFIX[1]} ", "#{PREFIX[1]}").gsub("#{PREFIX[3]} ", "#{PREFIX[3]}")
        argscount = pres.split(" ")

        argss = pres.gsub("changemymind ", "").gsub("#{PREFIX[1]} ", "").gsub("#{PREFIX[1]}", "").gsub("#{PREFIX[3]}", "").gsub("#{PREFIX[3]} ", "").gsub("#{PREFIX[0]}", "")
        ###
        ###
        imggnamee = rand(1..1650)
        if argss.size < 13
          LibMagick.magickWandGenesis
          m_wand = LibMagick.newMagickWand
          d_wand = LibMagick.newDrawingWand
          p_wand = LibMagick.newPixelWand

          if LibMagick.magickReadImage(m_wand, "./src/images/changemymind.png")
            LibMagick.pixelSetColor p_wand, "black"
            LibMagick.drawSetFillColor d_wand, p_wand
            LibMagick.drawSetFont d_wand, "Verdana-Bold"
            LibMagick.drawSetFontSize d_wand, 40
            LibMagick.drawSetTextAntialias d_wand, true
            LibMagick.drawRotate d_wand, -23
            LibMagick.drawAnnotation d_wand, 220, 450, argss
            LibMagick.magickDrawImage m_wand, d_wand
            LibMagick.magickTrimImage m_wand, 0
            LibMagick.magickWriteImage m_wand, "#{imggnamee}.png"
          end
          LibMagick.destroyPixelWand p_wand
          LibMagick.destroyDrawingWand d_wand
          LibMagick.destroyMagickWand m_wand
          LibMagick.magickWandTerminus
          BOT.upload_file(payload.channel_id, "", File.open("#{imggnamee}.png", "r"))
          File.delete("./#{imggnamee}.png")
        elsif (argss.size >= 13) && (argss.size < 25)
          LibMagick.magickWandGenesis
          m_wand = LibMagick.newMagickWand
          d_wand = LibMagick.newDrawingWand
          p_wand = LibMagick.newPixelWand
          if LibMagick.magickReadImage(m_wand, "./src/images/changemymind.png")
            LibMagick.pixelSetColor p_wand, "black"
            LibMagick.drawSetFillColor d_wand, p_wand
            LibMagick.drawSetFont d_wand, "Verdana-Bold"
            LibMagick.drawSetFontSize d_wand, 20
            LibMagick.drawSetTextAntialias d_wand, true
            LibMagick.drawRotate d_wand, -23
            LibMagick.drawAnnotation d_wand, 220, 450, argss
            LibMagick.magickDrawImage m_wand, d_wand
            LibMagick.magickTrimImage m_wand, 0
            LibMagick.magickWriteImage m_wand, "#{imggnamee}.png"
          end
          LibMagick.destroyPixelWand p_wand
          LibMagick.destroyDrawingWand d_wand
          LibMagick.destroyMagickWand m_wand
          LibMagick.magickWandTerminus
          BOT.upload_file(payload.channel_id, "", File.open("#{imggnamee}.png", "r"))
          File.delete("./#{imggnamee}.png")
        elsif (argss.size >= 25) && (argss.size < 39)
          LibMagick.magickWandGenesis
          m_wand = LibMagick.newMagickWand
          d_wand = LibMagick.newDrawingWand
          p_wand = LibMagick.newPixelWand
          if LibMagick.magickReadImage(m_wand, "./src/images/changemymind.png")
            LibMagick.pixelSetColor p_wand, "black"
            LibMagick.drawSetFillColor d_wand, p_wand
            LibMagick.drawSetFont d_wand, "Verdana-Bold"
            LibMagick.drawSetFontSize d_wand, 10
            LibMagick.drawSetTextAntialias d_wand, true
            LibMagick.drawRotate d_wand, -23
            LibMagick.drawAnnotation d_wand, 220, 450, argss
            LibMagick.magickDrawImage m_wand, d_wand
            LibMagick.magickTrimImage m_wand, 0
            LibMagick.magickWriteImage m_wand, "#{imggnamee}.png"
          end
          LibMagick.destroyPixelWand p_wand
          LibMagick.destroyDrawingWand d_wand
          LibMagick.destroyMagickWand m_wand
          LibMagick.magickWandTerminus
          BOT.upload_file(payload.channel_id, "", File.open("#{imggnamee}.png", "r"))
          File.delete("./#{imggnamee}.png")
        else
          embed = Discord::Embed.new(
            colour: 0xffff00,
            title: "Too many characters (1-39)"
          )
          BOT.create_message(payload.channel_id, "", embed)
        end
        ####
      end
    end
  end
end
