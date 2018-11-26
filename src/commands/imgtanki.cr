module Granz
  module Imgtanki
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if PREFIX.any? { |p| payload.content.starts_with?("#{p}imgtanki") }
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
            response = HTTP::Client.get "https://ratings.tankionline.com/api/eu/profile/?user=#{argss}"
            valuee = JSON.parse(response.body).as_h
            value = JSON.parse(response.body)

            if value["response"]["hasPremium"] == true
              if value["response"]["rank"] == 1
                rank = "Recruit"
                rankimg = "https://i.imgur.com/Q9QMem7.png"
              elsif value["response"]["rank"] == 2
                rank = "Private"
                rankimg = "https://i.imgur.com/Rl7O3mU.png"
              elsif value["response"]["rank"] == 3
                rank = "Gefreiter"
                rankimg = "https://i.imgur.com/AduPPsl.png"
              elsif value["response"]["rank"] == 4
                rank = "Corporal"
                rankimg = "https://i.imgur.com/aIMVHTC.png"
              elsif value["response"]["rank"] == 5
                rank = "Master Corporal"
                rankimg = "https://i.imgur.com/Dar7hhh.png"
              elsif value["response"]["rank"] == 6
                rank = "Sergeant"
                rankimg = "https://i.imgur.com/T4RE8BT.png"
              elsif value["response"]["rank"] == 7
                rank = "Staff Sergeant"
                rankimg = "https://i.imgur.com/bS3SIIL.png"
              elsif value["response"]["rank"] == 8
                rank = "Master Sergeant"
                rankimg = "https://i.imgur.com/ruwc6qy.png"
              elsif value["response"]["rank"] == 9
                rank = "First Sergeant"
                rankimg = "https://i.imgur.com/qyWL1rG.png"
              elsif value["response"]["rank"] == 10
                rank = "Sergeant-Major"
                rankimg = "https://i.imgur.com/uOXqDLo.png"
              elsif value["response"]["rank"] == 11
                rank = "Warrant Officer 1"
                rankimg = "https://i.imgur.com/sEzBbLQ.png"
              elsif value["response"]["rank"] == 12
                rank = "Warrant Officer 2"
                rankimg = "https://i.imgur.com/EZJslol.png"
              elsif value["response"]["rank"] == 13
                rank = "Warrant Officer 3"
                rankimg = "https://i.imgur.com/xMboj6l.png"
              elsif value["response"]["rank"] == 14
                rank = "Warrant Officer 4"
                rankimg = "https://i.imgur.com/qLzwet8.png"
              elsif value["response"]["rank"] == 15
                rank = "Warrant Officer 5"
                rankimg = "https://i.imgur.com/0hKtwX2.png"
              elsif value["response"]["rank"] == 16
                rank = "Third Lieutenant"
                rankimg = "https://i.imgur.com/Miz0wqt.png"
              elsif value["response"]["rank"] == 17
                rank = "Second Lieutenant"
                rankimg = "https://i.imgur.com/qkTXhJR.png"
              elsif value["response"]["rank"] == 18
                rank = "First Lieutenant"
                rankimg = "https://i.imgur.com/VeA0ugN.png"
              elsif value["response"]["rank"] == 19
                rank = "Captain"
                rankimg = "https://i.imgur.com/INKmQMy.png"
              elsif value["response"]["rank"] == 20
                rank = "Major"
                rankimg = "https://i.imgur.com/hJL5fqH.png"
              elsif value["response"]["rank"] == 21
                rank = "Lieutenant Colonel"
                rankimg = "https://i.imgur.com/QpggknT.png"
              elsif value["response"]["rank"] == 22
                rank = "Colonel"
                rankimg = "https://i.imgur.com/9dg1YYq.png"
              elsif value["response"]["rank"] == 23
                rank = "Brigadier"
                rankimg = "https://i.imgur.com/Af6FJjE.png"
              elsif value["response"]["rank"] == 24
                rank = "Major General"
                rankimg = "https://i.imgur.com/SYIelDs.png"
              elsif value["response"]["rank"] == 25
                rank = "Lieutenant General"
                rankimg = "https://i.imgur.com/J7ob7co.png"
              elsif value["response"]["rank"] == 26
                rank = "General"
                rankimg = "https://i.imgur.com/laq0luJ.png"
              elsif value["response"]["rank"] == 27
                rank = "Marshal"
                rankimg = "https://i.imgur.com/4QzfKbh.png"
              elsif value["response"]["rank"] == 28
                rank = "Field Marshal"
                rankimg = "https://i.imgur.com/LVcFtIW.png"
              elsif value["response"]["rank"] == 29
                rank = "Commander"
                rankimg = "https://i.imgur.com/YLKv7Qy.png"
              elsif value["response"]["rank"] == 30
                rank = "Generalissimo"
                rankimg = "https://i.imgur.com/i8lKuZh.png"
              elsif value["response"]["rank"].as_i > 31
                rankimg = "https://i.imgur.com/qK6onnG.png"
                numrank = value["response"]["rank"].as_i - 30
                rank = "Legend #{numrank}"
              elsif value["response"]["rank"] == 31
                rank = "Legend 1"
                rankimg = "https://imgur.com/qK6onnG.png"
              end
            elsif value["response"]["hasPremium"] == false
              if value["response"]["rank"] == 1
                rank = "Recruit"
                rankimg = "https://i.imgur.com/ZcBNexc.png"
              elsif value["response"]["rank"] == 2
                rank = "Private"
                rankimg = "https://i.imgur.com/Jaar0MF.png"
              elsif value["response"]["rank"] == 3
                rank = "Gefreiter"
                rankimg = "https://i.imgur.com/j2DfBdW.png"
              elsif value["response"]["rank"] == 4
                rank = "Corporal"
                rankimg = "https://i.imgur.com/7Pn4X88.png"
              elsif value["response"]["rank"] == 5
                rank = "Master Corporal"
                rankimg = "https://i.imgur.com/WKZ0sVp.png"
              elsif value["response"]["rank"] == 6
                rank = "Sergeant"
                rankimg = "https://i.imgur.com/O2WuJAJ.png"
              elsif value["response"]["rank"] == 7
                rank = "Staff Sergeant"
                rankimg = "https://i.imgur.com/bTQLm9h.png"
              elsif value["response"]["rank"] == 8
                rank = "Master Sergeant"
                rankimg = "https://i.imgur.com/VvivZg0.png"
              elsif value["response"]["rank"] == 9
                rank = "First Sergeant"
                rankimg = "https://i.imgur.com/rCkln3K.png"
              elsif value["response"]["rank"] == 10
                rank = "Sergeant-Major"
                rankimg = "https://i.imgur.com/xCKvB2G.png"
              elsif value["response"]["rank"] == 11
                rank = "Warrant Officer 1"
                rankimg = "https://i.imgur.com/TJKJ4eB.png"
              elsif value["response"]["rank"] == 12
                rank = "Warrant Officer 2"
                rankimg = "https://i.imgur.com/Q8U5QIz.png"
              elsif value["response"]["rank"] == 13
                rank = "Warrant Officer 3"
                rankimg = "https://i.imgur.com/Ygi65T7.png"
              elsif value["response"]["rank"] == 14
                rank = "Warrant Officer 4"
                rankimg = "https://i.imgur.com/rx0zDOR.png"
              elsif value["response"]["rank"] == 15
                rank = "Warrant Officer 5"
                rankimg = "https://i.imgur.com/jDmMo5j.png"
              elsif value["response"]["rank"] == 16
                rank = "Third Lieutenant"
                rankimg = "https://i.imgur.com/LLvlTZY.png"
              elsif value["response"]["rank"] == 17
                rank = "Second Lieutenant"
                rankimg = "https://i.imgur.com/1Oor2V6.png"
              elsif value["response"]["rank"] == 18
                rank = "First Lieutenant"
                rankimg = "https://i.imgur.com/03s6YiZ.png"
              elsif value["response"]["rank"] == 19
                rank = "Captain"
                rankimg = "https://i.imgur.com/kf8Uo7U.png"
              elsif value["response"]["rank"] == 20
                rank = "Major"
                rankimg = "https://i.imgur.com/Zl9q3rP.png"
              elsif value["response"]["rank"] == 21
                rank = "Lieutenant Colonel"
                rankimg = "https://i.imgur.com/bmTEps1.png"
              elsif value["response"]["rank"] == 22
                rank = "Colonel"
                rankimg = "https://i.imgur.com/Ac9S6w7.png"
              elsif value["response"]["rank"] == 23
                rank = "Brigadier"
                rankimg = "https://i.imgur.com/vBo95NA.png"
              elsif value["response"]["rank"] == 24
                rank = "Major General"
                rankimg = "https://i.imgur.com/YOuPegl.png"
              elsif value["response"]["rank"] == 25
                rank = "Lieutenant General"
                rankimg = "https://i.imgur.com/dYh43EF.png"
              elsif value["response"]["rank"] == 26
                rank = "General"
                rankimg = "https://i.imgur.com/59NrDOX.png"
              elsif value["response"]["rank"] == 27
                rank = "Marshal"
                rankimg = "https://i.imgur.com/S4smUqx.png"
              elsif value["response"]["rank"] == 28
                rank = "Field Marshal"
                rankimg = "https://i.imgur.com/DRmWUfj.png"
              elsif value["response"]["rank"] == 29
                rank = "Commander"
                rankimg = "https://i.imgur.com/lZu9Rqt.png"
              elsif value["response"]["rank"] == 30
                rank = "Generalissimo"
                rankimg = "https://i.imgur.com/Fggz9xh.png"
              elsif value["response"]["rank"].as_i > 31
                rankimg = "https://i.imgur.com/NahcZQ9.png"
                numrank = value["response"]["rank"].as_i - 30
                rank = "Legend #{numrank}"
              elsif value["response"]["rank"] == 31
                rank = "Legend 1"
                rankimg = "https://i.imgur.com/NahcZQ9.png"
              end
            end

            resistan = valuee["response"]["resistanceModules"].size.to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse

            turr = valuee["response"]["turretsPlayed"].size.to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse

            exp = value["response"]["score"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse
            expc = value["response"]["scoreNext"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse
            nex = value["response"]["scoreNext"].as_i - value["response"]["score"].as_i
            nexx = nex.to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse

            kills = value["response"]["kills"]
            deaths = value["response"]["deaths"]
            if deaths != 0
              kkd = kills.as_i.to_f / deaths.as_i
              kd = kkd.round(2)
            else
              kd = "Infinite"
            end

            timeplayedms = (value["response"]["modesPlayed"][0]["timePlayed"].as_i / 1000) + (value["response"]["modesPlayed"][1]["timePlayed"].as_i / 1000) + (value["response"]["modesPlayed"][2]["timePlayed"].as_i / 1000) + (value["response"]["modesPlayed"][3]["timePlayed"].as_i / 1000) + (value["response"]["modesPlayed"][4]["timePlayed"].as_i / 1000) + (value["response"]["modesPlayed"][5]["timePlayed"].as_i / 1000) + (value["response"]["modesPlayed"][6]["timePlayed"].as_i / 1000)
            total_seconds = timeplayedms
            seconds = total_seconds % 60
            minutes = (total_seconds / 60) % 60
            hours = total_seconds / (60 * 60)
            timeplayedf = "#{hours.to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse} Hours #{minutes} Minutes #{seconds} Seconds"

            mines = value["response"]["suppliesUsage"][4]["usages"]
            repair = value["response"]["suppliesUsage"][0]["usages"]
            golbo = value["response"]["suppliesUsage"][3]["usages"]
            darm = value["response"]["suppliesUsage"][5]["usages"]
            spebo = value["response"]["suppliesUsage"][2]["usages"]
            ddu = value["response"]["suppliesUsage"][1]["usages"]
            bu = value["response"]["suppliesUsage"][6]["usages"]

            ttootal = mines.as_i + repair.as_i + golbo.as_i + darm.as_i + spebo.as_i + ddu.as_i + bu.as_i

            miness = value["response"]["suppliesUsage"][4]["name"]
            repairr = value["response"]["suppliesUsage"][0]["name"]
            golboo = value["response"]["suppliesUsage"][3]["name"]
            darmm = value["response"]["suppliesUsage"][5]["name"]
            speboo = value["response"]["suppliesUsage"][2]["name"]
            dduu = value["response"]["suppliesUsage"][1]["name"]
            buu = value["response"]["suppliesUsage"][6]["name"]

            if value["response"]["rating"]["crystals"]["value"] == -1
              valcr = "0"
              upordowncr = nil
            elsif value["response"]["rating"]["crystals"]["value"].as_i > value["response"]["previousRating"]["crystals"]["value"].as_i
              valcr = value["response"]["rating"]["crystals"]["value"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse
              colorcr = "emerald-text"
              upordowncr = "▲"
            elsif value["response"]["rating"]["crystals"]["value"].as_i < value["response"]["previousRating"]["crystals"]["value"].as_i
              valcr = value["response"]["rating"]["crystals"]["value"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse
              colorcr = "pomegranate-text"
              upordowncr = "▼"
            else
              valcr = value["response"]["rating"]["score"]["value"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse
              colorcr = "pomegranate-text"
              upordowncr = nil
            end

            if value["response"]["rating"]["score"]["value"] == -1
              valsr = "0"
              upordownsr = nil
            elsif value["response"]["rating"]["score"]["value"].as_i > value["response"]["previousRating"]["score"]["value"].as_i
              valsr = value["response"]["rating"]["score"]["value"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse
              colorsr = "emerald-text"
              upordownsr = "▲"
            elsif value["response"]["rating"]["score"]["value"].as_i < value["response"]["previousRating"]["score"]["value"].as_i
              valsr = value["response"]["rating"]["score"]["value"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse
              colorsr = "pomegranate-text"
              upordownsr = "▼"
            else
              valsr = value["response"]["rating"]["score"]["value"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse
              colorsr = "pomegranate-text"
              upordownsr = nil
            end

            if value["response"]["rating"]["golds"]["value"] == -1
              valgd = "0"
              upordowngd = nil
            elsif value["response"]["rating"]["golds"]["value"].as_i > value["response"]["previousRating"]["golds"]["value"].as_i
              valgd = value["response"]["rating"]["golds"]["value"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse
              colorgd = "emerald-text"
              upordowngd = "▲"
            elsif value["response"]["rating"]["golds"]["value"].as_i < value["response"]["previousRating"]["golds"]["value"].as_i
              valgd = value["response"]["rating"]["golds"]["value"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse
              colorgd = "pomegranate-text"
              upordowngd = "▼"
            else
              valgd = value["response"]["rating"]["golds"]["value"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse
              colorgd = "pomegranate-text"
              upordowngd = nil
            end

            if value["response"]["rating"]["efficiency"]["value"] == -1
              valef = "0"
            else
              valefff = value["response"]["rating"]["efficiency"]["value"]
              valef = valefff.as_i.round(-2).to_s.chomp("00").to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse
            end

            if value["response"]["rating"]["efficiency"]["position"] == -1
              valeff = "0"
            else
              valeff = value["response"]["rating"]["efficiency"]["position"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse
            end

            if value["response"]["rating"]["crystals"]["position"] == -1
              valcrr = "0"
            else
              valcrr = value["response"]["rating"]["crystals"]["position"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse
            end

            if value["response"]["rating"]["golds"]["position"] == -1
              valgdd = "0"
            else
              valgdd = value["response"]["rating"]["golds"]["position"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse
            end

            if value["response"]["rating"]["score"]["position"] == -1
              valsrr = "0"
            else
              valsrr = value["response"]["rating"]["score"]["position"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse
            end

            if value["response"]["previousRating"]["crystals"]["position"] == -1
              valcrrc = "0"
            else
              valcrrc = value["response"]["previousRating"]["crystals"]["position"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse
            end

            if value["response"]["previousRating"]["golds"]["position"] == -1
              valgddg = "0"
            else
              valgddg = value["response"]["previousRating"]["golds"]["position"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse
            end

            if value["response"]["previousRating"]["score"]["position"] == -1
              valsrrs = "0"
            else
              valsrrs = value["response"]["previousRating"]["score"]["position"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse
            end

            if value["response"]["previousRating"]["crystals"]["value"] == -1
              valcrrcc = "0"
            else
              valcrrcc = value["response"]["previousRating"]["crystals"]["value"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse
            end

            if value["response"]["previousRating"]["golds"]["value"] == -1
              valgddgg = "0"
            else
              valgddgg = value["response"]["previousRating"]["golds"]["value"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse
            end

            if value["response"]["previousRating"]["score"]["value"] == -1
              valsrrss = "0"
            else
              valsrrss = value["response"]["previousRating"]["score"]["value"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse
            end

            crys = value["response"]["earnedCrystals"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse
            gold = value["response"]["caughtGolds"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse

            imggnamee = rand(1..1650)
            LibMagick.magickWandGenesis
            m_wand = LibMagick.newMagickWand
            d_wand = LibMagick.newDrawingWand
            p_wand = LibMagick.newPixelWand
            pp_wand = LibMagick.newPixelWand
            if LibMagick.magickReadImage(m_wand, "./src/images/taaan.jpg")
              LibMagick.pixelSetColor p_wand, "white"
              LibMagick.drawSetFillColor d_wand, p_wand
              LibMagick.drawSetFont d_wand, "Arial-Bold"
              LibMagick.drawSetFontSize d_wand, 40
              LibMagick.drawSetTextAntialias d_wand, true
              LibMagick.drawSetTextAlignment d_wand, LibMagick::AlignType::LeftAlign
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.drawSetStrokeWidth d_wand, 0
              LibMagick.drawSetStrokeAntialias d_wand, false
              LibMagick.drawSetFont d_wand, "Tahoma"
              LibMagick.drawAnnotation d_wand, 0, 1190, "Requested By: #{payload.author.username}##{payload.author.discriminator} | https://ratings.geopjr.xyz/"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.drawSetTextAlignment d_wand, LibMagick::AlignType::CenterAlign
              LibMagick.drawSetFontSize d_wand, 40
              LibMagick.drawSetFont d_wand, "Arial-Bold"
              LibMagick.drawAnnotation d_wand, 500, 50, "#{value["response"]["name"]}"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.drawSetFontSize d_wand, 35
              LibMagick.pixelSetColor p_wand, "#3498db"
              LibMagick.drawAnnotation d_wand, 500, 100, "#{rank}"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.drawSetFontSize d_wand, 35
              LibMagick.drawAnnotation d_wand, 500, 150, "Playtime: #{timeplayedf}"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.pixelSetColor p_wand, "#3498db"
              LibMagick.drawAnnotation d_wand, 750, 250, "Resistance Modules:"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.pixelSetColor p_wand, "white"
              LibMagick.drawAnnotation d_wand, 750, 290, "#{resistan}"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.pixelSetColor p_wand, "#3498db"
              LibMagick.drawAnnotation d_wand, 750, 330, "Turrets Played:"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.pixelSetColor p_wand, "white"
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.drawAnnotation d_wand, 750, 370, "#{turr}"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.pixelSetColor p_wand, "#3498db"
              LibMagick.drawAnnotation d_wand, 750, 410, "Mines Used:"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.pixelSetColor p_wand, "white"
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.drawAnnotation d_wand, 750, 450, "#{mines}"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.pixelSetColor p_wand, "#3498db"
              LibMagick.drawAnnotation d_wand, 750, 490, "Repair Kits Used:"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.pixelSetColor p_wand, "white"
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.drawAnnotation d_wand, 750, 530, "#{repair}"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.pixelSetColor p_wand, "#3498db"
              LibMagick.drawAnnotation d_wand, 750, 570, "Gold Boxes Used:"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.pixelSetColor p_wand, "white"
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.drawAnnotation d_wand, 750, 610, "#{golbo}"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.pixelSetColor p_wand, "#3498db"
              LibMagick.drawAnnotation d_wand, 750, 650, "Double Armors Used:"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.pixelSetColor p_wand, "white"
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.drawAnnotation d_wand, 750, 690, "#{darm}"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.pixelSetColor p_wand, "#3498db"
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.drawAnnotation d_wand, 750, 730, "Speed Boosts Used:"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.pixelSetColor p_wand, "white"
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.drawAnnotation d_wand, 750, 770, "#{spebo}"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.pixelSetColor p_wand, "#3498db"
              LibMagick.drawAnnotation d_wand, 750, 810, "Double Damage Used:"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.pixelSetColor p_wand, "white"
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.drawAnnotation d_wand, 750, 850, "#{ddu}"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.pixelSetColor p_wand, "#3498db"
              LibMagick.drawAnnotation d_wand, 750, 890, "Batteries Used:"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.pixelSetColor p_wand, "white"
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.drawAnnotation d_wand, 750, 930, "#{bu}"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.pixelSetColor p_wand, "#3498db"
              LibMagick.drawAnnotation d_wand, 750, 970, "Total:"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.pixelSetColor p_wand, "white"
              LibMagick.drawAnnotation d_wand, 750, 1010, "#{ttootal.to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.pixelSetColor p_wand, "#3498db"
              LibMagick.drawAnnotation d_wand, 250, 250, "EXP:"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.pixelSetColor p_wand, "white"
              LibMagick.drawAnnotation d_wand, 250, 290, "#{exp}/#{expc}"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.pixelSetColor p_wand, "#3498db"
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.drawAnnotation d_wand, 250, 330, "EXP Left:"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.pixelSetColor p_wand, "white"
              LibMagick.drawAnnotation d_wand, 250, 370, "#{nexx} exp"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.pixelSetColor p_wand, "#3498db"
              LibMagick.drawAnnotation d_wand, 250, 410, "Golds Caught:"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.pixelSetColor p_wand, "white"
              LibMagick.drawAnnotation d_wand, 250, 450, "#{gold}"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.pixelSetColor p_wand, "#3498db"
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.drawAnnotation d_wand, 250, 490, "Crystals:"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.pixelSetColor p_wand, "white"
              LibMagick.drawAnnotation d_wand, 250, 530, "#{crys}"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.pixelSetColor p_wand, "#3498db"
              LibMagick.drawAnnotation d_wand, 250, 570, "Kills:"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.pixelSetColor p_wand, "white"
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.drawAnnotation d_wand, 250, 610, "#{kills}"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.pixelSetColor p_wand, "#3498db"
              LibMagick.drawAnnotation d_wand, 250, 650, "Deaths:"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.pixelSetColor p_wand, "white"
              LibMagick.drawAnnotation d_wand, 250, 690, "#{deaths}"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.pixelSetColor p_wand, "#3498db"
              LibMagick.drawAnnotation d_wand, 250, 730, "K/D:"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.pixelSetColor p_wand, "white"
              LibMagick.drawAnnotation d_wand, 250, 770, "#{kd}"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.pixelSetColor p_wand, "#3498db"
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.drawAnnotation d_wand, 250, 810, "Efficiency Rating Place | Value:"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.pixelSetColor p_wand, "white"
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.drawAnnotation d_wand, 250, 850, "#{valeff} | #{valef}"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.pixelSetColor p_wand, "#3498db"
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.drawAnnotation d_wand, 250, 890, "Experience Rating Place | Value:"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.pixelSetColor p_wand, "white"
              LibMagick.drawAnnotation d_wand, 250, 930, "#{valsrr} | #{valsr}"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.pixelSetColor p_wand, "#3498db"
              LibMagick.drawAnnotation d_wand, 250, 970, "Gold Box Rating Place | Value:"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.pixelSetColor p_wand, "white"
              LibMagick.drawAnnotation d_wand, 250, 1010, "#{valgdd} | #{valgd}"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.pixelSetColor p_wand, "#3498db"
              LibMagick.drawAnnotation d_wand, 250, 1050, "Crystals Rating Place | Value:"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.pixelSetColor p_wand, "white"
              LibMagick.drawSetFontSize d_wand, 25
              LibMagick.drawAnnotation d_wand, 250, 1090, "#{valcrr} | #{valcr}"
              LibMagick.magickDrawImage m_wand, d_wand
              LibMagick.magickTrimImage m_wand, 0
              LibMagick.magickWriteImage m_wand, "#{imggnamee}tanki.png"
            end
            LibMagick.destroyPixelWand p_wand
            LibMagick.destroyPixelWand pp_wand
            LibMagick.destroyDrawingWand d_wand
            LibMagick.destroyMagickWand m_wand
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
