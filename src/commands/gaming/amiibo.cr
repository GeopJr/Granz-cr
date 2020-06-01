module Granz
  command = Command.new("amiibo", "gaming", "#{CONFIG["prefix"]}amiibo <character>", "#{CONFIG["prefix"]}amiibo mewtwo", "Returns info about the given character's amiibo", true)
  Granz::COMMANDS[command.name] = command

  module Commands
    module Amiibo
      extend self

      def execute(payload : Discord::Message, args : Array(String))
        return false if Granz::Args.min(1, args, payload.channel_id)
        response = HTTP::Client.get "https://www.amiiboapi.com/api/amiibo/?name=#{args.join("%20")}"
        return BOT.create_message(payload.channel_id, "", Discord::Embed.new(colour: 0xff0000, title: "Amiibo does not exist")) if response.status_code == 404
        return BOT.create_message(payload.channel_id, "", Discord::Embed.new(colour: 0xff0000, title: "API returned #{response.status_code}")) unless response.status_code == 200
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
end
