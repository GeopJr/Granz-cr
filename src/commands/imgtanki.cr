module Granz
  module Imgtanki
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if (payload.content.starts_with? PREFIX[0] + "imgtanki") || (payload.content.starts_with? PREFIX[1] + "imgtanki") || (payload.content.starts_with? PREFIX[2] + "imgtanki") || (payload.content.starts_with? PREFIX[3] + "imgtanki") || (payload.content.starts_with? PREFIX[4] + "imgtanki")
        pres = payload.content.gsub("#{PREFIX[1]} ", "#{PREFIX[1]}").gsub("#{PREFIX[3]} ", "#{PREFIX[3]}")
        argscount = pres.split(" ")
        if argscount.size > 2
          embed = Discord::Embed.new(
            colour: 0xffff00,
            title: "Too many arguments"
          )
          BOT.create_message(payload.channel_id, "", embed)
        elsif argscount.size > 1
          argss = pres.gsub("imgtanki ", "").gsub("#{PREFIX[1]} ", "").gsub("#{PREFIX[1]}", "").gsub("#{PREFIX[3]}", "").gsub("#{PREFIX[3]} ", "").gsub("#{PREFIX[0]}", "")
          begin
            response = HTTP::Client.get "https://tankapi.herokuapp.com/?name=#{argss}&auth=granzVEA7hDW3YTj2ytEQoDrS"
            value = JSON.parse(response.body)
            imggnamee = rand(1..1650)
            LibMagick.magickWandGenesis
            m_wand = LibMagick.newMagickWand
            wand_rank = LibMagick.newMagickWand
            wand_author = LibMagick.newMagickWand
            d_wand = LibMagick.newDrawingWand
            p_wand = LibMagick.newPixelWand
            pp_wand = LibMagick.newPixelWand
            if LibMagick.magickReadImage(m_wand, "./src/images/taaan.jpg")
              LibMagick.pixelSetColor p_wand, "white"
              LibMagick.drawSetFillColor d_wand, p_wand
              LibMagick.magickReadImage wand_rank, "#{value["rank_img"]}"
              LibMagick.magickReadImage wand_author, "https://cdn.discordapp.com/avatars/#{payload.author.id}/#{payload.author.avatar}.jpg?size=32"
              LibMagick.drawSetFont d_wand, "Arial-Bold"
              LibMagick.drawSetFontSize d_wand, 40
              LibMagick.drawSetTextAntialias d_wand, true
              LibMagick.magickCompositeImage wand_rank, m_wand, LibMagick::CompositeOperator::OverCompositeOp, 0, 0
              LibMagick.magickCompositeImage wand_author, m_wand, LibMagick::CompositeOperator::OverCompositeOp, 0, 1196
              LibMagick.drawSetTextAlignment d_wand, LibMagick::AlignType::LeftAlign
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.drawSetStrokeWidth d_wand, 0
              LibMagick.drawSetStrokeAntialias d_wand, false
              LibMagick.drawSetFont d_wand, "Tahoma"
              LibMagick.drawAnnotation d_wand, 50, 1190, "Requested By: #{payload.author.username}##{payload.author.discriminator} | https://ratings.geopjr.xyz/"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.drawSetTextAlignment d_wand, LibMagick::AlignType::CenterAlign
              LibMagick.drawSetFontSize d_wand, 40
              LibMagick.drawSetFont d_wand, "Arial-Bold"
              LibMagick.drawAnnotation d_wand, 500, 50, "#{value["name"]}"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.drawSetFontSize d_wand, 35
              LibMagick.pixelSetColor p_wand, "#3498db"
              LibMagick.drawAnnotation d_wand, 500, 100, "#{value["rank"]}"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.drawSetFontSize d_wand, 35
              LibMagick.drawAnnotation d_wand, 500, 150, "Playtime: #{value["timePlayed"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.pixelSetColor p_wand, "#3498db"
              LibMagick.drawAnnotation d_wand, 750, 250, "Resistance Modules:"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.pixelSetColor p_wand, "white"
              LibMagick.drawAnnotation d_wand, 750, 290, "#{value["resistanceModules"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.pixelSetColor p_wand, "#3498db"
              LibMagick.drawAnnotation d_wand, 750, 330, "Turrets Played:"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.pixelSetColor p_wand, "white"
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.drawAnnotation d_wand, 750, 370, "#{value["turretsPlayed"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.pixelSetColor p_wand, "#3498db"
              LibMagick.drawAnnotation d_wand, 750, 410, "Mines Used:"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.pixelSetColor p_wand, "white"
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.drawAnnotation d_wand, 750, 450, "#{value["supplies"]["Mine"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.pixelSetColor p_wand, "#3498db"
              LibMagick.drawAnnotation d_wand, 750, 490, "Repair Kits Used:"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.pixelSetColor p_wand, "white"
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.drawAnnotation d_wand, 750, 530, "#{value["supplies"]["Repair Kit"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.pixelSetColor p_wand, "#3498db"
              LibMagick.drawAnnotation d_wand, 750, 570, "Gold Boxes Used:"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.pixelSetColor p_wand, "white"
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.drawAnnotation d_wand, 750, 610, "#{value["supplies"]["Gold box"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.pixelSetColor p_wand, "#3498db"
              LibMagick.drawAnnotation d_wand, 750, 650, "Double Armors Used:"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.pixelSetColor p_wand, "white"
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.drawAnnotation d_wand, 750, 690, "#{value["supplies"]["Double Armor"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.pixelSetColor p_wand, "#3498db"
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.drawAnnotation d_wand, 750, 730, "Speed Boosts Used:"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.pixelSetColor p_wand, "white"
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.drawAnnotation d_wand, 750, 770, "#{value["supplies"]["Speed Boost"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.pixelSetColor p_wand, "#3498db"
              LibMagick.drawAnnotation d_wand, 750, 810, "Double Damage Used:"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.pixelSetColor p_wand, "white"
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.drawAnnotation d_wand, 750, 850, "#{value["supplies"]["Double Damage"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.pixelSetColor p_wand, "#3498db"
              LibMagick.drawAnnotation d_wand, 750, 890, "Batteries Used:"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.pixelSetColor p_wand, "white"
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.drawAnnotation d_wand, 750, 930, "#{value["supplies"]["Battery"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.pixelSetColor p_wand, "#3498db"
              LibMagick.drawAnnotation d_wand, 750, 970, "Total:"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.pixelSetColor p_wand, "white"
              LibMagick.drawAnnotation d_wand, 750, 1010, "#{value["supplies"]["totalUsages"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.pixelSetColor p_wand, "#3498db"
              LibMagick.drawAnnotation d_wand, 250, 250, "EXP:"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.pixelSetColor p_wand, "white"
              LibMagick.drawAnnotation d_wand, 250, 290, "#{value["exp"]["exp"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}/#{value["exp"]["expNext"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.pixelSetColor p_wand, "#3498db"
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.drawAnnotation d_wand, 250, 330, "EXP Left:"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.pixelSetColor p_wand, "white"
              LibMagick.drawAnnotation d_wand, 250, 370, "#{value["exp"]["expLeft"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse} exp"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.pixelSetColor p_wand, "#3498db"
              LibMagick.drawAnnotation d_wand, 250, 410, "Golds Caught:"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.pixelSetColor p_wand, "white"
              LibMagick.drawAnnotation d_wand, 250, 450, "#{value["golds"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.pixelSetColor p_wand, "#3498db"
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.drawAnnotation d_wand, 250, 490, "Crystals:"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.pixelSetColor p_wand, "white"
              LibMagick.drawAnnotation d_wand, 250, 530, "#{value["crystals"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.pixelSetColor p_wand, "#3498db"
              LibMagick.drawAnnotation d_wand, 250, 570, "Kills:"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.pixelSetColor p_wand, "white"
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.drawAnnotation d_wand, 250, 610, "#{value["kills"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.pixelSetColor p_wand, "#3498db"
              LibMagick.drawAnnotation d_wand, 250, 650, "Deaths:"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.pixelSetColor p_wand, "white"
              LibMagick.drawAnnotation d_wand, 250, 690, "#{value["deaths"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.pixelSetColor p_wand, "#3498db"
              LibMagick.drawAnnotation d_wand, 250, 730, "K/D:"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.pixelSetColor p_wand, "white"
              LibMagick.drawAnnotation d_wand, 250, 770, "#{value["kd_ratio"]}"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.pixelSetColor p_wand, "#3498db"
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.drawAnnotation d_wand, 250, 810, "Efficiency Rating Place | Value:"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.pixelSetColor p_wand, "white"
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.drawAnnotation d_wand, 250, 850, "#{value["rating"]["efficiency"]["position"]["now"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse} | #{value["rating"]["efficiency"]["value"]["now"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.pixelSetColor p_wand, "#3498db"
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.drawAnnotation d_wand, 250, 890, "Experience Rating Place | Value:"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.pixelSetColor p_wand, "white"
              LibMagick.drawAnnotation d_wand, 250, 930, "#{value["rating"]["experience"]["position"]["now"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse} | #{value["rating"]["experience"]["value"]["now"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.pixelSetColor p_wand, "#3498db"
              LibMagick.drawAnnotation d_wand, 250, 970, "Gold Box Rating Place | Value:"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.pixelSetColor p_wand, "white"
              LibMagick.drawAnnotation d_wand, 250, 1010, "#{value["rating"]["golds"]["position"]["now"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse} | #{value["rating"]["golds"]["value"]["now"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.pixelSetColor p_wand, "#3498db"
              LibMagick.drawAnnotation d_wand, 250, 1050, "Crystals Rating Place | Value:"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.pixelSetColor p_wand, "white"
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.drawAnnotation d_wand, 250, 1090, "#{value["rating"]["crystals"]["position"]["now"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse} | #{value["rating"]["crystals"]["value"]["now"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.magickTrimImage m_wand, 0
              LibMagick.magickWriteImage m_wand, "#{imggnamee}tanki.png"
            end
            LibMagick.destroyPixelWand p_wand
            LibMagick.destroyPixelWand pp_wand
            LibMagick.destroyDrawingWand d_wand
            LibMagick.destroyMagickWand m_wand
            LibMagick.destroyMagickWand wand_rank
            LibMagick.destroyMagickWand wand_author
            LibMagick.magickWandTerminus
            BOT.upload_file(payload.channel_id, "", File.open("#{imggnamee}tanki.png", "r"))
            File.delete("./#{imggnamee}tanki.png")
          rescue
            embed = Discord::Embed.new(
              colour: 0xffff00,
              title: "I am afraid there is not such user in existance"
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
