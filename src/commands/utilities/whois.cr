module Granz
  command = Command.new("whois", "utilities", "#{CONFIG["prefix"]}whois [ID/MENTION]", "#{CONFIG["prefix"]}whois 216156825978929152", "Returns user info if provided, else server info", true)
  Granz::COMMANDS[command.name] = command

  module Commands
    module Whois
      extend self

      def execute(payload : Discord::Message, args : Array(String))
        return false if Granz::Args.max(1, args, payload.channel_id)
        if args.size == 0
          server = CACHE.resolve_guild(payload.guild_id.not_nil!)
          embed = Discord::Embed.new(

            colour: 0xffff00,
            title: "**Server Info**",
            thumbnail: Discord::EmbedThumbnail.new(
              url: "#{server.icon_url}"
            ),
            fields: [
              Discord::EmbedField.new(name: "__Name__", value: "**#{server.name}**", inline: true),
              Discord::EmbedField.new(name: "__ID__", value: "**#{server.id}**", inline: true),
              Discord::EmbedField.new(name: "__Region__", value: "**#{server.region}**", inline: true),
              Discord::EmbedField.new(name: "__Owner__", value: "**<@#{server.owner_id}>**", inline: true),
              Discord::EmbedField.new(name: "__Roles__", value: "**#{server.roles.size}**", inline: true),
            ]
          )
          BOT.create_message(payload.channel_id, "", embed)
        else
          id = args[0].delete("^0-9").to_u64
          begin
            mentioned_user = CACHE.resolve_user(id)
          rescue
            mentioned_user = payload.author
          end
          member = CACHE.resolve_member(payload.guild_id.not_nil!, mentioned_user.id)
          roles = Array(String).new
          member.roles.each { |p| roles << "<@&#{p}>" }
          embed = Discord::Embed.new(

            colour: 0xffff00,
            title: "**Member Info**",
            thumbnail: Discord::EmbedThumbnail.new(
              url: "#{member.user.avatar_url}"
            ),
            fields: [
              Discord::EmbedField.new(name: "__Name__", value: "**#{member.user.username}**", inline: true),
              Discord::EmbedField.new(name: "__ID__", value: "**#{member.user.id}**", inline: true),
              Discord::EmbedField.new(name: "__Joined At__", value: "**#{member.joined_at}**", inline: true),
              Discord::EmbedField.new(name: "__Created At__", value: "**#{member.user.id.creation_time}**", inline: true),
              Discord::EmbedField.new(name: "__Roles__", value: "**#{member.roles.size} role#{member.roles.size > 1 ? "s" : ""}**\n#{roles.join(", ")}", inline: true),
            ]
          )
          BOT.create_message(payload.channel_id, "", embed)
        end
      end
    end
  end
end
