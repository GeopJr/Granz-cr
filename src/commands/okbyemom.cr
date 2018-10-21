module Granz
  module Okbyemom
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if (payload.content.starts_with? PREFIX[0] + "okbyemom") || (payload.content.starts_with? PREFIX[1] + "okbyemom") || (payload.content.starts_with? PREFIX[2] + "okbyemom") || (payload.content.starts_with? PREFIX[3] + "okbyemom") || (payload.content.starts_with? PREFIX[4] + "okbyemom")
        pres = payload.content.gsub("#{PREFIX[1]} ", "#{PREFIX[1]}").gsub("#{PREFIX[3]} ", "#{PREFIX[3]}")
        argscount = pres.split(" ")
        begin
          argss = pres.gsub("okbyemom ", "").gsub("okbyemom", "").gsub("#{PREFIX[1]} ", "").gsub("#{PREFIX[1]}", "").gsub("#{PREFIX[3]}", "").gsub("#{PREFIX[3]} ", "").gsub("#{PREFIX[0]}", "")
          ###
          ###
          imggnamee = rand(1..1650)

          LibMagick.magickWandGenesis
          m_wand = LibMagick.newMagickWand
          d_wand = LibMagick.newDrawingWand
          p_wand = LibMagick.newPixelWand

          if LibMagick.magickReadImage(m_wand, "okbyemom.png")
            LibMagick.pixelSetColor p_wand, "black"
            LibMagick.drawSetFillColor d_wand, p_wand
            LibMagick.drawSetFont d_wand, "Verdana-Bold"
            LibMagick.drawSetFontSize d_wand, 20
            LibMagick.drawSetTextAntialias d_wand, true
            LibMagick.drawRotate d_wand, -23
            LibMagick.drawAnnotation d_wand, 75, 653, argss
            LibMagick.magickDrawImage m_wand, d_wand
            LibMagick.magickTrimImage m_wand, 0
            LibMagick.magickWriteImage m_wand, "#{imggnamee}xx.png"
          end
          LibMagick.destroyPixelWand p_wand
          LibMagick.destroyDrawingWand d_wand
          LibMagick.destroyMagickWand m_wand
          LibMagick.magickWandTerminus
          BOT.upload_file(payload.channel_id, "", File.open("#{imggnamee}xx.png", "r"))
          File.delete("./#{imggnamee}xx.png")
        rescue
          embed = Discord::Embed.new(
            colour: 0xffff00,
            title: "Can't be empty"
          )
          BOT.create_message(payload.channel_id, "", embed)
        end

        ####
      end
    end
  end
end
