module Granz
  module Shoot
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if (payload.content.starts_with? PREFIX[0] + "shoot") || (payload.content.starts_with? PREFIX[1] + "shoot") || (payload.content.starts_with? PREFIX[2] + "shoot") || (payload.content.starts_with? PREFIX[3] + "shoot") || (payload.content.starts_with? PREFIX[4] + "shoot")
        pres = payload.content.gsub("#{PREFIX[1]} ", "#{PREFIX[1]}").gsub("#{PREFIX[3]} ", "#{PREFIX[3]}")
        argscount = pres.split(" ")
        if argscount.size > 2
          embed = Discord::Embed.new(
            colour: 0xffff00,
            title: "Too many arguments"
          )
          BOT.create_message(payload.channel_id, "", embed)
        elsif argscount.size > 1
          mentioned_user = payload.mentions
          argss = pres.gsub("shoot ", "").gsub("#{PREFIX[1]} ", "").gsub("#{PREFIX[1]}", "").gsub("#{PREFIX[3]}", "").gsub("#{PREFIX[3]} ", "").gsub("#{PREFIX[0]}", "")
          begin
            if mentioned_user[0] == payload.author
              embed = Discord::Embed.new(
                colour: 0xffff00,
                description: "<@#{payload.author.id}> If you are feeling suicidal, talk to someone or call your country's suicide prevention hotline"
              )
              BOT.create_message(payload.channel_id, "", embed)
            elsif mentioned_user[0] != payload.author
              embed = Discord::Embed.new(
                colour: 0xffff00,
                description: "<@#{mentioned_user[0].id}> , got shot by <@#{payload.author.id}> :gun:"
              )
              BOT.create_message(payload.channel_id, "", embed)
            elsif mentioned_user[0] == "443053627419000833"
              embed = Discord::Embed.new(
                colour: 0xffff00,
                title: "NO"
              )
              BOT.create_message(payload.channel_id, "", embed)
            else
              embed = Discord::Embed.new(
                colour: 0xffff00,
                title: "Mention a user"
              )
              BOT.create_message(payload.channel_id, "", embed)
            end
          rescue
            embed = Discord::Embed.new(
              colour: 0xffff00,
              title: "Mention a user"
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
