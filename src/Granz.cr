require "discordcr"
require "json"
require "http/client"
require "magickwand-crystal"
require "./commands/*"
require "./functions/*"

# Config
CONFIG = JSON.parse(File.read("./config.json"))
# Check Config
["client_id", "my_id", "version", "prefix", "token"].each do |p|
  if CONFIG.as_h.fetch(p, nil).nil?
    raise "#{p} is not set in config.json"
	end
end
# Consts
VERSION = CONFIG["version"]
UPTIMER = Time.utc_now

module Granz
  # Authorize
  BOT = Discord::Client.new(token: "Bot #{CONFIG["token"]}", client_id: CONFIG["client_id"].to_s.to_u64)
  # Cache
  cache = Discord::Cache.new(BOT)
  BOT.cache = cache
  # Ready event
  BOT.on_ready do |event|
    # Amount of guilds
    guild_count = cache.guilds.size
    # Set status
    BOT.status_update("online", Discord::GamePlaying.new(name: "#{CONFIG["prefix"]}help | #{guild_count} servers", type: :watching))
  end
  BOT.run
end
