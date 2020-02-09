require "discordcr"
require "json"
require "http/client"
require "yaml"
require "magickwand-crystal"
require "./commands/*"

# Config
# TODO: Switch to json probably
CONFIG = YAML.parse(File.read("./config.yaml"))
# Consts
# TODO: Better prefix handler
PREFIX  = ["#{CONFIG["prefix"]}", "<@#{CONFIG["client_id"]}>", "<@#{CONFIG["client_id"]}> ", "<@!#{CONFIG["client_id"]}> ", "<@!#{CONFIG["client_id"]}>"]
VERSION = CONFIG["version"]
# TODO: Add option in config
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
