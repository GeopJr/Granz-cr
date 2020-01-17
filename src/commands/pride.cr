module Granz
  module Pride
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if PREFIX.any? { |p| payload.content.starts_with?("#{p}pride") }
        no_space = payload.content.gsub("#{PREFIX[1]} ", "#{PREFIX[1]}").gsub("#{PREFIX[3]} ", "#{PREFIX[3]}")
        args_count = no_space.split(" ")

        args = no_space.gsub("pride ", "").gsub("#{PREFIX[1]}", "").gsub("#{PREFIX[3]}", "").gsub("#{PREFIX[0]}", "").split(" ")
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
          if args_count.size > 3
            embed = Discord::Embed.new(
              colour: 0xffff00,
              title: "Too many arguments"
            )
            BOT.create_message(payload.channel_id, "", embed)
          elsif args_count.size > 2
            mentioned_user = payload.mentions[0]
            begin
              if (mentioned_user == payload.author) || (mentioned_user != payload.author)
                random_number = rand(1..1650)

                HTTP::Client.get("https://cdn.discordapp.com/avatars/#{mentioned_user.id}/#{mentioned_user.avatar}.jpg?size=1024") do |response|
                  File.write("#{random_number}z.jpg", response.body_io)
                end

                LibMagick.magickWandGenesis
                wand1 = LibMagick.newMagickWand
                wand2 = LibMagick.newMagickWand
                LibMagick.magickReadImage wand2, "#{imgname}.png"
                LibMagick.magickReadImage wand1, "#{random_number}z.jpg"
                LibMagick.magickAdaptiveResizeImage wand1, 1024, 1024
                LibMagick.magickCompositeImage wand1, wand2, LibMagick::CompositeOperator::OverCompositeOp, false, 0, 0
                LibMagick.magickWriteImage wand1, "#{imgname}#{random_number}.png"
                LibMagick.destroyMagickWand wand2
                LibMagick.destroyMagickWand wand1
                LibMagick.magickWandTerminus
                BOT.upload_file(payload.channel_id, "", File.open("#{imgname}#{random_number}.png", "r"))
                File.delete("./#{random_number}z.jpg")
                File.delete("./#{imgname}#{random_number}.png")
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
          elsif args_count.size == 2
            begin
              random_number = rand(1..1650)

              HTTP::Client.get("https://cdn.discordapp.com/avatars/#{payload.author.id}/#{payload.author.avatar}.jpg?size=1024") do |response|
                File.write("#{random_number}z.jpg", response.body_io)
              end

              LibMagick.magickWandGenesis
              wand1 = LibMagick.newMagickWand
              wand2 = LibMagick.newMagickWand
              LibMagick.magickReadImage wand2, "#{imgname}.png"
              LibMagick.magickReadImage wand1, "#{random_number}z.jpg"
              LibMagick.magickAdaptiveResizeImage wand1, 1024, 1024
              LibMagick.magickCompositeImage wand1, wand2, LibMagick::CompositeOperator::OverCompositeOp, false, 0, 0
              LibMagick.magickWriteImage wand1, "#{imgname}#{random_number}.png"
              LibMagick.destroyMagickWand wand2
              LibMagick.destroyMagickWand wand1
              LibMagick.magickWandTerminus
              BOT.upload_file(payload.channel_id, "", File.open("#{imgname}#{random_number}.png", "r"))
              File.delete("./#{random_number}z.jpg")
              File.delete("./#{imgname}#{random_number}.png")
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
