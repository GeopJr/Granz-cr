module Granz
  module Okbyemom
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if PREFIX.any? { |p| payload.content.starts_with?("#{p}okbyemom") }
        no_space = payload.content.gsub("#{PREFIX[1]} ", "#{PREFIX[1]}").gsub("#{PREFIX[3]} ", "#{PREFIX[3]}")
        args_count = no_space.split(" ")
        begin
          args = no_space.gsub("okbyemom ", "").gsub("okbyemom", "").gsub("#{PREFIX[1]}", "").gsub("#{PREFIX[3]}", "").gsub("#{PREFIX[0]}", "")
          random_number = rand(1..1650)

          LibMagick.magickWandGenesis
          m_wand = LibMagick.newMagickWand
          d_wand = LibMagick.newDrawingWand
          p_wand = LibMagick.newPixelWand

          if LibMagick.magickReadImage(m_wand, "./src/images/okbyemom.png")
            LibMagick.pixelSetColor p_wand, "black"
            LibMagick.drawSetFillColor d_wand, p_wand
            LibMagick.drawSetFont d_wand, "Verdana-Bold"
            LibMagick.drawSetFontSize d_wand, 20
            LibMagick.drawSetTextAntialias d_wand, true
            LibMagick.drawRotate d_wand, -23
            LibMagick.drawAnnotation d_wand, 75, 653, args
            LibMagick.magickDrawImage m_wand, d_wand
            LibMagick.magickTrimImage m_wand, 0
            LibMagick.magickWriteImage m_wand, "#{random_number}xx.png"
          end
          LibMagick.destroyPixelWand p_wand
          LibMagick.destroyDrawingWand d_wand
          LibMagick.destroyMagickWand m_wand
          LibMagick.magickWandTerminus
          BOT.upload_file(payload.channel_id, "", File.open("#{random_number}xx.png", "r"))
          File.delete("./#{random_number}xx.png")
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
