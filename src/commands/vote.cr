module Granz
  module Vote
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if PREFIX.any? { |p| payload.content.starts_with?("#{p}vote") }
        channel = BOT.get_channel(payload.channel_id)
        begin
          embed = Discord::Embed.new(
            colour: 0xffff00,
            title: "You can vote here!",
            url: "https://discordbots.org/bot/443053627419000833/vote"
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
