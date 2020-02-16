# Min or Max args
class Min_max_arg
  def initialize(@type : Int32, @size : Int32, @req : Int32, @client : Discord::Client, @channel_id : UInt64 | Discord::Snowflake)
  end

  def check
    if @type == 1 && @size < @req
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Too few arguments [#{@size}/#{@req}]"
      )
      @client.create_message(@channel_id, "", embed)
      true
    elsif @type == 2 && @size > @req
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Too many arguments [#{@size}/#{@req}]"
      )
      @client.create_message(@channel_id, "", embed)
      true
    else
      false
    end
  end
end
