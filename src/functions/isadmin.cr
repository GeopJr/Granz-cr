# Check if user has the admin perm
class IsAdmin
  def initialize(client : Discord::Client, roles : Array(Discord::Snowflake), guild_id : UInt64 | Discord::Snowflake, author_id : UInt64 | Discord::Snowflake)
    @anytrue = [] of Bool
    # If user is owner, return true
    if client.get_guild(guild_id).owner_id == author_id
      @anytrue << true
    else
      # If not, check all their roles for the perm and return Bool if found
      client.get_guild_roles(guild_id).each do |serverRole|
        roles.each do |role|
          if role == serverRole.id
            @anytrue << serverRole.permissions.administrator?
          end
        end
      end
    end
  end

  # Return it
  def anyTrue
    @anytrue.includes?(true)
  end
end
