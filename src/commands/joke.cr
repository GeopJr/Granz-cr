module Granz
  module Joke
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if PREFIX.any? { |p| payload.content.starts_with?("#{p}joke") }
        channel = BOT.get_channel(payload.channel_id)
        begin
          response = HTTP::Client.get "https://08ad1pao69.execute-api.us-east-1.amazonaws.com/dev/random_joke"
          value = JSON.parse(response.body)
          embed = Discord::Embed.new(
            
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
