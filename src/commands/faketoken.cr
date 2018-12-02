module Granz
  module Faketoken
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if PREFIX.any? { |p| payload.content.starts_with?("#{p}faketoken") }
        begin
          response = HTTP::Client.get "https://api-to.get-a.life/bottoken"
          value = JSON.parse(response.body)
          embed = Discord::Embed.new(

            colour: 0xffff00,
            title: "#{value["token"]}",
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
