# The purpose of collector.cr is to collect required info from commands
# Which will be used to auto generate the help page
# But can also be used to auto generate a help emebed etc.
module Granz
  record Command, name : String, category : String, usage : String, example : String, desc : String, args : Bool? = false

  COMMANDS = Hash(String, Command).new

  module Commands
    def self.collected_modules
      {{@type.constants}}
    end
  end
end
