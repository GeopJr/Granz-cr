module Granz
  module Tstatus
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if PREFIX.any? { |p| payload.content.starts_with?("#{p}tstatus") }
        begin
          response = HTTP::Client.get "https://tankionline.com/s/status.js"
          value = JSON.parse(response.body)
          worlds = [] of Int32
          totalonline = 0
          totalbattle = 0
          value["nodes"].as_h.select do |child|
            worlds << "#{child}".gsub("main.c", "").to_i32
            totalonline += value["nodes"]["#{child}"]["online"].to_s.to_i32
            totalbattle += value["nodes"]["#{child}"]["inbattles"].to_s.to_i32
          end
          embeddesc = [] of Discord::EmbedField
          worlds.sort.each do |world|
            online = value["nodes"]["main.c#{world}"]["online"]
            inbattle = value["nodes"]["main.c#{world}"]["inbattles"]
            embeddesc << Discord::EmbedField.new(name: "c#{world}", value: "Online: #{online.to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}\nIn Battle: #{inbattle.to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true)
          end

          embeddesc << Discord::EmbedField.new(name: "Total", value: "<:online:313956277808005120>Online: #{totalonline.to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}\n<:DoubleDamageIcon:482918526596939776>In Battle: #{totalbattle.to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: false)
          embed = Discord::Embed.new(
            title: "Tanki Online Server Status",
            colour: 0xffff00,
            fields: embeddesc
          )
          BOT.create_message(payload.channel_id, "", embed)
        rescue
          embed = Discord::Embed.new(
            colour: 0xffff00,
            title: "Error",
            url: "https://granz.geopjr.xyz"
          )
          BOT.create_message(payload.channel_id, "", embed)
        end
      end
    end
  end
end
