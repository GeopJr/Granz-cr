module Granz
  module Stats
    BOT.on_message_create do |payload|
      next if payload.author.bot
      begin
        if (payload.content.starts_with? PREFIX[0] + "stats") || (payload.content.starts_with? PREFIX[1] + "stats") || (payload.content.starts_with? PREFIX[2] + "stats") || (payload.content.starts_with? PREFIX[3] + "stats") || (payload.content.starts_with? PREFIX[4] + "stats")
          response = HTTP::Client.get "https://api.myjson.com/bins/wnhdw"
          valuee = JSON.parse(response.body)
          timee = Time.now - UPTIMER
          embed = Discord::Embed.new(
            title: "Here's some stats about me!!!",
            fields: [Discord::EmbedField.new(
              name: "__<:online:313956277808005120> Servers:__",
              value: "#{valuee["server_count"]}",
              inline: true
            ),
                     Discord::EmbedField.new(
                       name: "__<a:updating:403035325242540032> Uptime:__",
                       value: "#{timee.hours} Hours, #{timee.minutes} Minutes, #{timee.seconds} Seconds",
                       inline: true
                     ),
            ],
            timestamp: Time.now,
            colour: 0xffff00,
            footer: Discord::EmbedFooter.new(
              text: "\xE3\x80\x8EGeop\xE3\x80\x8F#4066",
              icon_url: "https://cdn.discordapp.com/avatars/216156825978929152/c7eaee00bbe99b16304429fb9b9116ea.png"
            ),
            author: Discord::EmbedAuthor.new(
              name: "Granz#8561",
              icon_url: "https://cdn.discordapp.com/avatars/443053627419000833/333d3868fa0837e800e6515558fd8179.png"
            ),
            url: "https://granz.geopjr.xyz"
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
