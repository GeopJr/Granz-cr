module Granz
  command = Command.new("ip", "utilities", "#{CONFIG["prefix"]}ip <ip address>", "#{CONFIG["prefix"]}ip 8.8.8.8", "Returns some info about the provided ip")
  Granz::COMMANDS << command
  module Ip
    BOT.on_message_create do |payload|
      next if payload.author.bot
      next unless Prefix_check.new(command.name, payload.content).check
      next BOT.create_message(payload.channel_id, "", Discord::Embed.new(colour: 0xff0000, title: "Sorry, I only respond on guilds")) unless CACHE.resolve_channel(payload.channel_id).type.guild_text?
      args = Args.new(command.name, payload.content).args
      next if Min_max_arg.new(1, args.size, 1, BOT, payload.channel_id).check
      next if Min_max_arg.new(2, args.size, 1, BOT, payload.channel_id).check
      response = HTTP::Client.get "https://ipvigilante.com/json/#{args[0]}"
      value = JSON.parse(response.body)
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
