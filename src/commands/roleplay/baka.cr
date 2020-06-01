module Granz
  command = Command.new("baka", "roleplay", "#{CONFIG["prefix"]}baka [ID/MENTION]", "#{CONFIG["prefix"]}baka @『Geop』#4066", "The provided user is a baka", true)
  Granz::COMMANDS[command.name] = command

  module Commands
    module Baka
      extend self

      def execute(payload : Discord::Message, args : Array(String))
        return false if Granz::Args.min(1, args, payload.channel_id) || Granz::Args.max(1, args, payload.channel_id)
        id = args[0].delete("^0-9").to_u64?
        mentioned_user = if id.nil?
                           payload.author
                         else
                           begin
                             CACHE.resolve_user(id)
                           rescue
                             payload.author
                           end
                         end
        response = HTTP::Client.get "https://nekos.life/api/v2/img/baka"
        return BOT.create_message(payload.channel_id, "", Discord::Embed.new(colour: 0xff0000, title: "API returned #{response.status_code}")) unless response.status_code == 200
        value = JSON.parse(response.body)
        if mentioned_user.id == payload.author.id
          embed = Discord::Embed.new(
            image: Discord::EmbedImage.new(
              url: "#{value["url"]}"
            ),
            colour: 0xffff00,
            description: "<@#{payload.author.id}>: I am such a **BAKA BAKA BAKA** :angry:"
          )
        else
          embed = Discord::Embed.new(
            image: Discord::EmbedImage.new(
              url: "#{value["url"]}"
            ),
            colour: 0xffff00,
            description: "<@#{payload.author.id}>: **BAKA BAKA BAKA** <@#{mentioned_user.id}> :angry:"
          )
        end
        BOT.create_message(payload.channel_id, "", embed)
      end
    end
  end
end
