module Granz
  module Tanki
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if (payload.content.starts_with? PREFIX[0] + "tanki") || (payload.content.starts_with? PREFIX[1] + "tanki") || (payload.content.starts_with? PREFIX[2] + "tanki") || (payload.content.starts_with? PREFIX[3] + "tanki") || (payload.content.starts_with? PREFIX[4] + "tanki")
        begin
          embed = Discord::Embed.new(
            colour: 0xffff00,
            title: "Things changed!",
            description: "For ratings use: __**#{PREFIX[0]}tratings <username>**__\n\nFor weekly ratings use: __**#{PREFIX[0]}tweekly <username>**__\n\nFor supplies use: __**#{PREFIX[0]}tsupplies <username>**__"
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
