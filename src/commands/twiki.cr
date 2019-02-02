module Granz
  module Twiki
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if PREFIX.any? { |p| payload.content.starts_with?("#{p}twiki") }
        pres = payload.content.gsub("#{PREFIX[1]} ", "#{PREFIX[1]}").gsub("#{PREFIX[3]} ", "#{PREFIX[3]}")
        argscount = pres.split(" ")
        if argscount.size > 1
          acro = pres.gsub("twiki ", "").gsub("#{PREFIX[1]} ", "").gsub("#{PREFIX[1]}", "").gsub("#{PREFIX[3]}", "").gsub("#{PREFIX[3]} ", "").gsub("#{PREFIX[0]}", "")
          response = HTTP::Client.get "https://en.tankiwiki.com/api.php?action=query&prop=revisions&rvlimit=1&rvprop=content&format=json&titles=#{acro.to_s.gsub(" ", "_")}"
          value = JSON.parse(response.body)
          begin
            value["query"]["pages"].as_h.select do |child|
              aa = value["query"]["pages"]["#{child}"]["revisions"][0]["*"].to_s.gsub(/===/, "").gsub(/==/, "").gsub(/=/, "").gsub(/\* /, "").gsub(/\*/, "").gsub(/\#/, "").gsub(/(\r\n\t|\n|\r\t)/,"").gsub(/\<br\>/, "\n").gsub(/\<br \/>/, "\n").gsub(/\{\{[^{{}}]*\}\}/, "").gsub(/\{[^{}]*\}/, "").gsub(/\[\[[^\[\[\]\]]*\]\]/, "").gsub(/\_\_[^____]*\_\_/, "").gsub(/<span[^>]*>([^<]*)<\/span>/, "").gsub(/\[[^\[ ]*\ /, "[").gsub(/\'\'\'/, "").gsub(/\'\'/, "").gsub(/\n\n\n/, "")
              if aa.size > 1980
                bef = aa.size - 1984
                beef = aa.size - bef
                beffed = beef + 4
                baf = aa[0..-bef]
                aaa = baf + "..."
              else
                aaa = aa
              end
              embed = Discord::Embed.new(

                colour: 0xffff00,
                title: "https://en.tankiwiki.com/#{acro.to_s.gsub(" ", "_")}",
                description: aaa
              )
              BOT.create_message(payload.channel_id, "", embed)
            end
          rescue
            embed = Discord::Embed.new(

              colour: 0xffff00,
              title: "Nothing Found For `#{acro.to_s}`"
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
