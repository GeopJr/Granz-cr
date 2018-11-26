module Granz
  module Lmgtfy
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if PREFIX.any? { |p| payload.content.starts_with?("#{p}lmgtfy") }
        pres = payload.content.gsub("#{PREFIX[1]} ", "#{PREFIX[1]}").gsub("#{PREFIX[3]} ", "#{PREFIX[3]}")
        argscount = pres.split(" ")
        if argscount.size > 1
          argss = pres.gsub("lmgtfy", "").split(" ")
          argsss = argss.delete_at(0)
          args = argss.join("+")
          begin
            embed = Discord::Embed.new(
              
              colour: 0xffff00,
              title: "<http://lmgtfy.com/?q=#{args}>",
              description: "Replying to: <@#{payload.author.id}>"
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
        else
          embed = Discord::Embed.new(
            colour: 0xffff00,
            title: "Too few arguments"
          )
          BOT.create_message(payload.channel_id, "", embed)
        end
      end
    end
  end
end
