module Granz
  command = Command.new("contact", "utilities", "#{CONFIG["prefix"]}contact <platform>", "#{CONFIG["prefix"]}contact mastodon", "Returns the provided platform's contact info of the owner", true)
  Granz::COMMANDS[command.name] = command
  CONTACT_LINKS = JSON.parse(File.open("src/data/contact.json")).as_h
  module Commands
    module Contact
      extend self

      def execute(payload : Discord::Message, args : Array(String))
        return false if Granz::Args.max(1, args, payload.channel_id)
        return BOT.create_message(payload.channel_id, "", Discord::Embed.new(colour: 0xff0000, title: "Available platforms:", description: "```\n#{CONTACT_LINKS.keys.join(", ")}\n```", footer: Discord::EmbedFooter.new(text: "Feel free to message me on any of them!"))) unless CONTACT_LINKS.keys.includes?(args.join(" ").upcase)
        
        embed = Discord::Embed.new(
          colour: 0xffff00,
          title: "#{args.join(" ").capitalize}: `#{CONTACT_LINKS[args.join(" ").upcase]}`",
          footer: Discord::EmbedFooter.new(
              text: "Feel free to message me!"
          )
        )
        BOT.create_message(payload.channel_id, "", embed)
      end
    end
  end
end
