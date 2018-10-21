module Granz
  module Tanki
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if (payload.content.starts_with? PREFIX[0] + "tanki") || (payload.content.starts_with? PREFIX[1] + "tanki") || (payload.content.starts_with? PREFIX[2] + "tanki") || (payload.content.starts_with? PREFIX[3] + "tanki") || (payload.content.starts_with? PREFIX[4] + "tanki")
        pres = payload.content.gsub("#{PREFIX[1]} ", "#{PREFIX[1]}").gsub("#{PREFIX[3]} ", "#{PREFIX[3]}")
        argscount = pres.split(" ")
        if argscount.size > 2
          embed = Discord::Embed.new(
            colour: 0xffff00,
            title: "Too many arguments"
          )
          BOT.create_message(payload.channel_id, "", embed)
        elsif argscount.size > 1
          argss = pres.gsub("tanki ", "").gsub("#{PREFIX[1]} ", "").gsub("#{PREFIX[1]}", "").gsub("#{PREFIX[3]}", "").gsub("#{PREFIX[3]} ", "").gsub("#{PREFIX[0]}", "")
          begin
            response = HTTP::Client.get "https://tankapi.000webhostapp.com/?name=#{argss}"
            value = JSON.parse(response.body)

            if value["premium"] == "No"
              prem = "<:xmark:314349398824058880>"
            else
              value["premium"] == "Yes"
              prem = "<:check:314349398811475968>"
            end

            embed = Discord::Embed.new(
              timestamp: Time.now,
              colour: 0xffff00,
              title: "Stats of #{argss}",
              footer: Discord::EmbedFooter.new(
                text: "\xE3\x80\x8EGeop\xE3\x80\x8F#4066",
                icon_url: "https://cdn.discordapp.com/avatars/216156825978929152/c7eaee00bbe99b16304429fb9b9116ea.png"
              ),
              url: "https://ratings.geopjr.xyz/ratings?name=#{argss}",
              thumbnail: Discord::EmbedThumbnail.new(
                url: "#{value["rank_img"]}"
              ),
              author: Discord::EmbedAuthor.new(
                name: "Granz#8561",
                icon_url: "https://cdn.discordapp.com/avatars/443053627419000833/333d3868fa0837e800e6515558fd8179.png"
              ),
              fields: [Discord::EmbedField.new(
                name: "👨__Name__",
                value: "#{value["name"]}",
                inline: true
              ),
                       Discord::EmbedField.new(
                         name: "🎖️__Rank__",
                         value: "#{value["rank"]}",
                         inline: true
                       ),
                       Discord::EmbedField.new(
                         name: "⏰__Playtime__",
                         value: "#{value["timePlayed"]}",
                         inline: true
                       ),
                       Discord::EmbedField.new(
                         name: "🏅__Premium__",
                         value: "#{prem}",
                         inline: true
                       ),
                       Discord::EmbedField.new(
                         name: "📟__Resistance Modules__",
                         value: "#{value["resistanceModules"]}",
                         inline: true
                       ),
                       Discord::EmbedField.new(
                         name: "🤖__Turrets Played__",
                         value: "#{value["turretsPlayed"]}",
                         inline: true
                       ),
                       Discord::EmbedField.new(
                         name: "⬆️__EXP__",
                         value: "#{value["exp"]["exp"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}/#{value["exp"]["expNext"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}",
                         inline: true
                       ),
                       Discord::EmbedField.new(
                         name: "⬆️__EXP left to rank up__",
                         value: "#{value["exp"]["expLeft"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse} exp",
                         inline: true
                       ),
                       Discord::EmbedField.new(
                         name: "<:GoldBoxIcon:482918640820289546>__Gold Boxes Caught__",
                         value: "#{value["golds"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}",
                         inline: true
                       ),
                       Discord::EmbedField.new(
                         name: "💎__Obtained Crystals__",
                         value: "#{value["crystals"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}",
                         inline: true
                       ),
                       Discord::EmbedField.new(
                         name: "<:DoubleDamageIcon:482918526596939776>__Kills__",
                         value: "#{value["kills"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}",
                         inline: true
                       ),
                       Discord::EmbedField.new(
                         name: "💀__Deaths__",
                         value: "#{value["deaths"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}",
                         inline: true
                       ),
                       Discord::EmbedField.new(
                         name: "⚰️__K/D Ratio__",
                         value: "#{value["kd_ratio"]}",
                         inline: true
                       ),
                       Discord::EmbedField.new(
                         name: "<:DoubleDamageIcon:482918526596939776>__Efficiency Rating Place | Value__",
                         value: "#{value["rating"]["efficiency"]["position"]["now"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse} | #{value["rating"]["efficiency"]["value"]["now"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}",
                         inline: true
                       ),
                       Discord::EmbedField.new(
                         name: "⬆️__Experience Rating Place | Value__",
                         value: "#{value["rating"]["experience"]["position"]["now"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse} | #{value["rating"]["experience"]["value"]["now"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse} #{value["rating"]["experience"]["value"]["arrow"]}",
                         inline: true
                       ),
                       Discord::EmbedField.new(
                         name: "<:GoldBoxIcon:482918640820289546>__Gold Box Rating Place | Value__",
                         value: "#{value["rating"]["golds"]["position"]["now"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse} | #{value["rating"]["golds"]["value"]["now"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse} #{value["rating"]["golds"]["value"]["arrow"]}",
                         inline: true
                       ),
                       Discord::EmbedField.new(
                         name: "💎__Crystals Rating Place | Value__",
                         value: "#{value["rating"]["crystals"]["position"]["now"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse} | #{value["rating"]["crystals"]["value"]["now"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse} #{value["rating"]["crystals"]["value"]["arrow"]}",
                         inline: true
                       ),
                       Discord::EmbedField.new(
                         name: "<:MineIcon:482918544133324812>__Mines Used__",
                         value: "#{value["supplies"]["Mine"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}",
                         inline: true
                       ),
                       Discord::EmbedField.new(
                         name: "<:RepairKitIcon:482918499719708683>__Repair Kits Used__",
                         value: "#{value["supplies"]["Repair Kit"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}",
                         inline: true
                       ),
                       Discord::EmbedField.new(
                         name: "<:GoldBoxIcon:482918640820289546>__Gold Boxes Used__",
                         value: "#{value["supplies"]["Gold box"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}",
                         inline: true
                       ),
                       Discord::EmbedField.new(
                         name: "<:DoubleArmourIcon:482918515834224671>__Double Armors Used__",
                         value: "#{value["supplies"]["Double Armor"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}",
                         inline: true
                       ),
                       Discord::EmbedField.new(
                         name: "<:SpeedBoostIcon:482918535786659842>__Speed Boosts Used__",
                         value: "#{value["supplies"]["Speed Boost"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}",
                         inline: true
                       ),
                       Discord::EmbedField.new(
                         name: "<:DoubleDamageIcon:482918526596939776>__Double Damage Used__",
                         value: "#{value["supplies"]["Double Damage"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}",
                         inline: true
                       ),
                       Discord::EmbedField.new(
                         name: "<:DroneIcon:482918650102415380>__Batteries Used__",
                         value: "#{value["supplies"]["Battery"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}",
                         inline: true
                       ),
                       Discord::EmbedField.new(
                         name: "<:calculator:482936199455965185>__Total__",
                         value: "#{value["supplies"]["totalUsages"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}",
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
