module Granz
  # Owner only
  # No need to be collected
  module Commands
    module Restart
      extend self

      def execute(payload : Discord::Message, args : Array(String))
        return false unless payload.author.id == CONFIG["my_id"].to_s.to_u64
        embed = Discord::Embed.new(
          colour: 0xffff00,
          title: "Restarting"
        )
        BOT.create_message(payload.channel_id, "", embed)
        BOT.stop
        exit
      end
    end
  end
end
