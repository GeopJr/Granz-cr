module Granz
  command = Command.new("neko", "nsfw", "#{CONFIG["prefix"]}neko", "#{CONFIG["prefix"]}neko", "Returns a neko image")
  Granz::COMMANDS[command.name] = command

  module Commands
    module Neko
      extend self

      def execute(payload : Discord::Message, args : Array(String))
        return BOT.create_message(payload.channel_id, "", Discord::Embed.new(colour: 0xffff00, image: Discord::EmbedImage.new(url: "https://i.imgur.com/yVs6TqV.gif"), title: "I'm sorry. I can't do that because this is a SFW channel.")) unless CACHE.resolve_channel(payload.channel_id).nsfw
        response = HTTP::Client.get "https://nekos.life/api/lewd/neko"
        return BOT.create_message(payload.channel_id, "", Discord::Embed.new(colour: 0xff0000, title: "API returned #{response.status_code}")) unless response.status_code == 200
        value = JSON.parse(response.body)
        embed = Discord::Embed.new(
          colour: 0xffff00,
          image: Discord::EmbedImage.new(
            url: "#{value["neko"].as_s}"
          )
        )
        BOT.create_message(payload.channel_id, "", embed)
      end
    end
  end
end
