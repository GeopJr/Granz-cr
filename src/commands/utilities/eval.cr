#
# This is 90% by z64
# https://github.com/z64/hornet/blob/rewrite/src/plugins/carcin.cr
#
module Granz
  command = Command.new("eval", "utilities", "#{CONFIG["prefix"]}eval <CODE BLOCK>", "#{CONFIG["prefix"]}eval ´´´cr\nputs 1 + 1\n´´´", "Evals code inside the provided code-block. Available languages: cr, rb, c", true)
  Granz::COMMANDS[command.name] = command

  module Commands
    module Eval
      extend self

      def execute(payload : Discord::Message, args : Array(String))
        return false if Granz::Args.min(1, args, payload.channel_id)
        carchead = HTTP::Headers{
          "Accept"           => "application/json",
          "Content-Type"     => "application/json; charset=utf-8",
          "User-Agent"       => "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36",
          "Referer"          => "https://carc.in",
          "X-Requested-With" => "XMLHttpRequest",
        }
        code = payload.content.match(/(\`\`\`(crystal|cr|rb|ruby|c|js|javascript)\n)([\S\s]+)(\n\`\`\`)/)
        return BOT.create_message(payload.channel_id, "", Discord::Embed.new(colour: 0xffff00, title: "Use code blocks", description: "Use only: __crystal/cr, ruby/rb, c__\nIn a code block command\neg. #{CONFIG["prefix"]}eval \\```cr\nputs \"hello world\"\n```")) unless code.try &.[1]
        language = args[0].downcase.gsub("```", "").gsub("cr", "crystal").gsub("rb", "ruby").gsub("c", "gcc")
        versions = {"crystal" => "0.34.0", "ruby" => "2.7.0", "gcc" => "6.3.1"}
        language = "crystal"
        version = "0.34.0"
        code = code.try &.[3]

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
        return BOT.create_message(payload.channel_id, "", Discord::Embed.new(colour: 0xff0000, title: "API returned #{res.status_code}")) unless res.status_code == 200
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
end
