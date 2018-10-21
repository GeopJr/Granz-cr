module Granz
  module Joke
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if (payload.content.starts_with? PREFIX[0] + "joke") || (payload.content.starts_with? PREFIX[1] + "joke") || (payload.content.starts_with? PREFIX[2] + "joke") || (payload.content.starts_with? PREFIX[3] + "joke") || (payload.content.starts_with? PREFIX[4] + "joke")
        channel = BOT.get_channel(payload.channel_id)
        begin
          response = HTTP::Client.get "https://08ad1pao69.execute-api.us-east-1.amazonaws.com/dev/random_joke"
          value = JSON.parse(response.body)
          embed = Discord::Embed.new(
            timestamp: Time.now,
            colour: 0xffff00,
            title: "#{value["setup"].as_s}",
            description: "#{value["punchline"].as_s}"
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
