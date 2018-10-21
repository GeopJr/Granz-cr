module Granz
  module Blush
    BOT.on_message_create do |payload|
      next if payload.author.bot
      begin
        if (payload.content.starts_with? PREFIX[0] + "blush") || (payload.content.starts_with? PREFIX[1] + "blush") || (payload.content.starts_with? PREFIX[2] + "blush") || (payload.content.starts_with? PREFIX[3] + "blush") || (payload.content.starts_with? PREFIX[4] + "blush")
          embed = Discord::Embed.new(
            timestamp: Time.now,
            colour: 0xffff00,
            image: Discord::EmbedImage.new(
              url: "https://i.imgur.com/fIY6c7d.png"
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
