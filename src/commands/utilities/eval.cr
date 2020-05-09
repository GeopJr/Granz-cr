#
# This is 90% by z64
# https://github.com/z64/hornet/blob/rewrite/src/plugins/carcin.cr
#
module Granz
  module Eval
    BOT.on_message_create do |payload|
      next if payload.author.bot
      next unless Prefix_check.new("eval", payload.content).check
      next BOT.create_message(payload.channel_id, "", Discord::Embed.new(colour: 0xff0000, title: "Sorry, I only respond on guilds")) unless CACHE.resolve_channel(payload.channel_id).type.guild_text?
      args = Args.new("eval", payload.content).args
      next if Min_max_arg.new(1, args.size, 1, BOT, payload.channel_id).check
      carchead = HTTP::Headers{
        "Accept"           => "application/json",
        "Content-Type"     => "application/json; charset=utf-8",
        "User-Agent"       => "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36",
        "Referer"          => "https://carc.in",
        "X-Requested-With" => "XMLHttpRequest",
      }
      code = args.join(" ")
      next BOT.create_message(payload.channel_id, "", Discord::Embed.new(colour: 0xffff00, title: "Use code blocks", description: "Use only: __crystal/cr, ruby/rb, c__\nIn a code block command\neg. #{CONFIG["prefix"]}eval ```cr\nputs \"hello world\"\n```")) unless code.starts_with?(/\`\`\`(crystal|cr|rb|ruby|c|js|javascript)\n/) && code.ends_with?("```")
      language = code.downcase.split("\n")[0].gsub("```", "").gsub("cr", "crystal").gsub("rb", "ruby").gsub("c", "gcc")
      versions = {"crystal" => "0.34.0", "ruby" => "2.7.0", "gcc" => "6.3.1"}
      language = "crystal"
      version = "0.34.0"
      code = code.split("\n")
      code.shift
      code = code.join("\n").rstrip("`")

      body = JSON.build do |json_b|
        json_b.object do
          json_b.field("run_request") do
            json_b.object do
              json_b.field("language", language)
              json_b.field("version", versions[language])
              json_b.field("code", code)
            end
          end
        end
      end
      res = HTTP::Client.post("https://carc.in/run_requests", headers: carchead, body: body)
      next BOT.create_message(payload.channel_id, "", Discord::Embed.new(colour: 0xff0000, title: "API returned #{res.status_code}")) unless res.status_code == 200
      value = JSON.parse(res.body)
      if value["run_request"]["run"]["exit_code"] == 0
        succ = "Success"
        output = value["run_request"]["run"]["stdout"].to_s
      else
        succ = "Forgive me Father for I have sinned :pensive:"
        output = value["run_request"]["run"]["stderr"].to_s
      end
      embed = Discord::Embed.new(

        colour: 0xffff00,
        title: "#{succ}",
        description: "[carc.in](#{value["run_request"]["run"]["html_url"]})",
        fields: [Discord::EmbedField.new(
          name: ":inbox_tray: Input:",
          value: "```#{language}\n#{code}```"
        ),
        Discord::EmbedField.new(
          name: ":outbox_tray: Output:",
          value: "```#{language}\n#{output.gsub(/\e?\[(\d+)m/, "")}```"
        ),
        ]
      )
      BOT.create_message(payload.channel_id, "", embed)
    end
  end
end
