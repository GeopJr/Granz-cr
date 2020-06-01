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

{% if env("GRANZ_BUILD") %}
  # This will build the commands page
  require "./page_gen.cr"
{% end %}

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
  modules = Granz::Commands.collected_modules.uniq!
  BOT.on_message_create do |payload|
    next if payload.author.bot
    command = Prefix.new(payload.content)
    next unless !command.name.nil? && Granz::COMMANDS.has_key?(command.name.not_nil!.downcase)
    next BOT.create_message(payload.channel_id, "", Discord::Embed.new(colour: 0xff0000, title: "Sorry, I only respond on guilds")) unless CACHE.resolve_channel(payload.channel_id).type.guild_text?
    command_module = modules.find { |i| i.to_s == "Granz::Commands::#{command.name.not_nil!.capitalize}" }
    args = Granz::COMMANDS[command.name].args ? command.args : [] of String
    command_module.try &.execute(payload, args)
    next
  end
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
