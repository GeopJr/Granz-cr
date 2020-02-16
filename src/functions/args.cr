# Content to args
class Args
  def initialize(@name : String, @content : String)
  end

  def args
    @content.squeeze(" ").gsub(/^(<@(\!)?#{CONFIG["client_id"]}>( )?|#{CONFIG["prefix"]})#{@name.downcase}( )?/, "").split(" ").reject { |c| c.empty? }
  end
end
