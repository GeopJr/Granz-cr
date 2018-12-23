module Granz
  module Help
    BOT.on_message_create do |payload|
      next if payload.author.bot
      begin
        if (payload.content.starts_with? PREFIX[0] + "help") || (payload.content.starts_with? PREFIX[1] + "help") || (payload.content.starts_with? PREFIX[2] + "help") || (payload.content == PREFIX[1]) || (payload.content == PREFIX[2]) || (payload.content.starts_with? PREFIX[3] + "help") || (payload.content.starts_with? PREFIX[4] + "help") || (payload.content == PREFIX[3]) || (payload.content == PREFIX[4])
          embed = Discord::Embed.new(
            title: "You called for help , here I am !!!",
            description: "\n__[Command List !](https://granz.geopjr.xyz/commands)__\n\n__Type #{PREFIX[0]}info for some info__\n\n__Found a bug? Add me \xE3\x80\x8EGeop\xE3\x80\x8F#4066__\n\n__[Support Server](https://discordapp.com/invite/SWEsj6q)__",
            
            colour: 0xffff00,
            footer: Discord::EmbedFooter.new(
              text: "\xE3\x80\x8EGeop\xE3\x80\x8F#4066",
              icon_url: "https://cdn.discordapp.com/avatars/216156825978929152/c7eaee00bbe99b16304429fb9b9116ea.png"
            ),
            author: Discord::EmbedAuthor.new(
              name: "Granz#8561",
              icon_url: "https://cdn.discordapp.com/avatars/443053627419000833/333d3868fa0837e800e6515558fd8179.png"
            )
          )
          BOT.create_message(payload.channel_id, "", embed)
        end
      rescue
        embed = Discord::Embed.new(
          title: "Error",
          url: "https://granz.geopjr.xyz"
        )
        BOT.create_message(payload.channel_id, "", embed)
      end
    end
  end
end
