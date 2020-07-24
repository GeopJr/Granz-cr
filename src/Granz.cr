require "discordcr"
require "json"
require "http/client"
require "magickwand-crystal"
# Loading all commands and functions
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

{% if env("GRANZ_BOTLIST") %}
  require "bot_list"
  require "./bot_lists/*"
{% end %}

# Config
CONFIG = JSON.parse(File.read("./config.json"))
# Check Config
["client_id", "my_id", "version", "prefix", "support_guild", "my_tag"].each do |p|
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
  BOT = Discord::Client.new(token: "Bot #{ENV["GRANZ_TOKEN"]?}", client_id: CONFIG["client_id"].to_s.to_u64, intents: Discord::Gateway::Intents::Guilds | Discord::Gateway::Intents::GuildMessages | Discord::Gateway::Intents::DirectMessages)
  # Cache
  CACHE = Discord::Cache.new(BOT)
  BOT.cache = CACHE
  # All modules, see src/commands/collector.cr
  modules = Granz::Commands.collected_modules
  BOT.on_message_create do |payload|
    next if payload.author.bot
    # src/functions/prefix.cr
    command = Prefix.new(payload.content)
    # Make sure it was found
    next unless !command.name.nil? && Granz::COMMANDS.has_key?(command.name.not_nil!.downcase)
    # Don't respond to dms (if you even listen to it on intents)
    next BOT.create_message(payload.channel_id, "", Discord::Embed.new(colour: 0xff0000, title: "Sorry, I only respond on guilds")) unless CACHE.resolve_channel(payload.channel_id).type.guild_text?
    # Find the correct command
    command_module = modules.find { |i| i.to_s == "Granz::Commands::#{command.name.not_nil!.capitalize}" }
    # Check args
    args = Granz::COMMANDS[command.name].args ? command.args : [] of String
    # Execute
    command_module.try &.execute(payload, args)
    next
  end
  # Ready event
  BOT.on_ready do |event|
    # Bot lists
    {% if env("GRANZ_BOTLIST") %}
      bot_list = BotList::Client.new(BOT)
      bot_list.add_provider("top.gg") if ENV["TOPGG_TOKEN"]?
      bot_list.add_provider("discord.bots.gg") if ENV["BOTSGG_TOKEN"]?
      bot_list.add_provider(Bots_on_Discord.new) if ENV["BOTSONDISCORD_TOKEN"]?
      bot_list.update_every(5.hours)
    {% end %}
    # Amount of guilds
    guild_count = event.guilds.size > CACHE.guilds.size ? event.guilds.size : CACHE.guilds.size
    # Set status
    BOT.status_update("online", Discord::GamePlaying.new(name: "#{CONFIG["prefix"]}help | #{guild_count} servers", type: :watching))
  end
  puts "Loaded #{Granz::COMMANDS.size} public commands!"
  # Don't run if it's doc build
  {% if !env("GRANZ_BUILD") %}
    BOT.run
  {% end %}
end
