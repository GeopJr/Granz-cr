module Granz
  module Avatar
    BOT.on_message_create do |payload|
      next if payload.author.bot
      next unless Prefix_check.new("avatar", payload.content).check
      args = Args.new("avatar", payload.content).args
      next if Min_max_arg.new(2, args.size, 1, BOT, payload.channel_id).check
      if args.any? && args[0].to_u64?
        begin
          mentioned_user = CACHE.resolve_user(args[0].to_u64)
        rescue
          mentioned_user = payload.author
        end
      elsif payload.mentions.any? && args.any?
        mentioned_user = payload.mentions.last
      else
        mentioned_user = payload.author
      end
      embed = Discord::Embed.new(

        colour: 0xffff00,
        image: Discord::EmbedImage.new(
          url: mentioned_user.avatar_url(1024)
        )
      )
      BOT.create_message(payload.channel_id, "", embed)
    end
  end
end
