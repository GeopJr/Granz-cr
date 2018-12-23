require "discordcr"
require "json"
require "http/client"
require "yaml"
require "magickwand-crystal"
LibMagick.magickWandGenesis # lib init
require "./commands/*"

# Config
CONFIG = YAML.parse(File.read("./config.yaml"))

PREFIX  = ["#{CONFIG["prefix"]}", "<@#{CONFIG["client_id"]}>", "<@#{CONFIG["client_id"]}> ", "<@!#{CONFIG["client_id"]}> ", "<@!#{CONFIG["client_id"]}>"]
VERSION = CONFIG["version"]
UPTIMER = Time.utc_now

module Granz
  BOT = Discord::Client.new(token: "Bot #{CONFIG["token"]}", client_id: CONFIG["client_id"].to_s.to_u64)

  BOT.on_ready do |things|
    servers = things.guilds.size
    Discord.every(60000.milliseconds) do
      stattts = [
        "discord.gg/SWEsj6q",
        "ZA WARUDO",
        "JJBA!",
        "BARA!",
        "Kuroshitsuji",
        "geopjr.xyz",
        "Geop crying"
      ]
      BOT.status_update("online", Discord::GamePlaying.new(name: "#{stattts.sample} | #{CONFIG["prefix"]}help | #{servers} servers", type: 3_i64))
    end
  end
  BOT.run
end
