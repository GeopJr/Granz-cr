# Min or Max args
module Granz
  module Args
    extend self

    def min(req : Int32, args : Array(String)?, channel_id : UInt64 | Discord::Snowflake)
      size = args.nil? ? req : args.size
      if size < req
        embed = Discord::Embed.new(
          colour: 0xffff00,
          title: "Too few arguments [#{size}/#{req}]"
        )
        BOT.create_message(channel_id, "", embed)
        return true
      end
      return false
    end

    def max(req : Int32, args : Array(String)?, channel_id : UInt64 | Discord::Snowflake)
      size = args.nil? ? req : args.size
      if size > req
        embed = Discord::Embed.new(
          colour: 0xffff00,
          title: "Too many arguments [#{size}/#{req}]"
        )
        BOT.create_message(channel_id, "", embed)
        return true
      else
        return false
      end
    end
  end
end
