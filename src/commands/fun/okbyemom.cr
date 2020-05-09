module Granz
  module Okbyemom
    BOT.on_message_create do |payload|
      next if payload.author.bot
      next unless Prefix_check.new("okbyemom", payload.content).check
      next BOT.create_message(payload.channel_id, "", Discord::Embed.new(colour: 0xff0000, title: "Sorry, I only respond on guilds")) unless CACHE.resolve_channel(payload.channel_id).type.guild_text?
      args = Args.new("okbyemom", payload.content).args
      next if Min_max_arg.new(1, args.size, 1, BOT, payload.channel_id).check
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
