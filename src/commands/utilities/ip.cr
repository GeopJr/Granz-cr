module Granz
  command = Command.new("ip", "utilities", "#{CONFIG["prefix"]}ip <ip address>", "#{CONFIG["prefix"]}ip 8.8.8.8", "Returns some info about the provided ip", true)
  Granz::COMMANDS[command.name] = command

  module Commands
    module Ip
      extend self

      def execute(payload : Discord::Message, args : Array(String))
        return false if Granz::Args.min(1, args, payload.channel_id)
        return false if Granz::Args.max(1, args, payload.channel_id)
        response = HTTP::Client.get "https://ipvigilante.com/json/#{args[0]}"
        return BOT.create_message(payload.channel_id, "", Discord::Embed.new(colour: 0xff0000, title: "API returned #{response.status_code}")) unless response.status_code == 200
        value = JSON.parse(response.body)
        return BOT.create_message(payload.channel_id, "", Discord::Embed.new(colour: 0xff0000, title: "IP not found")) unless value.as_h.has_key?("data") && value["data"].size > 0 && value["data"].as_h.has_key?("ipv4")
        embed = Discord::Embed.new(
          colour: 0xffff00,
          title: "IP INFO :",
          fields: [Discord::EmbedField.new(
            name: "__ipv4__",
            value: "#{value["data"]["ipv4"]}"
          ),
          Discord::EmbedField.new(
            name: "__Continent__",
            value: "#{value["data"]["continent_name"]}"
          ),
          Discord::EmbedField.new(
            name: "__Country__",
            value: "#{value["data"]["country_name"]}"
          ),
          Discord::EmbedField.new(
            name: "__Location__",
            value: "Lat: #{value["data"]["latitude"]}\nLong: #{value["data"]["longitude"]}\nOther:\n#{value["data"]["subdivision_1_name"]}\n#{value["data"]["city_name"]}\n#{value["data"]["subdivision_2_name"]}"
          ),
          ]
        )
        BOT.create_message(payload.channel_id, "", embed)
      end
    end
  end
end
