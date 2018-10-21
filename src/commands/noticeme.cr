module Granz
  module Noticeme
    BOT.on_message_create do |payload|
      next if payload.author.bot
      begin
        if (payload.content.starts_with? PREFIX[0] + "noticeme") || (payload.content.starts_with? PREFIX[1] + "noticeme") || (payload.content.starts_with? PREFIX[2] + "noticeme") || (payload.content.starts_with? PREFIX[3] + "noticeme") || (payload.content.starts_with? PREFIX[4] + "noticeme")
          embed = Discord::Embed.new(
            description: "<@#{payload.author.id}>, I notice you :relaxed:",
            colour: 0xffff00
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
