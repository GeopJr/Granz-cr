require "discordcr"
require "json"
require "http/client"
require "magickwand-crystal"

require "./commands/collector.cr"
require "./commands/fun/*"
require "./commands/gaming/*"
require "./commands/nsfw/*"
require "./commands/roleplay/*"
require "./commands/utilities/*"
require "./functions/*"

# This will build the commands page
# require "./page_gen.cr"

# Config
CONFIG = JSON.parse(File.read("./config.json"))
# Check Config
["client_id", "my_id", "version", "prefix", "token", "support_guild", "my_tag"].each do |p|
  if CONFIG.as_h.fetch(p, nil).nil?
    raise "#{p} is not set in config.json"
  end
end

# Consts
VERSION = CONFIG["version"]
UPTIMER = Time.utc
# Logger
ENV["CRYSTAL_LOG_SOURCES"] ||= "*"
ENV["CRYSTAL_LOG_LEVEL"] ||= "INFO"
Log.setup_from_env

module Granz
  # Authorize
  BOT = Discord::Client.new(token: "Bot #{CONFIG["token"]}", client_id: CONFIG["client_id"].to_s.to_u64, intents: Discord::Gateway::Intents::Guilds | Discord::Gateway::Intents::GuildMessages | Discord::Gateway::Intents::DirectMessages)
  # Cache
  CACHE = Discord::Cache.new(BOT)
  BOT.cache = CACHE
  # Ready event
  BOT.on_ready do |event|
    # Amount of guilds
    guild_count = event.guilds.size > CACHE.guilds.size ? event.guilds.size : CACHE.guilds.size
    # Set status
    BOT.status_update("online", Discord::GamePlaying.new(name: "#{CONFIG["prefix"]}help | #{guild_count} servers", type: :watching))
  end
  puts "Loaded #{Granz::COMMANDS.size} public commands!"
  BOT.run
end
