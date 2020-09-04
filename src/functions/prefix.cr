# Prefix checker
class Prefix
  @match : Regex::MatchData?

  def initialize(@content : String)
    return @match = @content.sub("—", "--").squeeze(" ").match(/^(<@(\!)?#{CONFIG["client_id"]}>( )?|#{CONFIG["prefix"]})([^\s]+)(( )?[\S\s]+|$)/)
  end

  def name
    return @match.try &.[4]
  end

  def args
    return @match.try &.[5].split(/ |\n/).reject! { |c| c.empty? } || [] of String
  end
end
