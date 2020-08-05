require "xml"

module Granz
  command = Command.new("bara", "nsfw", "#{CONFIG["prefix"]}bara", "#{CONFIG["prefix"]}bara", "Returns a bara image")
  Granz::COMMANDS[command.name] = command

  module Commands
    module Bara
      extend self

      def execute(payload : Discord::Message, args : Array(String))
        begin
          BOT.delete_message(payload.channel_id, payload.id)
        rescue
          # Do nothing
        end
        return BOT.create_message(payload.channel_id, "", Discord::Embed.new(colour: 0xffff00, image: Discord::EmbedImage.new(url: "https://i.imgur.com/yVs6TqV.gif"), title: "I'm sorry. I can't do that because this is a SFW channel.")) unless CACHE.resolve_channel(payload.channel_id).nsfw
        i = 0
        response = HTTP::Client.get("https://rule34.xxx/index.php?page=dapi&s=post&q=index&pid=#{rand(50)}&tags=bara%20-furry%20-furry_only%20-anthro%20-3d%20-3d_(artwork)%20-forced%20-yaoi%20-pokemon%20-canid%20-humanoid%20-humanoid_penis%20-mammal%20-animal_humanoid%20-fur%20-vagina%20-pussy")
        return BOT.create_message(payload.channel_id, "", Discord::Embed.new(colour: 0xff0000, title: "API returned #{response.status_code}")) unless response.status_code == 200
        xml = XML.parse(response.body.gsub("\n", "")).first_element_child
        embed_down = Discord::Embed.new(colour: 0xffff00, title: "An error occured", description: "Rule34.xxx might be down!\nFeel free to message us on our support server, to let us know!")
        return BOT.create_message(payload.channel_id, "", embed_down) if xml.nil?
        xml = xml.children
        found = xml[rand(xml.size)]
        # Some links are dead so we are doing 10 tries till we find one
        while i < 10
          begin
            embed = Discord::Embed.new(
              title: "Link",
              url: "https://rule34.xxx/index.php?page=post&s=view&id=#{found["id"]}",
              colour: 0xffff00,
              footer: Discord::EmbedFooter.new(
                text: "##{found["id"]}"
              ),
              author: Discord::EmbedAuthor.new(
                name: "#{payload.author.username}##{payload.author.discriminator}",
                icon_url: "#{payload.author.avatar_url}"
              ),
              image: Discord::EmbedImage.new(
                url: "#{found["file_url"]}"
              )
            )
          rescue
            i = i.succ
          else
            break
          end
        end
        if i == 10
          embed = embed_down
        end
        BOT.create_message(payload.channel_id, "", embed)
      end
    end
  end
end
