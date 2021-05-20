module Granz
  command = Command.new("avatar", "utilities", "#{CONFIG["prefix"]}avatar [ID/MENTION] [ID/MENTION]...", "#{CONFIG["prefix"]}avatar 216156825978929152 @GeopJr#4066", "Shows all user avatars if provided, else author's", true)
  Granz::COMMANDS[command.name] = command

  module Commands
    module Avatar
      extend self

      def execute(payload : Discord::Message, args : Array(String))
        i = 0
        avatar_embeds = [] of Discord::Embed
        while i < 5 && (i < args.size || i == 0)
          id = args[i]?.try &.delete("^0-9").to_u64?
          mentioned_user = if id.nil?
                             payload.author
                           else
                             begin
                               CACHE.resolve_user(id)
                             rescue
                               payload.author
                             end
                           end
          avatar_embeds << Discord::Embed.new(
            colour: 0xffff00,
            image: Discord::EmbedImage.new(
              url: mentioned_user.avatar_url(1024)
            )
          )
          i = i.succ
        end
        avatar_embeds.uniq!.each do |embed|
          BOT.create_message(payload.channel_id, "", embed)
        end
      end
    end
  end
end
