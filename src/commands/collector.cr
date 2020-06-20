# The purpose of collector.cr is to collect required info from commands
# Which will be used to auto generate the help page
# But can also be used to auto generate a help emebed etc.
module Granz
  # Let's create our own record
  record Command, name : String, category : String, usage : String, example : String, desc : String, args : Bool? = false
  # Commands hash that has all command info
  COMMANDS = Hash(String, Command).new

  module Commands
    # Macro that lists all available constants under Granz::Commands
    # and also filters through them
    def self.collected_modules
      {{@type.constants}}.reject! { |x| !COMMANDS.keys.includes?(x.to_s.split("::Commands::", limit: 2)[-1].downcase) }
    end
  end
end
