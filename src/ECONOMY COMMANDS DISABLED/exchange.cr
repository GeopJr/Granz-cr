module Granz
  module Exchange
    class AwaitManager
      class Timeout
        INSTANCE = new
      end

      def initialize(client : Discord::Client)
        @handlers = [] of Proc(Discord::Message, Bool)

        client.on_message_create do |payload|
          @handlers.dup.each do |handler|
            @handlers.delete(handler) if handler.call(payload)
          end
        end
      end

      private def on_message(&block : Discord::Message -> Bool)
        @handlers << block
      end

      def await_user(id : Discord::Snowflake, timeout : Time::Span? = nil)
        channel = Channel(Discord::Message | Timeout).new(1)

        if timeout
          spawn do
            sleep timeout.not_nil!
            channel.send(Timeout::INSTANCE)
          end
        end

        spawn do
          on_message do |payload|
            if payload.author.id == id
              channel.send(payload)
              true
            else
              false
            end
          end
        end

        channel.receive
      end
    end

    client = BOT
    await_manager = AwaitManager.new(client)

    BOT.on_message_create do |payload|
      next if payload.author.bot
      if (payload.content.starts_with? PREFIX[0] + "exchange") || (payload.content.starts_with? PREFIX[1] + "exchange") || (payload.content.starts_with? PREFIX[2] + "exchange") || (payload.content.starts_with? PREFIX[3] + "exchange") || (payload.content.starts_with? PREFIX[4] + "exchange")
        pres = payload.content.gsub("#{PREFIX[1]} ", "#{PREFIX[1]}").gsub("#{PREFIX[3]} ", "#{PREFIX[3]}")
        argscount = pres.split(" ")
        argss = pres.gsub("exchange ", "").gsub("#{PREFIX[1]} ", "").gsub("#{PREFIX[1]}", "").gsub("#{PREFIX[3]}", "").gsub("#{PREFIX[3]} ", "").gsub("#{PREFIX[0]}", "")
        begin
          responsee = HTTP::Client.get "url_for_db"
          value = JSON.parse(responsee.body).as_h
          valuue = JSON.parse(responsee.body)
          if value["#{payload.author.id}"]?
            rancheck = rand(1000..9999)
            barcoins = valuue["#{payload.author.id}"]["baracoins"]
            if barcoins.to_s.to_i >= 1000
              embeed = Discord::Embed.new(
                colour: 0xffff00,
                title: "Please type #{rancheck} to confirm!"
              )
              BOT.create_message(payload.channel_id, "", embeed)
              response = await_manager.await_user(payload.author.id, 10.seconds)

              bacc = valuue["#{payload.author.id}"]["background"]
              eggss = valuue["#{payload.author.id}"]["eggplants"]
              slogann = valuue["#{payload.author.id}"]["slogan"]

              case response
              when Discord::Message
                next unless response.content == "#{rancheck}"
                baracoinss = barcoins.to_s.to_i - 1000
                eggsss = eggss.to_s.to_i + 1
                aaa = value.merge({"#{payload.author.id}" => {"username" => "#{payload.author.username}", "discriminator" => "#{payload.author.discriminator}", "background" => bacc, "baracoins" => baracoinss, "eggplants" => eggsss, "slogan" => slogann, "avatar" => "#{payload.author.avatar}"}})

                headersss = HTTP::Headers{"User-agent" => "GranzBot", "Content-Type" => "application/json"}
                bodyyy = aaa.to_json
                HTTP::Client.put("url_for_db", headers: headersss, body: bodyyy) do |res|
                  statusss = res.status_code
                  if statusss != 200
                    puts "Uh oh! Register returned : #{statusss}!"
                  end
                end

                embed = Discord::Embed.new(
                  title: "You Leveled UP",
                  description: "Current level: #{eggsss}",
                  thumbnail: Discord::EmbedThumbnail.new(
                    url: "https://thumbs.gfycat.com/WhiteFinishedAsianconstablebutterfly-small.gif"
                  ),
                  colour: 0xffff00
                )
                BOT.create_message(payload.channel_id, "", embed)
              when AwaitManager::Timeout
                embedd = Discord::Embed.new(
                  colour: 0xffff00,
                  title: "You took too long to reply!",
                  description: "Try again!"
                )
                client.create_message(payload.channel_id, "", embedd)
              end
            else
              embed = Discord::Embed.new(
                title: "You don't have enough coins",
                description: "You need at least 1000",
                thumbnail: Discord::EmbedThumbnail.new(
                  url: "https://i.imgur.com/2K7FXik.png"
                ),
                colour: 0xffff00
              )
              BOT.create_message(payload.channel_id, "", embed)
            end
          else
            embed = Discord::Embed.new(
              colour: 0xffff00,
              title: "User not registered!",
              description: "Type #{PREFIX[0]}register to register!"
            )
            BOT.create_message(payload.channel_id, "", embed)
          end
        rescue
          embed = Discord::Embed.new(
            colour: 0xffff00,
            title: "Error",
            url: "https://geopjr.xyz"
          )
          BOT.create_message(payload.channel_id, "", embed)
        end
      end
    end
  end
end
