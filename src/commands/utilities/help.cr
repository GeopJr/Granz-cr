module Granz
  command = Command.new("help", "utilities", "#{CONFIG["prefix"]}help", "#{CONFIG["prefix"]}help", "Returns a help menu", true)
  Granz::COMMANDS[command.name] = command

  module Commands
    module Help
      extend self

      def execute(payload : Discord::Message, args : Array(String))
        return false if Granz::Args.max(1, args, payload.channel_id)
        if args.size > 0 && Granz::COMMANDS.has_key?(args[0].not_nil!.downcase)
          command_info = Granz::COMMANDS[args[0].downcase]
          embed = Discord::Embed.new(
            title: "Here's what I know about `#{command_info.name}`",
            fields: [Discord::EmbedField.new(
              name: "__Description__",
              value: "`#{command_info.desc}`",
              inline: true
            ),
            Discord::EmbedField.new(
              name: "__Usage__",
              value: "`#{command_info.usage}`",
              inline: true
            ),
            Discord::EmbedField.new(
              name: "__Example__",
              value: "`#{command_info.example}`",
              inline: true
            ),
            ],
            colour: 0xffff00,
            footer: Discord::EmbedFooter.new(
              text: "Args: #{command_info.args}"
            ),
            author: Discord::EmbedAuthor.new(
              name: "[#{command_info.name}] in [#{command_info.category}]"
            )
          )
          BOT.create_message(payload.channel_id, "", embed)
          return false
        end
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
end
