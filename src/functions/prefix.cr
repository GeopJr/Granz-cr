# Prefix checker
class Prefix_check
  def initialize(@name : String, @content : String)
  end

  def check
    @content.downcase.squeeze(" ").starts_with?(/(<@(\!)?#{CONFIG["client_id"]}>( )?|#{CONFIG["prefix"]})#{@name}( |$)/)
  end
end
