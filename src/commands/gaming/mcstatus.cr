module Granz
  command = Command.new("mcstatus", "gaming", "#{CONFIG["prefix"]}mcstatus", "#{CONFIG["prefix"]}mcstatus", "Returns the status of mojang servers")
  Granz::COMMANDS[command.name] = command

  module Commands
    module Mcstatus
      extend self

      def execute(payload : Discord::Message, args : Array(String))
        response = HTTP::Client.get "https://status.mojang.com/check"
        return BOT.create_message(payload.channel_id, "", Discord::Embed.new(colour: 0xff0000, title: "API returned #{response.status_code}")) unless response.status_code == 200
        value = JSON.parse(response.body)
        colors = {"green" => "<:check:314349398811475968>", "yellow" => ":warning:", "red" => "<:xmark:314349398824058880>"}

        embed = Discord::Embed.new(

          colour: 0xffff00,
          title: "Minecraft Status",
          fields: [Discord::EmbedField.new(
            name: "__Minecraft.net__",
            value: "#{colors[value[0]["minecraft.net"]]}"
          ),
          Discord::EmbedField.new(
            name: "__Sessions__",
            value: "#{colors[value[1]["session.minecraft.net"]]}"
          ),
          Discord::EmbedField.new(
            name: "__Accounts__",
            value: "#{colors[value[2]["account.mojang.com"]]}"
          ),
          Discord::EmbedField.new(
            name: "__Auth Server__",
            value: "#{colors[value[3]["authserver.mojang.com"]]}"
          ),
          Discord::EmbedField.new(
            name: "__Session Server__",
            value: "#{colors[value[4]["sessionserver.mojang.com"]]}"
          ),
          Discord::EmbedField.new(
            name: "__API__",
            value: "#{colors[value[5]["api.mojang.com"]]}"
          ),
          Discord::EmbedField.new(
            name: "__Textures___",
            value: "#{colors[value[6]["textures.minecraft.net"]]}"
          ),
          Discord::EmbedField.new(
            name: "__Mojang.com__",
            value: "#{colors[value[7]["mojang.com"]]}"
          ),
          ]
        )
        BOT.create_message(payload.channel_id, "", embed)
      end
    end
  end
end
