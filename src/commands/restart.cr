module Granz
  module Restart
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if (payload.content.starts_with? PREFIX[0] + "restart") || (payload.content.starts_with? PREFIX[1] + "restart") || (payload.content.starts_with? PREFIX[2] + "restart") || (payload.content.starts_with? PREFIX[3] + "restart") || (payload.content.starts_with? PREFIX[4] + "restart")
        if payload.author.id == CONFIG["my_id"].to_s.to_u64
          embed = Discord::Embed.new(
            colour: 0xffff00,
            title: "Restarting"
          )
          BOT.create_message(payload.channel_id, "", embed)
          BOT.stop
          exit
        end
      end
    end
  end
end
