module Granz
  command = Command.new("okbyemom", "fun", "#{CONFIG["prefix"]}okbyemom <text>", "#{CONFIG["prefix"]}okbyemom crystal-lang docs", "Generates an okbyemom meme based on the provided text", true)
  Granz::COMMANDS[command.name] = command

  module Commands
    module Okbyemom
      extend self

      def execute(payload : Discord::Message, args : Array(String))
        return false if Granz::Args.min(1, args, payload.channel_id)
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
          LibMagick.drawAnnotation d_wand, 75, 653, args.join(" ")
          LibMagick.magickDrawImage m_wand, d_wand
          LibMagick.magickTrimImage m_wand, 0
          LibMagick.magickWriteImage m_wand, "okbyemom#{random_number}.png"
        end
        LibMagick.destroyPixelWand p_wand
        LibMagick.destroyDrawingWand d_wand
        LibMagick.destroyMagickWand m_wand
        LibMagick.magickWandTerminus
        BOT.upload_file(payload.channel_id, "", File.open("okbyemom#{random_number}.png", "r"))
        File.delete("./okbyemom#{random_number}.png")
      end
    end
  end
end
