module Granz
  command = Command.new("help", "utilities", "#{CONFIG["prefix"]}help", "#{CONFIG["prefix"]}help", "Returns a help menu")
  Granz::COMMANDS << command
  module Help
    BOT.on_message_create do |payload|
      next if payload.author.bot
      next unless Prefix_check.new(command.name, payload.content).check || payload.content.starts_with?(/(<@(\!)?#{CONFIG["client_id"]}>( )?)$/)
      next BOT.create_message(payload.channel_id, "", Discord::Embed.new(colour: 0xff0000, title: "Sorry, I only respond on guilds")) unless CACHE.resolve_channel(payload.channel_id).type.guild_text?
      guild_invite = CONFIG["support_guild"] != "" ? "\n\n__[Support Server](https://discordapp.com/invite/#{CONFIG["support_guild"]})__" : ""
      current_user = CACHE.resolve_current_user
      embed = Discord::Embed.new(
        title: "You called for help , here I am !!!",
        description: "\n__[Command List !](https://granz.geopjr.xyz/commands)__\n\n__Type #{CONFIG["prefix"]}info for some info__\n\n__Found a bug? Add me #{CONFIG["my_tag"]}__#{guild_invite}",

        colour: 0xffff00,
        footer: Discord::EmbedFooter.new(
          text: "#{CONFIG["my_tag"]}"
        ),
        author: Discord::EmbedAuthor.new(
          name: "#{current_user.username}##{current_user.discriminator}",
          icon_url: "#{current_user.avatar_url(1024)}"
        )
      )
      BOT.create_message(payload.channel_id, "", embed)
    end
  end
end
