module Granz
  module Info
    BOT.on_message_create do |payload|
      next if payload.author.bot
      begin
        if PREFIX.any? { |p| payload.content.starts_with?("#{p}info") }
          embed = Discord::Embed.new(
            title: "Some Info",
            
            colour: 0xffff00,
            footer: Discord::EmbedFooter.new(
              text: "\xE3\x80\x8EGeop\xE3\x80\x8F#4066",
              icon_url: "https://cdn.discordapp.com/avatars/216156825978929152/c7eaee00bbe99b16304429fb9b9116ea.png"
            ),
            author: Discord::EmbedAuthor.new(
              name: "Granz#8561",
              icon_url: "https://cdn.discordapp.com/avatars/443053627419000833/333d3868fa0837e800e6515558fd8179.png"
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
                       value: "#{PREFIX[0]} | #{PREFIX[1]}"
                     ),
                     Discord::EmbedField.new(
                       name: "__Invite Link__",
                       value: "[HERE](https://discordapp.com/oauth2/authorize?client_id=443053627419000833&scope=bot&permissions=388190&redirect_uri=https://granz.geopjr.xyz/thanks.html&response_type=code)"
                     ),
                     Discord::EmbedField.new(
                       name: "__Support Server__",
                       value: "https://discordbots.org/servers/404294934041067522"
                     ),
                     Discord::EmbedField.new(
                       name: "__MIT Licenced__",
                       value: "https://github.com/GeopJr/Granz-cr"
                     ),
                     Discord::EmbedField.new(
                       name: "__Found an error ?__", value: "<:steam:314349923044687872> [**Steam**](https://steamcommunity.com/id/geopjunior/)\n<:discord:314003252830011395> **『Geop』#4066**\n<:update:264184209617321984> **e-mail**: geopjr@geopjr.xyz"
                     ),
            ]
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
