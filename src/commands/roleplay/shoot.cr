module Granz
  command = Command.new("shoot", "roleplay", "#{CONFIG["prefix"]}shoot [ID/MENTION]", "#{CONFIG["prefix"]}shoot @GeopJr#4066", "Shoots provided user", true)
  Granz::COMMANDS[command.name] = command

  module Commands
    module Shoot
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
            description: "<@#{payload.author.id}> If you are feeling suicidal, talk to someone or call your country's suicide prevention hotline"
          )
          BOT.create_message(payload.channel_id, "", embed)
        else
          gifs = ["https://i.imgur.com/l4cSv1H.gif", "https://i.imgur.com/eZ49dBC.gif"]
          embed = Discord::Embed.new(
            colour: 0xffff00,
            description: "<@#{mentioned_user.id}> , got shot by <@#{payload.author.id}> :gun:",
            image: Discord::EmbedImage.new(
              url: "#{gifs.sample}"
            )
          )
          BOT.create_message(payload.channel_id, "", embed)
        end
      end
    end
  end
end
