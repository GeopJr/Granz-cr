# The purpose of collector.cr is to collect required info from commands
# Which will be used to auto generate the help page
# But can also be used to auto generate a help emebed etc.
module Granz
    record Command, name : String, category : String, usage : String, example : String, desc : String

    COMMANDS = [] of Command
end
