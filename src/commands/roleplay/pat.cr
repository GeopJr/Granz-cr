module Granz
  command = Command.new("pat", "roleplay", "#{CONFIG["prefix"]}pat [ID/MENTION]", "#{CONFIG["prefix"]}pat @GeopJr#4066", "Pats provided user", true)
  Granz::COMMANDS[command.name] = command

  module Commands
    module Pat
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
        if mentioned_user.id == payload.author.id
          embed = Discord::Embed.new(
            colour: 0xffff00,
            description: "<@#{payload.author.id}> Sorry , you can't pat yourself :cry:. But I can pat you if you want :blush:"
          )
          BOT.create_message(payload.channel_id, "", embed)
        else
          response = HTTP::Client.get "https://nekos.life/api/v2/img/pat"
          return BOT.create_message(payload.channel_id, "", Discord::Embed.new(colour: 0xff0000, title: "API returned #{response.status_code}")) unless response.status_code == 200
          value = JSON.parse(response.body)
          embed = Discord::Embed.new(
            image: Discord::EmbedImage.new(
              url: "#{value["url"]}"
            ),
            colour: 0xffff00,
            description: "<@#{mentioned_user.id}> , you received a pat from <@#{payload.author.id}> :blush:"
          )
          BOT.create_message(payload.channel_id, "", embed)
        end
      end
    end
  end
end
