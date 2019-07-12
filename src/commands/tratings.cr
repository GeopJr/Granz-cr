module Granz
  module Tratings
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if PREFIX.any? { |p| payload.content.starts_with?("#{p}tratings") }
        no_space = payload.content.gsub("#{PREFIX[1]} ", "#{PREFIX[1]}").gsub("#{PREFIX[3]} ", "#{PREFIX[3]}")
        args_count = no_space.split(" ")
        if args_count.size > 2
          embed = Discord::Embed.new(
            colour: 0xffff00,
            title: "Too many arguments"
          )
          BOT.create_message(payload.channel_id, "", embed)
        elsif args_count.size > 1
          args = no_space.gsub("tratings ", "").gsub("#{PREFIX[1]}", "").gsub("#{PREFIX[3]}", "").gsub("#{PREFIX[0]}", "")
          begin
            response = HTTP::Client.get "https://ratings.tankionline.com/api/eu/profile/?user=#{args}"
            value_hash = JSON.parse(response.body).as_h
            value = JSON.parse(response.body)
            url = "https://ratings.geopjr.xyz/ratings?name=#{args}"

            if value["response"]["hasPremium"] == false
              prem = "<:xmark:314349398824058880>"
            elsif value["response"]["hasPremium"] == true
              prem = "<:check:314349398811475968>"
            end

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

            resistance_mod = value_hash["response"]["resistanceModules"].size.to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse

            turret = value_hash["response"]["turretsPlayed"].size.to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse

            exp = value["response"]["score"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse
            exp_next = value["response"]["scoreNext"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse
            nex = value["response"]["scoreNext"].as_i - value["response"]["score"].as_i
            exp_diff = nex.to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse

            kills = value["response"]["kills"]
            deaths = value["response"]["deaths"]
            if deaths != 0
              kd = (kills.as_i.to_f / deaths.as_i).round(2)
            else
              kd = "Infinite"
            end

            timeplayedms = value["response"]["modesPlayed"][0]["timePlayed"].as_i64 + value["response"]["modesPlayed"][1]["timePlayed"].as_i64 + value["response"]["modesPlayed"][2]["timePlayed"].as_i64 + value["response"]["modesPlayed"][3]["timePlayed"].as_i64 + value["response"]["modesPlayed"][4]["timePlayed"].as_i64 + value["response"]["modesPlayed"][5]["timePlayed"].as_i64 + value["response"]["modesPlayed"][6]["timePlayed"].as_i64
            total_seconds = timeplayedms / 1000
            seconds = total_seconds % 60
            minutes = (total_seconds / 60) % 60
            hours = total_seconds / (60 * 60)
            timeplayed_string = "#{hours.to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse} Hours #{minutes} Minutes #{seconds} Seconds"
            crys = value["response"]["earnedCrystals"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse
            gold = value["response"]["caughtGolds"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse

            embed = Discord::Embed.new(

              colour: 0xffff00,
              title: "Stats of #{value["response"]["name"]}",
              footer: Discord::EmbedFooter.new(
                text: "\xE3\x80\x8EGeop\xE3\x80\x8F#4066",
                icon_url: "https://cdn.discordapp.com/avatars/216156825978929152/c7eaee00bbe99b16304429fb9b9116ea.png"
              ),
              url: "https://ratings.geopjr.xyz/ratings?name=#{args}",
              thumbnail: Discord::EmbedThumbnail.new(
                url: "#{rankimg}"
              ),
              author: Discord::EmbedAuthor.new(
                name: "Granz#8561",
                icon_url: "https://cdn.discordapp.com/avatars/443053627419000833/333d3868fa0837e800e6515558fd8179.png"
              ),
              fields: [Discord::EmbedField.new(
                name: "👨__Name__",
                value: "#{value["response"]["name"]}",
                inline: true
              ),
              Discord::EmbedField.new(
                name: "🎖️__Rank__",
                value: "#{rank}",
                inline: true
              ),
              Discord::EmbedField.new(
                name: "🏅__Premium__",
                value: "#{prem}",
                inline: true
              ),
              Discord::EmbedField.new(
                name: "⏰__Playtime__",
                value: "#{timeplayed_string}",
                inline: true
              ),
              Discord::EmbedField.new(
                name: "<:GoldBoxIcon:482918640820289546>__Gold Boxes Caught__",
                value: "#{gold}",
                inline: true
              ),
              Discord::EmbedField.new(
                name: "💎__Obtained Crystals__",
                value: "#{crys}",
                inline: true
              ),
              Discord::EmbedField.new(
                name: "📟__Resistance Modules__",
                value: "#{resistance_mod}",
                inline: true
              ),
              Discord::EmbedField.new(
                name: "🤖__Turrets Played__",
                value: "#{turret}",
                inline: true
              ),
              Discord::EmbedField.new(
                name: "<:DoubleDamageIcon:482918526596939776>__Kills__",
                value: "#{kills.to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}",
                inline: true
              ),
              Discord::EmbedField.new(
                name: "💀__Deaths__",
                value: "#{deaths.to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}",
                inline: true
              ),
              Discord::EmbedField.new(
                name: "⚰️__K/D__",
                value: "#{kd}",
                inline: true
              ),
              Discord::EmbedField.new(
                name: "⚙️__Gear Score__",
                value: "#{value["response"]["gearScore"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}",
                inline: true
              ),
              Discord::EmbedField.new(
                name: "⬆️__EXP__",
                value: "#{exp}/#{exp_next}",
                inline: true
              ),
              Discord::EmbedField.new(
                name: "⬆️__EXP left to rank up__",
                value: "#{exp_diff} exp",
                inline: true
              ),
              ]
            )
            BOT.create_message(payload.channel_id, "", embed)
          rescue
            embed = Discord::Embed.new(
              colour: 0xffff00,
              title: "I am afraid there is not such user in existance"
            )
            BOT.create_message(payload.channel_id, "", embed)
          end
        else
          begin
            responses = HTTP::Client.get "https://api.myjson.com/bins/15dlne"
            values = JSON.parse(responses.body)

            response = HTTP::Client.get "https://ratings.tankionline.com/api/eu/profile/?user=#{values[payload.author.id.to_s]}"
            value_hash = JSON.parse(response.body).as_h
            value = JSON.parse(response.body)
            url = "https://ratings.geopjr.xyz/ratings?name=#{value["response"]["name"]}"

            if value["response"]["hasPremium"] == false
              prem = "<:xmark:314349398824058880>"
            elsif value["response"]["hasPremium"] == true
              prem = "<:check:314349398811475968>"
            end

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

            resistance_mod = value_hash["response"]["resistanceModules"].size.to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse

            turret = value_hash["response"]["turretsPlayed"].size.to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse

            exp = value["response"]["score"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse
            exp_next = value["response"]["scoreNext"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse
            nex = value["response"]["scoreNext"].as_i - value["response"]["score"].as_i
            exp_diff = nex.to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse

            kills = value["response"]["kills"]
            deaths = value["response"]["deaths"]
            if deaths != 0
              kkd = kills.as_i.to_f / deaths.as_i
              kd = kkd.round(2)
            else
              kd = "Infinite"
            end

            timeplayedms = value["response"]["modesPlayed"][0]["timePlayed"].as_i64 + value["response"]["modesPlayed"][1]["timePlayed"].as_i64 + value["response"]["modesPlayed"][2]["timePlayed"].as_i64 + value["response"]["modesPlayed"][3]["timePlayed"].as_i64 + value["response"]["modesPlayed"][4]["timePlayed"].as_i64 + value["response"]["modesPlayed"][5]["timePlayed"].as_i64 + value["response"]["modesPlayed"][6]["timePlayed"].as_i64
            total_seconds = timeplayedms / 1000
            seconds = total_seconds % 60
            minutes = (total_seconds / 60) % 60
            hours = total_seconds / (60 * 60)
            timeplayed_string = "#{hours.to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse} Hours #{minutes} Minutes #{seconds} Seconds"
            crys = value["response"]["earnedCrystals"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse
            gold = value["response"]["caughtGolds"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse

            embed = Discord::Embed.new(

              colour: 0xffff00,
              title: "Stats of #{value["response"]["name"]}",
              footer: Discord::EmbedFooter.new(
                text: "\xE3\x80\x8EGeop\xE3\x80\x8F#4066",
                icon_url: "https://cdn.discordapp.com/avatars/216156825978929152/c7eaee00bbe99b16304429fb9b9116ea.png"
              ),
              url: "#{url}",
              thumbnail: Discord::EmbedThumbnail.new(
                url: "#{rankimg}"
              ),
              author: Discord::EmbedAuthor.new(
                name: "Granz#8561",
                icon_url: "https://cdn.discordapp.com/avatars/443053627419000833/333d3868fa0837e800e6515558fd8179.png"
              ),
              fields: [Discord::EmbedField.new(
                name: "👨__Name__",
                value: "#{value["response"]["name"]}",
                inline: true
              ),
              Discord::EmbedField.new(
                name: "🎖️__Rank__",
                value: "#{rank}",
                inline: true
              ),
              Discord::EmbedField.new(
                name: "🏅__Premium__",
                value: "#{prem}",
                inline: true
              ),
              Discord::EmbedField.new(
                name: "⏰__Playtime__",
                value: "#{timeplayed_string}",
                inline: true
              ),
              Discord::EmbedField.new(
                name: "<:GoldBoxIcon:482918640820289546>__Gold Boxes Caught__",
                value: "#{gold}",
                inline: true
              ),
              Discord::EmbedField.new(
                name: "💎__Obtained Crystals__",
                value: "#{crys}",
                inline: true
              ),
              Discord::EmbedField.new(
                name: "📟__Resistance Modules__",
                value: "#{resistance_mod}",
                inline: true
              ),
              Discord::EmbedField.new(
                name: "🤖__Turrets Played__",
                value: "#{turret}",
                inline: true
              ),
              Discord::EmbedField.new(
                name: "<:DoubleDamageIcon:482918526596939776>__Kills__",
                value: "#{kills.to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}",
                inline: true
              ),
              Discord::EmbedField.new(
                name: "💀__Deaths__",
                value: "#{deaths.to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}",
                inline: true
              ),
              Discord::EmbedField.new(
                name: "⚰️__K/D__",
                value: "#{kd}",
                inline: true
              ),
              Discord::EmbedField.new(
                name: "⚙️__Gear Score__",
                value: "#{value["response"]["gearScore"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}",
                inline: true
              ),
              Discord::EmbedField.new(
                name: "⬆️__EXP__",
                value: "#{exp}/#{exp_next}",
                inline: true
              ),
              Discord::EmbedField.new(
                name: "⬆️__EXP left to rank up__",
                value: "#{exp_diff} exp",
                inline: true
              ),
              ]
            )
            BOT.create_message(payload.channel_id, "", embed)
          rescue
            embed = Discord::Embed.new(
              colour: 0xffff00,
              title: "Usage: #{PREFIX[0]}tratings <username>",
              description: "Or use __#{PREFIX[0]}tanki <username>__ to get your ratings without typing your username each time!"
            )
            BOT.create_message(payload.channel_id, "", embed)
          end
        end
      end
    end
  end
end
