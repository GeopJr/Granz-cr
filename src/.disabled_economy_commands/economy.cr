module Granz
  module Economy
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if PREFIX.any? { |p| payload.content.starts_with?("#{p}economy") }
        begin
          embed = Discord::Embed.new(
            
            colour: 0xffff00,
            title: "Welcome to Granz's economy!",
            description: "You first need to register!\nType #{PREFIX[0]}register!\nThen you can use #{PREFIX[0]}profile to check your profile!\n#{PREFIX[0]}slogan & #{PREFIX[0]}background to change your slogan and background!\nIf you have 1000 coins you can exchange them for a level using #{PREFIX[0]}exchange\nYou can check the top users on https://economy.geopjr.xyz/ \nYou get coins by [voting](https://discordbots.org/bot/443053627419000833/vote) for the bot (100 coins), by using bot commands or by playing #{PREFIX[0]}slots <amount>\nYou can also use the online dashboard [here](https://economy.geopjr.xyz/account)"
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
