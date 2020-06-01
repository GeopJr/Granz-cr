# Check if user has the admin perm
module Granz
  module IsAdmin
    extend self

    def check(roles : Array(Discord::Snowflake), guild_id : UInt64 | Discord::Snowflake, author_id : UInt64 | Discord::Snowflake)
      @admin = Bool
      @admin = false
      # If user is owner, return true
      if CACHE.resolve_guild(guild_id).owner_id == author_id
        @admin = true
      else
        # If not, check all their roles for the perm and return Bool if found
        CACHE.resolve_guild(guild_id).roles.each do |server_role|
          if roles.includes?(server_role.id) && server_role.permissions.administrator?
            @admin = true
            break
          end
        end
      end
      return @admin
    end
  end
end
