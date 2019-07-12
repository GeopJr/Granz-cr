module Granz
  module Tsupplies
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if PREFIX.any? { |p| payload.content.starts_with?("#{p}tsupplies") }
        no_space = payload.content.gsub("#{PREFIX[1]} ", "#{PREFIX[1]}").gsub("#{PREFIX[3]} ", "#{PREFIX[3]}")
        args_count = no_space.split(" ")
        if args_count.size > 2
          embed = Discord::Embed.new(
            colour: 0xffff00,
            title: "Too many arguments"
          )
          BOT.create_message(payload.channel_id, "", embed)
        elsif args_count.size > 1
          args = no_space.gsub("tsupplies ", "").gsub("#{PREFIX[1]}", "").gsub("#{PREFIX[3]}", "").gsub("#{PREFIX[0]}", "")
          begin
            response = HTTP::Client.get "https://ratings.tankionline.com/api/eu/profile/?user=#{args}"
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
            mines = value["response"]["suppliesUsage"][0]["usages"]
            repair = value["response"]["suppliesUsage"][1]["usages"]
            golbo = value["response"]["suppliesUsage"][2]["usages"]
            darm = value["response"]["suppliesUsage"][3]["usages"]
            spebo = value["response"]["suppliesUsage"][4]["usages"]
            ddu = value["response"]["suppliesUsage"][5]["usages"]
            bu = value["response"]["suppliesUsage"][6]["usages"]

            total = mines.as_i + repair.as_i + golbo.as_i + darm.as_i + spebo.as_i + ddu.as_i + bu.as_i

            miness = value["response"]["suppliesUsage"][4]["name"]
            repairr = value["response"]["suppliesUsage"][0]["name"]
            golboo = value["response"]["suppliesUsage"][3]["name"]
            darmm = value["response"]["suppliesUsage"][5]["name"]
            speboo = value["response"]["suppliesUsage"][2]["name"]
            dduu = value["response"]["suppliesUsage"][1]["name"]
            buu = value["response"]["suppliesUsage"][6]["name"]

            if value["response"]["suppliesUsage"][0]["name"].as_s == "Repair Kit"
              emoji0 = "<:RepairKitIcon:482918499719708683>"
              name0 = "Repair Kits"
            elsif value["response"]["suppliesUsage"][0]["name"].as_s == "Double Damage"
              emoji0 = "<:DoubleDamageIcon:482918526596939776>"
              name0 = "Double Damage"
            elsif value["response"]["suppliesUsage"][0]["name"].as_s == "Speed Boost"
              emoji0 = "<:SpeedBoostIcon:482918535786659842>"
              name0 = "Speed Boost"
            elsif value["response"]["suppliesUsage"][0]["name"].as_s == "Gold box"
              emoji0 = "<:GoldBoxIcon:482918640820289546> "
              name0 = "Golds"
            elsif value["response"]["suppliesUsage"][0]["name"].as_s == "Double Armor"
              emoji0 = "<:DoubleArmourIcon:482918515834224671>"
              name0 = "Double Armour"
            elsif value["response"]["suppliesUsage"][0]["name"].as_s == "Mine"
              emoji0 = "<:MineIcon:482918544133324812>"
              name0 = "Mines"
            elsif value["response"]["suppliesUsage"][0]["name"].as_s == "Battery"
              emoji0 = "<:DroneIcon:482918650102415380>"
              name0 = "Batteries"
            end

            if value["response"]["suppliesUsage"][1]["name"].as_s == "Repair Kit"
              emoji1 = "<:RepairKitIcon:482918499719708683>"
              name1 = "Repair Kits"
            elsif value["response"]["suppliesUsage"][1]["name"].as_s == "Double Damage"
              emoji1 = "<:DoubleDamageIcon:482918526596939776>"
              name1 = "Double Damage"
            elsif value["response"]["suppliesUsage"][1]["name"].as_s == "Speed Boost"
              emoji1 = "<:SpeedBoostIcon:482918535786659842>"
              name1 = "Speed Boost"
            elsif value["response"]["suppliesUsage"][1]["name"].as_s == "Gold box"
              emoji1 = "<:GoldBoxIcon:482918640820289546> "
              name1 = "Golds"
            elsif value["response"]["suppliesUsage"][1]["name"].as_s == "Double Armor"
              emoji1 = "<:DoubleArmourIcon:482918515834224671>"
              name1 = "Double Armour"
            elsif value["response"]["suppliesUsage"][1]["name"].as_s == "Mine"
              emoji1 = "<:MineIcon:482918544133324812>"
              name1 = "Mines"
            elsif value["response"]["suppliesUsage"][1]["name"].as_s == "Battery"
              emoji1 = "<:DroneIcon:482918650102415380>"
              name1 = "Batteries"
            end

            if value["response"]["suppliesUsage"][2]["name"].as_s == "Repair Kit"
              emoji2 = "<:RepairKitIcon:482918499719708683>"
              name2 = "Repair Kits"
            elsif value["response"]["suppliesUsage"][2]["name"].as_s == "Double Damage"
              emoji2 = "<:DoubleDamageIcon:482918526596939776>"
              name2 = "Double Damage"
            elsif value["response"]["suppliesUsage"][2]["name"].as_s == "Speed Boost"
              emoji2 = "<:SpeedBoostIcon:482918535786659842>"
              name2 = "Speed Boost"
            elsif value["response"]["suppliesUsage"][2]["name"].as_s == "Gold box"
              emoji2 = "<:GoldBoxIcon:482918640820289546> "
              name2 = "Golds"
            elsif value["response"]["suppliesUsage"][2]["name"].as_s == "Double Armor"
              emoji2 = "<:DoubleArmourIcon:482918515834224671>"
              name2 = "Double Armour"
            elsif value["response"]["suppliesUsage"][2]["name"].as_s == "Mine"
              emoji2 = "<:MineIcon:482918544133324812>"
              name2 = "Mines"
            elsif value["response"]["suppliesUsage"][2]["name"].as_s == "Battery"
              emoji2 = "<:DroneIcon:482918650102415380>"
              name2 = "Batteries"
            end

            if value["response"]["suppliesUsage"][3]["name"].as_s == "Repair Kit"
              emoji3 = "<:RepairKitIcon:482918499719708683>"
              name3 = "Repair Kits"
            elsif value["response"]["suppliesUsage"][3]["name"].as_s == "Double Damage"
              emoji3 = "<:DoubleDamageIcon:482918526596939776>"
              name3 = "Double Damage"
            elsif value["response"]["suppliesUsage"][3]["name"].as_s == "Speed Boost"
              emoji3 = "<:SpeedBoostIcon:482918535786659842>"
              name3 = "Speed Boost"
            elsif value["response"]["suppliesUsage"][3]["name"].as_s == "Gold box"
              emoji3 = "<:GoldBoxIcon:482918640820289546> "
              name3 = "Golds"
            elsif value["response"]["suppliesUsage"][3]["name"].as_s == "Double Armor"
              emoji3 = "<:DoubleArmourIcon:482918515834224671>"
              name3 = "Double Armour"
            elsif value["response"]["suppliesUsage"][3]["name"].as_s == "Mine"
              emoji3 = "<:MineIcon:482918544133324812>"
              name3 = "Mines"
            elsif value["response"]["suppliesUsage"][3]["name"].as_s == "Battery"
              emoji3 = "<:DroneIcon:482918650102415380>"
              name3 = "Batteries"
            end

            if value["response"]["suppliesUsage"][4]["name"].as_s == "Repair Kit"
              emoji4 = "<:RepairKitIcon:482918499719708683>"
              name4 = "Repair Kits"
            elsif value["response"]["suppliesUsage"][4]["name"].as_s == "Double Damage"
              emoji4 = "<:DoubleDamageIcon:482918526596939776>"
              name4 = "Double Damage"
            elsif value["response"]["suppliesUsage"][4]["name"].as_s == "Speed Boost"
              emoji4 = "<:SpeedBoostIcon:482918535786659842>"
              name4 = "Speed Boost"
            elsif value["response"]["suppliesUsage"][4]["name"].as_s == "Gold box"
              emoji4 = "<:GoldBoxIcon:482918640820289546> "
              name4 = "Golds"
            elsif value["response"]["suppliesUsage"][4]["name"].as_s == "Double Armor"
              emoji4 = "<:DoubleArmourIcon:482918515834224671>"
              name4 = "Double Armour"
            elsif value["response"]["suppliesUsage"][4]["name"].as_s == "Mine"
              emoji4 = "<:MineIcon:482918544133324812>"
              name4 = "Mines"
            elsif value["response"]["suppliesUsage"][4]["name"].as_s == "Battery"
              emoji4 = "<:DroneIcon:482918650102415380>"
              name4 = "Batteries"
            end

            if value["response"]["suppliesUsage"][5]["name"].as_s == "Repair Kit"
              emoji5 = "<:RepairKitIcon:482918499719708683>"
              name5 = "Repair Kits"
            elsif value["response"]["suppliesUsage"][5]["name"].as_s == "Double Damage"
              emoji5 = "<:DoubleDamageIcon:482918526596939776>"
              name5 = "Double Damage"
            elsif value["response"]["suppliesUsage"][5]["name"].as_s == "Speed Boost"
              emoji5 = "<:SpeedBoostIcon:482918535786659842>"
              name5 = "Speed Boost"
            elsif value["response"]["suppliesUsage"][5]["name"].as_s == "Gold box"
              emoji5 = "<:GoldBoxIcon:482918640820289546> "
              name5 = "Golds"
            elsif value["response"]["suppliesUsage"][5]["name"].as_s == "Double Armor"
              emoji5 = "<:DoubleArmourIcon:482918515834224671>"
              name5 = "Double Armour"
            elsif value["response"]["suppliesUsage"][5]["name"].as_s == "Mine"
              emoji5 = "<:MineIcon:482918544133324812>"
              name5 = "Mines"
            elsif value["response"]["suppliesUsage"][5]["name"].as_s == "Battery"
              emoji5 = "<:DroneIcon:482918650102415380>"
              name5 = "Batteries"
            end

            if value["response"]["suppliesUsage"][6]["name"].as_s == "Repair Kit"
              emoji6 = "<:RepairKitIcon:482918499719708683>"
              name6 = "Repair Kits"
            elsif value["response"]["suppliesUsage"][6]["name"].as_s == "Double Damage"
              emoji6 = "<:DoubleDamageIcon:482918526596939776>"
              name6 = "Double Damage"
            elsif value["response"]["suppliesUsage"][6]["name"].as_s == "Speed Boost"
              emoji6 = "<:SpeedBoostIcon:482918535786659842>"
              name6 = "Speed Boost"
            elsif value["response"]["suppliesUsage"][6]["name"].as_s == "Gold box"
              emoji6 = "<:GoldBoxIcon:482918640820289546> "
              name6 = "Golds"
            elsif value["response"]["suppliesUsage"][6]["name"].as_s == "Double Armor"
              emoji6 = "<:DoubleArmourIcon:482918515834224671>"
              name6 = "Double Armour"
            elsif value["response"]["suppliesUsage"][6]["name"].as_s == "Mine"
              emoji6 = "<:MineIcon:482918544133324812>"
              name6 = "Mines"
            elsif value["response"]["suppliesUsage"][6]["name"].as_s == "Battery"
              emoji6 = "<:DroneIcon:482918650102415380>"
              name6 = "Batteries"
            end

            embed = Discord::Embed.new(

              colour: 0xffff00,
              title: "Supplies of #{value["response"]["name"]}",
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
                name: "#{emoji0}__#{name0} Used__",
                value: "#{mines.to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}",
                inline: true
              ),
                       Discord::EmbedField.new(
                         name: "#{emoji1}__#{name1} Used__",
                         value: "#{repair.to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}",
                         inline: true
                       ),
                       Discord::EmbedField.new(
                         name: "#{emoji2}__#{name2} Used__",
                         value: "#{golbo.to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}",
                         inline: true
                       ),
                       Discord::EmbedField.new(
                         name: "#{emoji3}__#{name3} Used__",
                         value: "#{darm.to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}",
                         inline: true
                       ),
                       Discord::EmbedField.new(
                         name: "#{emoji4}__#{name4} Used__",
                         value: "#{spebo.to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}",
                         inline: true
                       ),
                       Discord::EmbedField.new(
                         name: "#{emoji5}__#{name5} Used__",
                         value: "#{ddu.to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}",
                         inline: true
                       ),
                       Discord::EmbedField.new(
                         name: "#{emoji6}__#{name6} Used__",
                         value: "#{bu.to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}",
                         inline: true
                       ),
                       Discord::EmbedField.new(
                         name: "<:calculator:482936199455965185>__Total__",
                         value: "#{total.to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}",
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
            value = JSON.parse(response.body)
            urll = "https://ratings.geopjr.xyz/ratings?name=#{value["response"]["name"]}"
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
            mines = value["response"]["suppliesUsage"][0]["usages"]
            repair = value["response"]["suppliesUsage"][1]["usages"]
            golbo = value["response"]["suppliesUsage"][2]["usages"]
            darm = value["response"]["suppliesUsage"][3]["usages"]
            spebo = value["response"]["suppliesUsage"][4]["usages"]
            ddu = value["response"]["suppliesUsage"][5]["usages"]
            bu = value["response"]["suppliesUsage"][6]["usages"]

            total = mines.as_i + repair.as_i + golbo.as_i + darm.as_i + spebo.as_i + ddu.as_i + bu.as_i

            miness = value["response"]["suppliesUsage"][4]["name"]
            repairr = value["response"]["suppliesUsage"][0]["name"]
            golboo = value["response"]["suppliesUsage"][3]["name"]
            darmm = value["response"]["suppliesUsage"][5]["name"]
            speboo = value["response"]["suppliesUsage"][2]["name"]
            dduu = value["response"]["suppliesUsage"][1]["name"]
            buu = value["response"]["suppliesUsage"][6]["name"]

            if value["response"]["suppliesUsage"][0]["name"].as_s == "Repair Kit"
              emoji0 = "<:RepairKitIcon:482918499719708683>"
              name0 = "Repair Kits"
            elsif value["response"]["suppliesUsage"][0]["name"].as_s == "Double Damage"
              emoji0 = "<:DoubleDamageIcon:482918526596939776>"
              name0 = "Double Damage"
            elsif value["response"]["suppliesUsage"][0]["name"].as_s == "Speed Boost"
              emoji0 = "<:SpeedBoostIcon:482918535786659842>"
              name0 = "Speed Boost"
            elsif value["response"]["suppliesUsage"][0]["name"].as_s == "Gold box"
              emoji0 = "<:GoldBoxIcon:482918640820289546> "
              name0 = "Golds"
            elsif value["response"]["suppliesUsage"][0]["name"].as_s == "Double Armor"
              emoji0 = "<:DoubleArmourIcon:482918515834224671>"
              name0 = "Double Armour"
            elsif value["response"]["suppliesUsage"][0]["name"].as_s == "Mine"
              emoji0 = "<:MineIcon:482918544133324812>"
              name0 = "Mines"
            elsif value["response"]["suppliesUsage"][0]["name"].as_s == "Battery"
              emoji0 = "<:DroneIcon:482918650102415380>"
              name0 = "Batteries"
            end

            if value["response"]["suppliesUsage"][1]["name"].as_s == "Repair Kit"
              emoji1 = "<:RepairKitIcon:482918499719708683>"
              name1 = "Repair Kits"
            elsif value["response"]["suppliesUsage"][1]["name"].as_s == "Double Damage"
              emoji1 = "<:DoubleDamageIcon:482918526596939776>"
              name1 = "Double Damage"
            elsif value["response"]["suppliesUsage"][1]["name"].as_s == "Speed Boost"
              emoji1 = "<:SpeedBoostIcon:482918535786659842>"
              name1 = "Speed Boost"
            elsif value["response"]["suppliesUsage"][1]["name"].as_s == "Gold box"
              emoji1 = "<:GoldBoxIcon:482918640820289546> "
              name1 = "Golds"
            elsif value["response"]["suppliesUsage"][1]["name"].as_s == "Double Armor"
              emoji1 = "<:DoubleArmourIcon:482918515834224671>"
              name1 = "Double Armour"
            elsif value["response"]["suppliesUsage"][1]["name"].as_s == "Mine"
              emoji1 = "<:MineIcon:482918544133324812>"
              name1 = "Mines"
            elsif value["response"]["suppliesUsage"][1]["name"].as_s == "Battery"
              emoji1 = "<:DroneIcon:482918650102415380>"
              name1 = "Batteries"
            end

            if value["response"]["suppliesUsage"][2]["name"].as_s == "Repair Kit"
              emoji2 = "<:RepairKitIcon:482918499719708683>"
              name2 = "Repair Kits"
            elsif value["response"]["suppliesUsage"][2]["name"].as_s == "Double Damage"
              emoji2 = "<:DoubleDamageIcon:482918526596939776>"
              name2 = "Double Damage"
            elsif value["response"]["suppliesUsage"][2]["name"].as_s == "Speed Boost"
              emoji2 = "<:SpeedBoostIcon:482918535786659842>"
              name2 = "Speed Boost"
            elsif value["response"]["suppliesUsage"][2]["name"].as_s == "Gold box"
              emoji2 = "<:GoldBoxIcon:482918640820289546> "
              name2 = "Golds"
            elsif value["response"]["suppliesUsage"][2]["name"].as_s == "Double Armor"
              emoji2 = "<:DoubleArmourIcon:482918515834224671>"
              name2 = "Double Armour"
            elsif value["response"]["suppliesUsage"][2]["name"].as_s == "Mine"
              emoji2 = "<:MineIcon:482918544133324812>"
              name2 = "Mines"
            elsif value["response"]["suppliesUsage"][2]["name"].as_s == "Battery"
              emoji2 = "<:DroneIcon:482918650102415380>"
              name2 = "Batteries"
            end

            if value["response"]["suppliesUsage"][3]["name"].as_s == "Repair Kit"
              emoji3 = "<:RepairKitIcon:482918499719708683>"
              name3 = "Repair Kits"
            elsif value["response"]["suppliesUsage"][3]["name"].as_s == "Double Damage"
              emoji3 = "<:DoubleDamageIcon:482918526596939776>"
              name3 = "Double Damage"
            elsif value["response"]["suppliesUsage"][3]["name"].as_s == "Speed Boost"
              emoji3 = "<:SpeedBoostIcon:482918535786659842>"
              name3 = "Speed Boost"
            elsif value["response"]["suppliesUsage"][3]["name"].as_s == "Gold box"
              emoji3 = "<:GoldBoxIcon:482918640820289546> "
              name3 = "Golds"
            elsif value["response"]["suppliesUsage"][3]["name"].as_s == "Double Armor"
              emoji3 = "<:DoubleArmourIcon:482918515834224671>"
              name3 = "Double Armour"
            elsif value["response"]["suppliesUsage"][3]["name"].as_s == "Mine"
              emoji3 = "<:MineIcon:482918544133324812>"
              name3 = "Mines"
            elsif value["response"]["suppliesUsage"][3]["name"].as_s == "Battery"
              emoji3 = "<:DroneIcon:482918650102415380>"
              name3 = "Batteries"
            end

            if value["response"]["suppliesUsage"][4]["name"].as_s == "Repair Kit"
              emoji4 = "<:RepairKitIcon:482918499719708683>"
              name4 = "Repair Kits"
            elsif value["response"]["suppliesUsage"][4]["name"].as_s == "Double Damage"
              emoji4 = "<:DoubleDamageIcon:482918526596939776>"
              name4 = "Double Damage"
            elsif value["response"]["suppliesUsage"][4]["name"].as_s == "Speed Boost"
              emoji4 = "<:SpeedBoostIcon:482918535786659842>"
              name4 = "Speed Boost"
            elsif value["response"]["suppliesUsage"][4]["name"].as_s == "Gold box"
              emoji4 = "<:GoldBoxIcon:482918640820289546> "
              name4 = "Golds"
            elsif value["response"]["suppliesUsage"][4]["name"].as_s == "Double Armor"
              emoji4 = "<:DoubleArmourIcon:482918515834224671>"
              name4 = "Double Armour"
            elsif value["response"]["suppliesUsage"][4]["name"].as_s == "Mine"
              emoji4 = "<:MineIcon:482918544133324812>"
              name4 = "Mines"
            elsif value["response"]["suppliesUsage"][4]["name"].as_s == "Battery"
              emoji4 = "<:DroneIcon:482918650102415380>"
              name4 = "Batteries"
            end

            if value["response"]["suppliesUsage"][5]["name"].as_s == "Repair Kit"
              emoji5 = "<:RepairKitIcon:482918499719708683>"
              name5 = "Repair Kits"
            elsif value["response"]["suppliesUsage"][5]["name"].as_s == "Double Damage"
              emoji5 = "<:DoubleDamageIcon:482918526596939776>"
              name5 = "Double Damage"
            elsif value["response"]["suppliesUsage"][5]["name"].as_s == "Speed Boost"
              emoji5 = "<:SpeedBoostIcon:482918535786659842>"
              name5 = "Speed Boost"
            elsif value["response"]["suppliesUsage"][5]["name"].as_s == "Gold box"
              emoji5 = "<:GoldBoxIcon:482918640820289546> "
              name5 = "Golds"
            elsif value["response"]["suppliesUsage"][5]["name"].as_s == "Double Armor"
              emoji5 = "<:DoubleArmourIcon:482918515834224671>"
              name5 = "Double Armour"
            elsif value["response"]["suppliesUsage"][5]["name"].as_s == "Mine"
              emoji5 = "<:MineIcon:482918544133324812>"
              name5 = "Mines"
            elsif value["response"]["suppliesUsage"][5]["name"].as_s == "Battery"
              emoji5 = "<:DroneIcon:482918650102415380>"
              name5 = "Batteries"
            end

            if value["response"]["suppliesUsage"][6]["name"].as_s == "Repair Kit"
              emoji6 = "<:RepairKitIcon:482918499719708683>"
              name6 = "Repair Kits"
            elsif value["response"]["suppliesUsage"][6]["name"].as_s == "Double Damage"
              emoji6 = "<:DoubleDamageIcon:482918526596939776>"
              name6 = "Double Damage"
            elsif value["response"]["suppliesUsage"][6]["name"].as_s == "Speed Boost"
              emoji6 = "<:SpeedBoostIcon:482918535786659842>"
              name6 = "Speed Boost"
            elsif value["response"]["suppliesUsage"][6]["name"].as_s == "Gold box"
              emoji6 = "<:GoldBoxIcon:482918640820289546> "
              name6 = "Golds"
            elsif value["response"]["suppliesUsage"][6]["name"].as_s == "Double Armor"
              emoji6 = "<:DoubleArmourIcon:482918515834224671>"
              name6 = "Double Armour"
            elsif value["response"]["suppliesUsage"][6]["name"].as_s == "Mine"
              emoji6 = "<:MineIcon:482918544133324812>"
              name6 = "Mines"
            elsif value["response"]["suppliesUsage"][6]["name"].as_s == "Battery"
              emoji6 = "<:DroneIcon:482918650102415380>"
              name6 = "Batteries"
            end

            embed = Discord::Embed.new(

              colour: 0xffff00,
              title: "Supplies of #{value["response"]["name"]}",
              footer: Discord::EmbedFooter.new(
                text: "\xE3\x80\x8EGeop\xE3\x80\x8F#4066",
                icon_url: "https://cdn.discordapp.com/avatars/216156825978929152/c7eaee00bbe99b16304429fb9b9116ea.png"
              ),
              url: "#{urll}",
              thumbnail: Discord::EmbedThumbnail.new(
                url: "#{rankimg}"
              ),
              author: Discord::EmbedAuthor.new(
                name: "Granz#8561",
                icon_url: "https://cdn.discordapp.com/avatars/443053627419000833/333d3868fa0837e800e6515558fd8179.png"
              ),
              fields: [Discord::EmbedField.new(
                name: "#{emoji0}__#{name0} Used__",
                value: "#{mines.to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}",
                inline: true
              ),
                       Discord::EmbedField.new(
                         name: "#{emoji1}__#{name1} Used__",
                         value: "#{repair.to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}",
                         inline: true
                       ),
                       Discord::EmbedField.new(
                         name: "#{emoji2}__#{name2} Used__",
                         value: "#{golbo.to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}",
                         inline: true
                       ),
                       Discord::EmbedField.new(
                         name: "#{emoji3}__#{name3} Used__",
                         value: "#{darm.to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}",
                         inline: true
                       ),
                       Discord::EmbedField.new(
                         name: "#{emoji4}__#{name4} Used__",
                         value: "#{spebo.to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}",
                         inline: true
                       ),
                       Discord::EmbedField.new(
                         name: "#{emoji5}__#{name5} Used__",
                         value: "#{ddu.to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}",
                         inline: true
                       ),
                       Discord::EmbedField.new(
                         name: "#{emoji6}__#{name6} Used__",
                         value: "#{bu.to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}",
                         inline: true
                       ),
                       Discord::EmbedField.new(
                         name: "<:calculator:482936199455965185>__Total__",
                         value: "#{total.to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}",
                         inline: true
                       ),
              ]
            )
            BOT.create_message(payload.channel_id, "", embed)
          rescue
            embed = Discord::Embed.new(
              colour: 0xffff00,
              title: "Usage: #{PREFIX[0]}tsupplies <username>",
              description: "Or use __#{PREFIX[0]}tanki <username>__ to get your ratings without typing your username each time!"
            )
            BOT.create_message(payload.channel_id, "", embed)
          end
        end
      end
    end
  end
end
