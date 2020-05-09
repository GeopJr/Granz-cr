module Granz
  module Uptime
    command_info = {"name" => "whois"}
    BOT.on_message_create do |payload|
      next if payload.author.bot
      next unless Prefix_check.new("uptime", payload.content).check
      next BOT.create_message(payload.channel_id, "", Discord::Embed.new(colour: 0xff0000, title: "Sorry, I only respond on guilds")) unless CACHE.resolve_channel(payload.channel_id).type.guild_text?
      time = Time.utc - UPTIMER
      embed = Discord::Embed.new(

        colour: 0xffff00,
        title: "I've been up for:",
        description: "#{time.hours} Hours, #{time.minutes} Minutes, #{time.seconds} Seconds"
      )
      BOT.create_message(payload.channel_id, "", embed)
    end
  end
end
