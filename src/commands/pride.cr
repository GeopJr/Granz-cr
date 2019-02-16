module Granz
  module Pride
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if PREFIX.any? { |p| payload.content.starts_with?("#{p}pride") }
        pres = payload.content.gsub("#{PREFIX[1]} ", "#{PREFIX[1]}").gsub("#{PREFIX[3]} ", "#{PREFIX[3]}")
        argscount = pres.split(" ")

        args = pres.gsub("pride ", "").gsub("#{PREFIX[1]} ", "").gsub("#{PREFIX[1]}", "").gsub("#{PREFIX[3]}", "").gsub("#{PREFIX[3]} ", "").gsub("#{PREFIX[0]}", "").split(" ")
        begin
          if (args[0] == "gay") || (args[0] == "homosexual")
            imgname = "./src/images/homo"
          elsif (args[0] == "bi") || (args[0] == "bisexual")
            imgname = "./src/images/bi"
          elsif (args[0] == "pan") || (args[0] == "pansexual")
            imgname = "./src/images/pan"
          elsif (args[0] == "trans") || (args[0] == "transsexual") || (args[0] == "transgender")
            imgname = "./src/images/trans"
          elsif (args[0] == "ace") || (args[0] == "asexual")
            imgname = "./src/images/ace"
          elsif (args[0] == "aro") || (args[0] == "aromantic")
            imgname = "./src/images/aro"
          elsif (args[0] == "str8") || (args[0] == "straight") || (args[0] == "hetero") || (args[0] == "heterosexual")
            imgname = "./src/images/str8"
          elsif (args[0] == "ally")
            imgname = "./src/images/ally"
          else
	    # Why am I like this?
            imgname = args[999999]
          end
          if argscount.size > 3
            embed = Discord::Embed.new(
              colour: 0xffff00,
              title: "Too many arguments"
            )
            BOT.create_message(payload.channel_id, "", embed)
          elsif argscount.size > 2
            mentioned_user = payload.mentions
            begin
              if (mentioned_user[0] == payload.author) || (mentioned_user[0] != payload.author)
                imggnamee = rand(1..1650)

                HTTP::Client.get("https://cdn.discordapp.com/avatars/#{mentioned_user[0].id}/#{mentioned_user[0].avatar}.jpg?size=1024") do |response|
                  File.write("#{imggnamee}z.jpg", response.body_io)
                end

                LibMagick.magickWandGenesis
                wand1 = LibMagick.newMagickWand
                wand2 = LibMagick.newMagickWand
                LibMagick.magickReadImage wand2, "#{imgname}.png"
                LibMagick.magickReadImage wand1, "#{imggnamee}z.jpg"
                LibMagick.magickAdaptiveResizeImage wand1, 1024, 1024
                LibMagick.magickCompositeImage wand1, wand2, LibMagick::CompositeOperator::OverCompositeOp, 0, 0
                LibMagick.magickWriteImage wand1, "#{imgname}#{imggnamee}.png"
                LibMagick.destroyMagickWand wand2
                LibMagick.destroyMagickWand wand1
                LibMagick.magickWandTerminus
                BOT.upload_file(payload.channel_id, "", File.open("#{imgname}#{imggnamee}.png", "r"))
                File.delete("./#{imggnamee}z.jpg")
                File.delete("./#{imgname}#{imggnamee}.png")
              else
                embed = Discord::Embed.new(

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
          elsif argscount.size == 2
            begin
              imggnamee = rand(1..1650)

              HTTP::Client.get("https://cdn.discordapp.com/avatars/#{payload.author.id}/#{payload.author.avatar}.jpg?size=1024") do |response|
                File.write("#{imggnamee}z.jpg", response.body_io)
              end

              LibMagick.magickWandGenesis
              wand1 = LibMagick.newMagickWand
              wand2 = LibMagick.newMagickWand
              LibMagick.magickReadImage wand2, "#{imgname}.png"
              LibMagick.magickReadImage wand1, "#{imggnamee}z.jpg"
              LibMagick.magickAdaptiveResizeImage wand1, 1024, 1024
              LibMagick.magickCompositeImage wand1, wand2, LibMagick::CompositeOperator::OverCompositeOp, 0, 0
              LibMagick.magickWriteImage wand1, "#{imgname}#{imggnamee}.png"
              LibMagick.destroyMagickWand wand2
              LibMagick.destroyMagickWand wand1
              LibMagick.magickWandTerminus
              BOT.upload_file(payload.channel_id, "", File.open("#{imgname}#{imggnamee}.png", "r"))
              File.delete("./#{imggnamee}z.jpg")
              File.delete("./#{imgname}#{imggnamee}.png")
            rescue
              embed = Discord::Embed.new(
                colour: 0xffff00,
                title: "Mention a user"
              )
              BOT.create_message(payload.channel_id, "", embed)
            end
          end
        rescue
          embed = Discord::Embed.new(
            colour: 0xffff00,
            title: "#{PREFIX[0]}pride <sexuality> [mention]",
            description: "Available sexualities: **gay, bi, pan, trans, ace, str8**\nThere's also: **ally, aro**"
          )
          BOT.create_message(payload.channel_id, "", embed)
        end
        
      end
    end
  end
end
