module Granz
  module Neko
    BOT.on_message_create do |payload|
      next if payload.author.bot
      next unless Prefix_check.new("neko", payload.content).check
      next BOT.create_message(payload.channel_id, "", Discord::Embed.new(colour: 0xff0000, title: "Sorry, I only respond on guilds")) unless CACHE.resolve_channel(payload.channel_id).type.guild_text?
      next BOT.create_message(payload.channel_id, "", Discord::Embed.new(colour: 0xffff00, image: Discord::EmbedImage.new(url: "https://i.imgur.com/yVs6TqV.gif"), title: "I'm sorry. I can't do that because this is a SFW channel.")) unless CACHE.resolve_channel(payload.channel_id).nsfw
      response = HTTP::Client.get "https://nekos.life/api/lewd/neko"
      next BOT.create_message(payload.channel_id, "", Discord::Embed.new(colour: 0xff0000, title: "API returned #{response.status_code}")) unless response.status_code == 200
      value = JSON.parse(response.body)
      embed = Discord::Embed.new(
        colour: 0xffff00,
        image: Discord::EmbedImage.new(
          url: "#{value["neko"].as_s}"
        )
      )
      BOT.create_message(payload.channel_id, "", embed)
    end
  end
end
