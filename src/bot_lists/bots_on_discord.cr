module Granz
  class Bots_on_Discord < BotList::Provider
    def name
      "bots.ondiscord.xyz"
    end

    def update(cache)
      payload = {guildCount: cache.guilds.size}.to_json
      headers = HTTP::Headers{
        "Content-Type"  => "application/json",
        "Authorization" => ENV["BOTSONDISCORD_TOKEN"],
      }
      client_id = cache.resolve_current_user.id
      HTTP::Client.post("https://bots.ondiscord.xyz/bot-api/bots/#{client_id}/guilds", headers, payload)
    end
  end
end
