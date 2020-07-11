module Granz
  command = Command.new("donate", "utilities", "#{CONFIG["prefix"]}donate <COIN>", "#{CONFIG["prefix"]}donate XLM", "Returns the provided coin's address you can donate crypto to", true)
  Granz::COMMANDS[command.name] = command
  DONATION_LINKS = JSON.parse(File.open("src/data/donate.json")).as_h
  module Commands
    module Donate
      extend self

      def execute(payload : Discord::Message, args : Array(String))
        return false if Granz::Args.max(1, args, payload.channel_id)
        return BOT.create_message(payload.channel_id, "", Discord::Embed.new(colour: 0xff0000, title: "Available coins:", description: "`#{DONATION_LINKS.keys.join(",")}`", footer: Discord::EmbedFooter.new(text: "Thanks for donating! Don't forget to leave your username so I can thank you personally!"))) unless DONATION_LINKS.keys.includes?(args.join(" ").upcase)
        
        embed = Discord::Embed.new(
          colour: 0xffff00,
          title: "#{args.join(" ").upcase}: `#{DONATION_LINKS[args.join(" ").upcase]}`",
          footer: Discord::EmbedFooter.new(
              text: "Thanks for donating! Don't forget to leave your username so I can thank you personally!"
          )
        )
        BOT.create_message(payload.channel_id, "", embed)
      end
    end
  end
end
