module Granz
  command = Command.new("info", "utilities", "#{CONFIG["prefix"]}info", "#{CONFIG["prefix"]}info", "Returns some info about the bot")
  Granz::COMMANDS[command.name] = command

  module Commands
    module Info
      extend self

      def execute(payload : Discord::Message, args : Array(String))
        guild_invite = CONFIG["support_guild"] != "" ? "[HERE](https://discordapp.com/invite/#{CONFIG["support_guild"]})" : "Not available"
        current_user = CACHE.resolve_current_user
        contact = CONFIG["client_id"].to_s.to_u64 == 443053627419000833_u64 ? "<:discord:314003252830011395> **GeopJr#4066**\n<:update:264184209617321984> [**Other Ways**](https://geopjr.dev/contact)" : "#{CONFIG["my_tag"]}"
        embed = Discord::Embed.new(
          title: "Some Info",

          colour: 0xffff00,
          footer: Discord::EmbedFooter.new(
            text: "#{CONFIG["my_tag"]}"
          ),
          author: Discord::EmbedAuthor.new(
            name: "#{current_user.username}##{current_user.discriminator}",
            icon_url: "#{current_user.avatar_url(1024)}"
          ),
          url: "https://granz.geopjr.dev",
          fields: [Discord::EmbedField.new(
            name: "__Name & Avatar__",
            value: "Granz is a character made by Mentaiko"
          ),
          Discord::EmbedField.new(
            name: "__Version__",
            value: "#{VERSION}"
          ),
          Discord::EmbedField.new(
            name: "__Written in__",
            value: "Crystal using discordcr"
          ),
          Discord::EmbedField.new(
            name: "__Prefix__",
            value: "`#{CONFIG["prefix"]}` & <@#{CONFIG["client_id"]}>"
          ),
          Discord::EmbedField.new(
            name: "__Invite Link__",
            value: "[HERE](https://discordapp.com/oauth2/authorize?client_id=#{CONFIG["client_id"]}&scope=bot&permissions=388190)"
          ),
          Discord::EmbedField.new(
            name: "__Support Server__",
            value: "#{guild_invite}"
          ),
          Discord::EmbedField.new(
            name: "__MIT Licenced__",
            value: "https://github.com/GeopJr/Granz-cr"
          ),
          Discord::EmbedField.new(
            name: "__Found an error ?__", value: contact
          ),
          ]
        )
        BOT.create_message(payload.channel_id, "", embed)
      end
    end
  end
end
