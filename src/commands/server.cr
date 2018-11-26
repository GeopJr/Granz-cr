module Granz
  module Server
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if PREFIX.any? { |p| payload.content.starts_with?("#{p}server") }
        begin
          if guild_id = BOT.get_channel(payload.channel_id).guild_id
            guild_id # => Snowflake
            server = BOT.get_guild(guild_id)
            embed = Discord::Embed.new(
              
              colour: 0xffff00,
              title: "**Server Info**",
              thumbnail: Discord::EmbedThumbnail.new(
                url: "https://cdn.discordapp.com/icons/#{server.id}/#{server.icon}"
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
            embed = Discord::Embed.new(
              colour: 0xffff00,
              title: "This is not a server"
            )
            BOT.create_message(payload.channel_id, "", embed)
          end
        rescue
          if guild_id = BOT.get_channel(payload.channel_id).guild_id
            guild_id # => Snowflake
            server = BOT.get_guild(guild_id)
            embed = Discord::Embed.new(
              
              colour: 0xffff00,
              title: "**Server Info**",
              thumbnail: Discord::EmbedThumbnail.new(
                url: "https://cdn.discordapp.com/icons/#{server.id}/#{server.icon}"
              ),
              fields: [
                Discord::EmbedField.new(name: "__Name__", value: "**#{server.name}**", inline: true),
                Discord::EmbedField.new(name: "__ID__", value: "**#{server.id}**", inline: true),
                Discord::EmbedField.new(name: "__Region__", value: "**#{server.region}**", inline: true),
                Discord::EmbedField.new(name: "__Owner__", value: "**<@#{server.owner_id}>**", inline: true),
              ]
            )
            BOT.create_message(payload.channel_id, "", embed)
          else
            embed = Discord::Embed.new(
              colour: 0xffff00,
              title: "This is not a server"
            )
            BOT.create_message(payload.channel_id, "", embed)
          end
        end
      end
    end
  end
end
