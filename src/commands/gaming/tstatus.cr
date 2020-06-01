module Granz
  command = Command.new("tstatus", "gaming", "#{CONFIG["prefix"]}tstatus", "#{CONFIG["prefix"]}tstatus", "Returns the status of tankionline servers")
  Granz::COMMANDS[command.name] = command

  module Commands
    module Tstatus
      extend self

      def execute(payload : Discord::Message, args : Array(String))
        response = HTTP::Client.get "https://tankionline.com/s/status.js"
        return BOT.create_message(payload.channel_id, "", Discord::Embed.new(colour: 0xff0000, title: "API returned #{response.status_code}")) unless response.status_code == 200
        value = JSON.parse(response.body)
        worlds = [] of Int32
        total_online = 0
        total_battle = 0
        value["nodes"].as_h.select do |child|
          worlds << "#{child}".gsub("main.c", "").to_i32
          total_online += value["nodes"]["#{child}"]["online"].to_s.to_i32
          total_battle += value["nodes"]["#{child}"]["inbattles"].to_s.to_i32
        end
        embed_desc = [] of Discord::EmbedField
        worlds.sort.each do |world|
          online = value["nodes"]["main.c#{world}"]["online"]
          in_battle = value["nodes"]["main.c#{world}"]["inbattles"]
          embed_desc << Discord::EmbedField.new(name: "c#{world}", value: "Online: #{online.to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}\nIn Battle: #{in_battle.to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true)
        end

        embed_desc << Discord::EmbedField.new(name: "Total", value: "<:online:313956277808005120>Online: #{total_online.to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}\n<:DoubleDamageIcon:482918526596939776>In Battle: #{total_battle.to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: false)
        embed = Discord::Embed.new(
          title: "Tanki Online Server Status",
          colour: 0xffff00,
          fields: embed_desc
        )
        BOT.create_message(payload.channel_id, "", embed)
      end
    end
  end
end
