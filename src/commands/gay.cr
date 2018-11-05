module Granz
  module Gay
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if (payload.content.starts_with? PREFIX[0] + "gay") || (payload.content.starts_with? PREFIX[1] + "gay") || (payload.content.starts_with? PREFIX[2] + "gay") || (payload.content.starts_with? PREFIX[3] + "gay") || (payload.content.starts_with? PREFIX[4] + "gay")
        pres = payload.content.gsub("#{PREFIX[1]} ", "#{PREFIX[1]}").gsub("#{PREFIX[3]} ", "#{PREFIX[3]}")
        argscount = pres.split(" ")

        argss = pres.gsub("gay ", "").gsub("#{PREFIX[1]} ", "").gsub("#{PREFIX[1]}", "").gsub("#{PREFIX[3]}", "").gsub("#{PREFIX[3]} ", "").gsub("#{PREFIX[0]}", "")
        ###

        if argscount.size > 2
          embed = Discord::Embed.new(
            colour: 0xffff00,
            title: "Too many arguments"
          )
          BOT.create_message(payload.channel_id, "", embed)
        elsif argscount.size > 1
          mentioned_user = payload.mentions
          begin
            if (mentioned_user[0] == payload.author) || (mentioned_user[0] != payload.author)
              imggnamee = rand(1..1650)

              HTTP::Client.get("https://cdn.discordapp.com/avatars/#{mentioned_user[0].id}/#{mentioned_user[0].avatar}.jpg?size=1024") do |response|
                File.write("#{imggnamee}y.jpg", response.body_io)
              end

              LibMagick.magickWandGenesis
              wand1 = LibMagick.newMagickWand
              wand2 = LibMagick.newMagickWand
              LibMagick.magickReadImage wand2, "./src/images/gay.png"
              LibMagick.magickReadImage wand1, "#{imggnamee}y.jpg"
              LibMagick.magickAdaptiveResizeImage wand1, 1024, 1024
              LibMagick.magickCompositeImage wand1, wand2, LibMagick::CompositeOperator::OverCompositeOp, 0, 0
              LibMagick.magickWriteImage wand1, "gay#{imggnamee}.png"
              LibMagick.destroyMagickWand wand2
              LibMagick.destroyMagickWand wand1
              LibMagick.magickWandTerminus
              BOT.upload_file(payload.channel_id, "", File.open("gay#{imggnamee}.png", "r"))
              File.delete("./#{imggnamee}y.jpg")
              File.delete("./gay#{imggnamee}.png")
            else
              embed = Discord::Embed.new(
                timestamp: Time.now,
                colour: 0xffff00,
                title: "Mention a user"
              )

              BOT.create_message(payload.channel_id, "", embed)
            end
          rescue
            embed = Discord::Embed.new(
              colour: 0xffff00,
              title: "Mention a user"
            )
            BOT.create_message(payload.channel_id, "", embed)
          end
        elsif argscount.size == 1
          begin
            imggnamee = rand(1..1650)

            HTTP::Client.get("https://cdn.discordapp.com/avatars/#{payload.author.id}/#{payload.author.avatar}.jpg?size=1024") do |response|
              File.write("#{imggnamee}y.jpg", response.body_io)
            end

            LibMagick.magickWandGenesis
            wand1 = LibMagick.newMagickWand
            wand2 = LibMagick.newMagickWand
            LibMagick.magickReadImage wand2, "./src/images/gay.png"
            LibMagick.magickReadImage wand1, "#{imggnamee}y.jpg"
            LibMagick.magickAdaptiveResizeImage wand1, 1024, 1024
            LibMagick.magickCompositeImage wand1, wand2, LibMagick::CompositeOperator::OverCompositeOp, 0, 0
            LibMagick.magickWriteImage wand1, "gay#{imggnamee}.png"
            LibMagick.destroyMagickWand wand2
            LibMagick.destroyMagickWand wand1
            LibMagick.magickWandTerminus
            BOT.upload_file(payload.channel_id, "", File.open("gay#{imggnamee}.png", "r"))
            File.delete("./#{imggnamee}y.jpg")
            File.delete("./gay#{imggnamee}.png")
          rescue
            embed = Discord::Embed.new(
              colour: 0xffff00,
              title: "Mention a user"
            )
            BOT.create_message(payload.channel_id, "", embed)
          end
        end
      end
    end
  end
end
