module Granz
  module Trump
    BOT.on_message_create do |payload|
      next if payload.author.bot
      next unless Prefix_check.new("trump", payload.content).check
      next BOT.create_message(payload.channel_id, "", Discord::Embed.new(colour: 0xff0000, title: "Sorry, I only respond on guilds")) unless CACHE.resolve_channel(payload.channel_id).type.guild_text?
      response = HTTP::Client.get "https://api.whatdoestrumpthink.com/api/v1/quotes/random"
      next BOT.create_message(payload.channel_id, "", Discord::Embed.new(colour: 0xff0000, title: "API returned #{response.status_code}")) unless response.status_code == 200
      value = JSON.parse(response.body)
      embed = Discord::Embed.new(

        colour: 0xffff00,
        title: "#{value["message"].as_s}"
      )
      BOT.create_message(payload.channel_id, "", embed)
    end
  end
end
