module Granz
  command = Command.new("hug", "roleplay", "#{CONFIG["prefix"]}hug [ID/MENTION]", "#{CONFIG["prefix"]}hug @『Geop』#4066", "Hugs provided user", true)
  Granz::COMMANDS[command.name] = command

  module Commands
    module Hug
      extend self

      def execute(payload : Discord::Message, args : Array(String))
        return false if Granz::Args.min(1, args, payload.channel_id) || Granz::Args.max(1, args, payload.channel_id)
        id = args[0].delete("^0-9").to_u64?
        mentioned_user = if id.nil?
                           payload.author
                         else
                           begin
                             CACHE.resolve_user(id)
                           rescue
                             payload.author
                           end
                         end

        if mentioned_user.id == payload.author.id
          embed = Discord::Embed.new(
            colour: 0xffff00,
            description: "<@#{payload.author.id}> Sorry , you can't hug yourself :cry:. But I can hug you if you want :blush:"
          )
          BOT.create_message(payload.channel_id, "", embed)
        else
          response = HTTP::Client.get "https://nekos.life/api/v2/img/hug"
          return BOT.create_message(payload.channel_id, "", Discord::Embed.new(colour: 0xff0000, title: "API returned #{response.status_code}")) unless response.status_code == 200
          value = JSON.parse(response.body)
          embed = Discord::Embed.new(
            image: Discord::EmbedImage.new(
              url: "#{value["url"]}"
            ),
            colour: 0xffff00,
            description: "<@#{mentioned_user.id}> , got hugged by <@#{payload.author.id}> :hugging:"
          )
          BOT.create_message(payload.channel_id, "", embed)
        end
      end
    end
  end
end
