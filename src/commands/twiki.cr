module Granz
  module Twiki
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if PREFIX.any? { |p| payload.content.starts_with?("#{p}twiki") }
        no_space = payload.content.gsub("#{PREFIX[1]} ", "#{PREFIX[1]}").gsub("#{PREFIX[3]} ", "#{PREFIX[3]}")
        args_count = no_space.split(" ")
        if args_count.size > 1
          args = no_space.gsub("twiki ", "").gsub("#{PREFIX[1]}", "").gsub("#{PREFIX[3]}", "").gsub("#{PREFIX[0]}", "")
          response = HTTP::Client.get "https://en.tankiwiki.com/api.php?action=query&prop=revisions&rvlimit=1&rvprop=content&format=json&titles=#{args.to_s.gsub(" ", "_")}"
          value = JSON.parse(response.body)
          begin
            value["query"]["pages"].as_h.select do |child|
              regexed = value["query"]["pages"]["#{child}"]["revisions"][0]["*"].to_s.gsub(/===/, "").gsub(/==/, "").gsub(/=/, "").gsub(/\* /, "").gsub(/\*/, "").gsub(/\#/, "").gsub(/(\r\n\t|\n|\r\t)/, "").gsub(/\<br\>/, "\n").gsub(/\<br \/>/, "\n").gsub(/\{\{[^{{}}]*\}\}/, "").gsub(/\{[^{}]*\}/, "").gsub(/\[\[[^\[\[\]\]]*\]\]/, "").gsub(/\_\_[^____]*\_\_/, "").gsub(/<span[^>]*>([^<]*)<\/span>/, "").gsub(/\[[^\[ ]*\ /, "[").gsub(/\'\'\'/, "").gsub(/\'\'/, "").gsub(/\n\n\n/, "")
              if regexed.size > 1980
                bef = regexed.size - 1984
                in_range = regexed[0..-bef]
                desc = in_range + "..."
              else
                desc = regexed
              end
              embed = Discord::Embed.new(

                colour: 0xffff00,
                title: "https://en.tankiwiki.com/#{args.to_s.gsub(" ", "_")}",
                description: desc
              )
              BOT.create_message(payload.channel_id, "", embed)
            end
          rescue
            embed = Discord::Embed.new(

              colour: 0xffff00,
              title: "Nothing Found For `#{args.to_s}`"
            )
            BOT.create_message(payload.channel_id, "", embed)
          end
        else
          embed = Discord::Embed.new(
            colour: 0xffff00,
            title: "Too few arguments"
          )
          BOT.create_message(payload.channel_id, "", embed)
        end
      end
    end
  end
end
