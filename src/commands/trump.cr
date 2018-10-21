module Granz
  module Trump
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if (payload.content.starts_with? PREFIX[0] + "trump") || (payload.content.starts_with? PREFIX[1] + "trump") || (payload.content.starts_with? PREFIX[2] + "trump") || (payload.content.starts_with? PREFIX[3] + "trump") || (payload.content.starts_with? PREFIX[4] + "trump")
        channel = BOT.get_channel(payload.channel_id)
        begin
          response = HTTP::Client.get "https://api.whatdoestrumpthink.com/api/v1/quotes/random"
          value = JSON.parse(response.body)
          embed = Discord::Embed.new(
            timestamp: Time.now,
            colour: 0xffff00,
            title: "#{value["message"].as_s}"
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
