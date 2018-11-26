module Granz
  module Mcstatus
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if PREFIX.any? { |p| payload.content.starts_with?("#{p}mcstatus") }
        begin
          response = HTTP::Client.get "https://status.mojang.com/check"
          value = JSON.parse(response.body)
          if value[0]["minecraft.net"] == "green"
            minecraft = "<:check:314349398811475968>"
          elsif value[0]["minecraft.net"] == "yellow"
            minecraft = ":warning:"
          else
            minecraft = "<:xmark:314349398824058880>"
          end
          if value[1]["session.minecraft.net"] == "green"
            session = "<:check:314349398811475968>"
          elsif value[1]["session.minecraft.net"] == "yellow"
            session = ":warning:"
          else
            session = "<:xmark:314349398824058880>"
          end
          if value[2]["account.mojang.com"] == "green"
            acc = "<:check:314349398811475968>"
          elsif value[2]["account.mojang.com"] == "yellow"
            acc = ":warning:"
          else
            acc = "<:xmark:314349398824058880>"
          end
          if value[3]["authserver.mojang.com"] == "green"
            aserv = "<:check:314349398811475968>"
          elsif value[3]["authserver.mojang.com"] == "yellow"
            aserv = ":warning:"
          else
            aserv = "<:xmark:314349398824058880>"
          end
          if value[4]["sessionserver.mojang.com"] == "green"
            sserv = "<:check:314349398811475968>"
          elsif value[4]["sessionserver.mojang.com"] == "yellow"
            sserv = ":warning:"
          else
            sserv = "<:xmark:314349398824058880>"
          end
          if value[5]["api.mojang.com"] == "green"
            api = "<:check:314349398811475968>"
          elsif value[5]["api.mojang.com"] == "yellow"
            api = ":warning:"
          else
            api = "<:xmark:314349398824058880>"
          end
          if value[6]["textures.minecraft.net"] == "green"
            textures = "<:check:314349398811475968>"
          elsif value[6]["textures.minecraft.net"] == "yellow"
            textures = ":warning:"
          else
            textures = "<:xmark:314349398824058880>"
          end
          if value[7]["mojang.com"] == "green"
            moj = "<:check:314349398811475968>"
          elsif value[7]["mojang.com"] == "yellow"
            moj = ":warning:"
          else
            moj = "<:xmark:314349398824058880>"
          end

          embed = Discord::Embed.new(
            
            colour: 0xffff00,
            title: "Minecraft Status",
            fields: [Discord::EmbedField.new(
              name: "__Minecraft.net__",
              value: "#{minecraft}"
            ),
                     Discord::EmbedField.new(
                       name: "__Sessions__",
                       value: "#{session}"
                     ),
                     Discord::EmbedField.new(
                       name: "__Accounts__",
                       value: "#{acc}"
                     ),
                     Discord::EmbedField.new(
                       name: "__Auth Server__",
                       value: "#{aserv}"
                     ),
                     Discord::EmbedField.new(
                       name: "__Session Server__",
                       value: "#{sserv}"
                     ),
                     Discord::EmbedField.new(
                       name: "__API__",
                       value: "#{api}"
                     ),
                     Discord::EmbedField.new(
                       name: "__Textures___",
                       value: "#{textures}"
                     ),
                     Discord::EmbedField.new(
                       name: "__Mojang.com__",
                       value: "#{moj}"
                     ),
            ]
          )
          BOT.create_message(payload.channel_id, "", embed)
        rescue
          embed = Discord::Embed.new(
            colour: 0xffff00,
            title: "Error",
            url: "https://granz.geopjr.xyz"
          )
          BOT.create_message(payload.channel_id, "", embed)
        end
      end
    end
  end
end
