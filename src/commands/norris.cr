module Granz
  module Norris
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if PREFIX.any? { |p| payload.content.starts_with?("#{p}norris") }
        channel = BOT.get_channel(payload.channel_id)
        begin
          response = HTTP::Client.get "http://api.icndb.com/jokes/random"
          value = JSON.parse(response.body)
          embed = Discord::Embed.new(
            
            colour: 0xffff00,
            title: "#{value["value"]["joke"].as_s}",
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
