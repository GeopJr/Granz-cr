module Granz
  command = Command.new("info", "utilities", "#{CONFIG["prefix"]}info", "#{CONFIG["prefix"]}info", "Returns some info about the bot")
  Granz::COMMANDS[command.name] = command

  module Commands
    module Info
      extend self

      def execute(payload : Discord::Message, args : Array(String))
        guild_invite = CONFIG["support_guild"] != "" ? "[HERE](https://discordapp.com/invite/#{CONFIG["support_guild"]})" : "Not available"
        current_user = CACHE.resolve_current_user
        contact = CONFIG["client_id"].to_s.to_u64 == 443053627419000833_u64 ? "<:steam:314349923044687872> [**Steam**](https://steamcommunity.com/id/geopjunior/)\n<:discord:314003252830011395> **『Geop』#4066**\n<:update:264184209617321984> **e-mail**: geopjr@geopjr.xyz" : "#{CONFIG["my_tag"]}"
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
          url: "https://granz.geopjr.xyz",
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
            value: "[HERE](https://discordapp.com/oauth2/authorize?client_id=#{CONFIG["client_id"]}&scope=bot&permissions=388190&redirect_uri=https://granz.geopjr.xyz/thanks.html&response_type=code)"
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
