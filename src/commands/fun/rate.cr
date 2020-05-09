module Granz
  module Rate
    BOT.on_message_create do |payload|
      next if payload.author.bot
      next unless Prefix_check.new("rate", payload.content).check
      next BOT.create_message(payload.channel_id, "", Discord::Embed.new(colour: 0xff0000, title: "Sorry, I only respond on guilds")) unless CACHE.resolve_channel(payload.channel_id).type.guild_text?
      args = Args.new("rate", payload.content).args
      next if Min_max_arg.new(1, args.size, 1, BOT, payload.channel_id).check

      random_number = rand(1..100)

      embed = Discord::Embed.new(
        description: "I give **#{args.join(" ")}** a **#{random_number / 10}/10**",
        colour: 0xffff00,
      )
      BOT.create_message(payload.channel_id, "", embed)
    end
  end
end
