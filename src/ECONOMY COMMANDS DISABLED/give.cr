module Granz
  module Give
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
      if (payload.content.starts_with? PREFIX[0] + "give") || (payload.content.starts_with? PREFIX[1] + "give") || (payload.content.starts_with? PREFIX[2] + "give") || (payload.content.starts_with? PREFIX[3] + "give") || (payload.content.starts_with? PREFIX[4] + "give")
        pres = payload.content.gsub("#{PREFIX[1]} ", "#{PREFIX[1]}").gsub("#{PREFIX[3]} ", "#{PREFIX[3]}")
        argscount = pres.split(" ")
        if argscount.size > 1
          mentioned_user = payload.mentions
          argss = pres.gsub("give ", "").gsub("#{PREFIX[1]} ", "").gsub("#{PREFIX[1]}", "").gsub("#{PREFIX[3]}", "").gsub("#{PREFIX[3]} ", "").gsub("#{PREFIX[0]}", "").gsub("<@#{mentioned_user[0].id}> ", "").gsub("<@!#{mentioned_user[0].id}> ", "")
          begin
            responsee = HTTP::Client.get "url_for_db"
            value = JSON.parse(responsee.body).as_h
            valuue = JSON.parse(responsee.body)
            argsss = argss.to_i
            if argsss < 1
              emmbeed = Discord::Embed.new(
                title: "No negative numbers",
                thumbnail: Discord::EmbedThumbnail.new(
                  url: "https://i.imgur.com/2K7FXik.png"
                ),
                colour: 0xffff00
              )
              BOT.create_message(payload.channel_id, "", emmbeed)
            else
              if value["#{payload.author.id}"]?
                bbacc = valuue["#{payload.author.id}"]["background"]
                sslogann = valuue["#{payload.author.id}"]["slogan"]
                eeggss = valuue["#{payload.author.id}"]["eggplants"]
                bbarcoins = valuue["#{payload.author.id}"]["baracoins"]
                if bbarcoins.to_s.to_i >= argsss
                  if value["#{mentioned_user[0].id}"]?
                    rancheck = rand(1000..9999)
                    embed = Discord::Embed.new(
                      colour: 0xffff00,
                      title: "Please type #{rancheck} to send coins!"
                    )
                    BOT.create_message(payload.channel_id, "", embed)
                    response = await_manager.await_user(payload.author.id, 10.seconds)
                    case response
                    when Discord::Message
                      next unless response.content == "#{rancheck}"

                      bacc = valuue["#{mentioned_user[0].id}"]["background"]
                      slogann = valuue["#{mentioned_user[0].id}"]["slogan"]
                      eggss = valuue["#{mentioned_user[0].id}"]["eggplants"]
                      barcoins = valuue["#{mentioned_user[0].id}"]["baracoins"]

                      baracoinss = barcoins.to_s.to_i + argsss
                      aaa = value.merge({"#{mentioned_user[0].id}" => {"username" => "#{mentioned_user[0].username}", "discriminator" => "#{mentioned_user[0].discriminator}", "background" => bacc, "baracoins" => baracoinss, "eggplants" => eggss, "slogan" => slogann, "avatar" => "#{mentioned_user[0].avatar}"}})

                      headersss = HTTP::Headers{"User-agent" => "GranzBot", "Content-Type" => "application/json"}
                      bodyyy = aaa.to_json
                      HTTP::Client.put("url_for_db", headers: headersss, body: bodyyy) do |res|
                        statusss = res.status_code
                        if statusss != 200
                          puts "Uh oh! Register returned : #{statusss}!"
                        end
                      end

                      bbarcoinss = bbarcoins.to_s.to_i - argsss
                      aaaa = aaa.merge({"#{payload.author.id}" => {"username" => "#{payload.author.username}", "discriminator" => "#{payload.author.discriminator}", "background" => bbacc, "baracoins" => bbarcoinss, "eggplants" => eeggss, "slogan" => sslogann, "avatar" => "#{payload.author.avatar}"}})

                      headerssss = HTTP::Headers{"User-agent" => "GranzBot", "Content-Type" => "application/json"}
                      bodyyyy = aaaa.to_json
                      HTTP::Client.put("url_for_db", headers: headerssss, body: bodyyyy) do |res|
                        statusss = res.status_code
                        if statusss != 200
                          puts "Uh oh! Register returned : #{statusss}!"
                        end
                      end

                      embed = Discord::Embed.new(
                        title: "You gave #{mentioned_user[0].username}:",
                        description: "#{argsss} coins!",
                        thumbnail: Discord::EmbedThumbnail.new(
                          url: "https://i.imgur.com/2K7FXik.png"
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
                      colour: 0xffff00,
                      title: "User not registered!",
                      description: "Type #{PREFIX[0]}register to register!"
                    )
                    BOT.create_message(payload.channel_id, "", embed)
                  end
                else
                  embed = Discord::Embed.new(
                    title: "You don't have enough coins",
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
                  title: "You are not registered!",
                  description: "Type #{PREFIX[0]}register to register!"
                )
                BOT.create_message(payload.channel_id, "", embed)
              end
            end
          rescue
            embed = Discord::Embed.new(
              colour: 0xffff00,
              title: "Usage:",
              description: "#{PREFIX[0]}barcoin <user> <number>"
            )
            BOT.create_message(payload.channel_id, "", embed)
          end
        else
          embed = Discord::Embed.new(
            colour: 0xffff00,
            title: "Usage:",
            description: "#{PREFIX[0]}barcoin <user> <number>"
          )
          BOT.create_message(payload.channel_id, "", embed)
        end
      end
    end
  end
end
