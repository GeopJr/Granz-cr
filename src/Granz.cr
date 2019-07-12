require "discordcr"
require "json"
require "http/client"
require "yaml"
require "magickwand-crystal"
require "./commands/*"

# Config
CONFIG = YAML.parse(File.read("./config.yaml"))
# Consts
PREFIX  = ["#{CONFIG["prefix"]}", "<@#{CONFIG["client_id"]}>", "<@#{CONFIG["client_id"]}> ", "<@!#{CONFIG["client_id"]}> ", "<@!#{CONFIG["client_id"]}>"]
VERSION = CONFIG["version"]
UPTIMER = Time.utc_now

module Granz
  # Authorize
  BOT = Discord::Client.new(token: "Bot #{CONFIG["token"]}", client_id: CONFIG["client_id"].to_s.to_u64)
  # Cache
  cache = Discord::Cache.new(BOT)
  BOT.cache = cache
  # Ready event
  BOT.on_ready do |things|
    # Initial status
    BOT.status_update("online", Discord::GamePlaying.new(name: "Booting... | #{CONFIG["prefix"]}help", type: 3_i64))
    # Wait 30 secs
    sleep 30.seconds
    # Amount of guilds
    servers = cache.guilds.size
    # Change status every 60 seconds from the array
    Discord.every(60000.milliseconds) do
      stats_array = [
        "discord.gg/SWEsj6q",
        "ZA WARUDO",
        "JJBA!",
        "BARA!",
        "Kuroshitsuji",
        "geopjr.xyz",
        "Geop crying",
      ]
      BOT.status_update("online", Discord::GamePlaying.new(name: "#{stats_array.sample} | #{CONFIG["prefix"]}help | #{servers} servers", type: 3_i64))
    end
  end
  BOT.run
end
