require "duktape/runtime"

#
# This is 90% by z64
# https://github.com/z64/hornet/blob/rewrite/src/plugins/carcin.cr
#
module Granz
  module Eval
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if PREFIX.any? { |p| payload.content.starts_with?("#{p}eval") }
        no_space = payload.content.gsub("#{PREFIX[1]} ", "#{PREFIX[1]}").gsub("#{PREFIX[3]} ", "#{PREFIX[3]}")
        args_count = no_space.split(" ")
        args = no_space.gsub("#{PREFIX[1]}", "").gsub("#{PREFIX[3]}", "").gsub("#{PREFIX[0]}", "").gsub("eval ", "").gsub("eval", "")
        begin
          carchead = HTTP::Headers{
            "Accept"           => "application/json",
            "Content-Type"     => "application/json; charset=utf-8",
            "User-Agent"       => "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36",
            "Referer"          => "https://carc.in",
            "X-Requested-With" => "XMLHttpRequest",
          }
          embeded = Discord::Embed.new(
            colour: 0xffff00,
            title: "Use code blocks",
            description: "Use only: __crystal/cr, ruby/rb, c, js/javascript__\nIn a code block command\neg. --eval ```cr\nputs \"hello world\"\n```"
          )
          next BOT.create_message(payload.channel_id, "", embeded) unless args.includes? "```"
          language = args.gsub("\n```", "").gsub("\n```", "").gsub("```", "").gsub("```", "").split("\n")[0].downcase
          if (language == "crystal") || (language == "cr")
            languagee = "crystal"
            version = "0.27.0"
            code = args.gsub("\n```crystal", "").gsub("\n```cr", "").gsub("```crystal", "").gsub("```cr", "").gsub("\n```", "").gsub("```", "")

            body = JSON.build do |json_b|
              json_b.object do
                json_b.field("run_request") do
                  json_b.object do
                    json_b.field("language", languagee)
                    json_b.field("version", version)
                    json_b.field("code", code)
                  end
                end
              end
            end
            res = HTTP::Client.post("https://carc.in/run_requests", headers: carchead, body: body)
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
                value: "```cr\n#{code}```"
              ),
              Discord::EmbedField.new(
                name: ":outbox_tray: Output:",
                value: "```cr\n#{output.gsub(/\e?\[(\d+)m/, "")}```"
              ),
              ]
            )
            BOT.create_message(payload.channel_id, "", embed)
          elsif (language == "ruby") || (language == "rb")
            languagee = "ruby"
            version = "2.4.1"
            code = args.gsub("\n```ruby", "").gsub("\n```rb", "").gsub("```ruby", "").gsub("```rb", "").gsub("\n```", "").gsub("```", "")

            body = JSON.build do |json_b|
              json_b.object do
                json_b.field("run_request") do
                  json_b.object do
                    json_b.field("language", languagee)
                    json_b.field("version", version)
                    json_b.field("code", code)
                  end
                end
              end
            end
            res = HTTP::Client.post("https://carc.in/run_requests", headers: carchead, body: body)
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
                value: "```rb\n#{code}```"
              ),
              Discord::EmbedField.new(
                name: ":outbox_tray: Output:",
                value: "```rb\n#{output.gsub(/\e?\[(\d+)m/, "")}```"
              ),
              ]
            )
            BOT.create_message(payload.channel_id, "", embed)
          elsif language == "c"
            languagee = "gcc"
            version = "6.3.1"
            code = args.gsub("\n```c", "").gsub("```c", "").gsub("\n```", "").gsub("```", "")

            body = JSON.build do |json_b|
              json_b.object do
                json_b.field("run_request") do
                  json_b.object do
                    json_b.field("language", languagee)
                    json_b.field("version", version)
                    json_b.field("code", code)
                  end
                end
              end
            end
            res = HTTP::Client.post("https://carc.in/run_requests", headers: carchead, body: body)
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
                value: "```c\n#{code}```"
              ),
              Discord::EmbedField.new(
                name: ":outbox_tray: Output:",
                value: "```c\n#{output.gsub(/\e?\[(\d+)m/, "")}```"
              ),
              ]
            )
            BOT.create_message(payload.channel_id, "", embed)
          elsif (language == "js") || (language == "javascript")
            languagee = "js"
            version = ""
            code = args.gsub("\n```javascript", "").gsub("\n```js", "").gsub("```javascript", "").gsub("```js", "").gsub("\n```", "").gsub("```", "")

            begin
              rt = Duktape::Runtime.new
              evaluated = rt.eval("#{code}")
              embed = Discord::Embed.new(

                colour: 0xffff00,
                title: "Success",
                fields: [Discord::EmbedField.new(
                  name: ":inbox_tray: Input:",
                  value: "```js\n#{code}```"
                ),
                Discord::EmbedField.new(
                  name: ":outbox_tray: Output:",
                  value: "```js\n#{evaluated}```"
                ),
                ]
              )
              BOT.create_message(payload.channel_id, "", embed)
            rescue e : Duktape::Error
              embed = Discord::Embed.new(

                colour: 0xffff00,
                title: "Forgive me Father for I have sinned :pensive:",
                fields: [Discord::EmbedField.new(
                  name: ":inbox_tray: Input:",
                  value: "```js\n#{code}```"
                ),
                Discord::EmbedField.new(
                  name: ":outbox_tray: Output:",
                  value: "```js\n#{e}```"
                ),
                ]
              )
              BOT.create_message(payload.channel_id, "", embed)
            end
          else
            embed = Discord::Embed.new(

              colour: 0xffff00,
              title: "Language Not Supported",
              description: "Use only: __crystal/cr, ruby/rb, c, js/javascript__")

            BOT.create_message(payload.channel_id, "", embed)
          end
        rescue
          embed = Discord::Embed.new(

            colour: 0xffff00,
            title: "Error",
            description: "Probably something is down"
          )
          BOT.create_message(payload.channel_id, "", embed)
        end
      end
    end
  end
end
