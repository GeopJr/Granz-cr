module Granz
  module Whois
    BOT.on_message_create do |payload|
      next if payload.author.bot
      next unless Prefix_check.new("whois", payload.content).check
      next BOT.create_message(payload.channel_id, "", Discord::Embed.new(colour: 0xff0000, title: "Sorry, I only respond on guilds")) unless CACHE.resolve_channel(payload.channel_id).type.guild_text?
      args = Args.new("whois", payload.content).args
      next if Min_max_arg.new(2, args.size, 1, BOT, payload.channel_id).check
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
