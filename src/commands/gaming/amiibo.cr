module Granz
  module Amiibo
    BOT.on_message_create do |payload|
      next if payload.author.bot
      next unless Prefix_check.new("amiibo", payload.content).check
      next BOT.create_message(payload.channel_id, "", Discord::Embed.new(colour: 0xff0000, title: "Sorry, I only respond on guilds")) unless CACHE.resolve_channel(payload.channel_id).type.guild_text?
      args = Args.new("amiibo", payload.content).args
      next if Min_max_arg.new(1, args.size, 1, BOT, payload.channel_id).check
      next if Min_max_arg.new(2, args.size, 1, BOT, payload.channel_id).check
      response = HTTP::Client.get "https://www.amiiboapi.com/api/amiibo/?name=#{args.join(" ")}"
      next BOT.create_message(payload.channel_id, "", Discord::Embed.new(colour: 0xff0000, title: "Amiibo does not exist")) if response.status_code == 404
      next BOT.create_message(payload.channel_id, "", Discord::Embed.new(colour: 0xff0000, title: "API returned #{response.status_code}")) unless response.status_code == 200
      value = JSON.parse(response.body)
      img = value["amiibo"][0]["image"]
      eu = value["amiibo"][0]["release"]["eu"]
      au = value["amiibo"][0]["release"]["au"]
      jp = value["amiibo"][0]["release"]["jp"]
      na = value["amiibo"][0]["release"]["na"]
      embed = Discord::Embed.new(
        title: "#{value["amiibo"][0]["character"]}",

        colour: 0xffff00,
        thumbnail: Discord::EmbedThumbnail.new(
          url: "#{img}"
        ),
        fields: [Discord::EmbedField.new(
          name: "__Amiibo Series__",
          value: "#{value["amiibo"][0]["amiiboSeries"]}"
        ),
        Discord::EmbedField.new(
          name: "__Game Series__",
          value: "#{value["amiibo"][0]["gameSeries"]}"
        ),
        Discord::EmbedField.new(
          name: "__Release Day__",
          value: "**AU:** #{au}\n**EU:** #{eu}\n**JP:** #{jp}\n**NA:** #{na}"
        ),
        ]
      )
      BOT.create_message(payload.channel_id, "", embed)
    end
  end
end
