# Prefix checker
class Prefix_check
  def initialize(@name : String, @content : String)
  end

  def check
    @content.squeeze(" ").starts_with?(/(<@(\!)?#{CONFIG["client_id"]}>( )?|#{CONFIG["prefix"]})#{@name.downcase}( |$)/)
  end
end
