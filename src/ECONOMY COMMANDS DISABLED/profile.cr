module Granz
  module Profile
    BOT.on_message_create do |payload|
      next if payload.author.bot
      if (payload.content.starts_with? PREFIX[0] + "profile") || (payload.content.starts_with? PREFIX[1] + "profile") || (payload.content.starts_with? PREFIX[2] + "profile") || (payload.content.starts_with? PREFIX[3] + "profile") || (payload.content.starts_with? PREFIX[4] + "profile")
        pres = payload.content.gsub("#{PREFIX[1]} ", "#{PREFIX[1]}").gsub("#{PREFIX[3]} ", "#{PREFIX[3]}")
        argscount = pres.split(" ")

        argss = pres.gsub("profile ", "").gsub("#{PREFIX[1]} ", "").gsub("#{PREFIX[1]}", "").gsub("#{PREFIX[3]}", "").gsub("#{PREFIX[3]} ", "").gsub("#{PREFIX[0]}", "")
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
              responsee = HTTP::Client.get "url_for_db"
              value = JSON.parse(responsee.body).as_h
              valuee = JSON.parse(responsee.body)
              if value["#{payload.author.id}"]?
                if payload.author.avatar.nil?
                  HTTP::Client.get("https://discordapp.com/assets/dd4dbc0016779df1378e7812eabaa04d.png") do |response|
                    File.write("#{imggnamee}yx.png", response.body_io)
                  end
                else
                  HTTP::Client.get("https://cdn.discordapp.com/avatars/#{mentioned_user[0].id}/#{mentioned_user[0].avatar}.png?size=1024") do |response|
                    File.write("#{imggnamee}yx.png", response.body_io)
                  end
                end
                usernamee = valuee["#{mentioned_user[0].id}"]["username"]
                backgrounddd = valuee["#{mentioned_user[0].id}"]["background"]
                discriminatorr = valuee["#{mentioned_user[0].id}"]["discriminator"]
                baracoins = valuee["#{mentioned_user[0].id}"]["baracoins"]
                eggplants = valuee["#{mentioned_user[0].id}"]["eggplants"]
                slogan = valuee["#{mentioned_user[0].id}"]["slogan"]
                eembed = Discord::Embed.new(
                  title: "#{usernamee}##{discriminatorr}",
                  colour: 0xffff00,
                  thumbnail: Discord::EmbedThumbnail.new(
                    url: "https://i.imgur.com/2K7FXik.png"
                  ),
                  fields: [Discord::EmbedField.new(
                    name: "__Slogan__",
                    value: "#{slogan}"
                  ),
                           Discord::EmbedField.new(
                             name: "__Level__",
                             value: "<:level:509000627704168460> #{eggplants} <:level:509000627704168460>"
                           ),
                           Discord::EmbedField.new(
                             name: "__Bara-coins__",
                             value: "<:baracoin:508999232775258112> #{baracoins} <:baracoin:508999232775258112>"
                           ),
                  ]
                )
                BOT.create_message(payload.channel_id, "", eembed)

                LibMagick.magickWandGenesis
                wand1 = LibMagick.newMagickWand
                wand2 = LibMagick.newMagickWand
                d_wand = LibMagick.newDrawingWand
                p_wand = LibMagick.newPixelWand
                if LibMagick.magickReadImage(wand1, "./src/images/#{backgrounddd}.png")
                  LibMagick.pixelSetColor p_wand, "white"
                  LibMagick.drawSetFillColor d_wand, p_wand
                  LibMagick.drawSetFont d_wand, "Arial-Bold"
                  LibMagick.drawSetFontSize d_wand, 60
                  LibMagick.drawSetTextAntialias d_wand, true
                  LibMagick.drawSetTextAlignment d_wand, LibMagick::AlignType::CenterAlign
                  LibMagick.magickReadImage wand2, "#{imggnamee}yx.png"
                  LibMagick.magickAdaptiveResizeImage wand2, 256, 256
                  LibMagick.magickCompositeImage wand1, wand2, LibMagick::CompositeOperator::OverCompositeOp, 372, 17
                  LibMagick.drawAnnotation d_wand, 500, 455, "#{usernamee}##{discriminatorr}"
                  LibMagick.magickDrawImage wand1, d_wand
                  LibMagick.drawAnnotation d_wand, 500, 642, "#{slogan}"
                  LibMagick.magickDrawImage wand1, d_wand
                  if eggplants.to_s.size <= 5
                    LibMagick.drawSetFontSize d_wand, 160
                  elsif (eggplants.to_s.size > 5) && (eggplants.to_s.size < 10)
                    LibMagick.drawSetFontSize d_wand, 80
                  elsif (eggplants.to_s.size >= 10) && (eggplants.to_s.size <= 15)
                    LibMagick.drawSetFontSize d_wand, 40
                  else
                    LibMagick.drawSetFontSize d_wand, 20
                  end
                  LibMagick.drawSetTextAlignment d_wand, LibMagick::AlignType::LeftAlign
                  LibMagick.drawAnnotation d_wand, 549, 901, "#{eggplants}"
                  LibMagick.magickDrawImage wand1, d_wand
                  if baracoins.to_s.size <= 5
                    LibMagick.drawSetFontSize d_wand, 160
                  elsif (baracoins.to_s.size > 5) && (baracoins.to_s.size < 10)
                    LibMagick.drawSetFontSize d_wand, 80
                  elsif (baracoins.to_s.size >= 10) && (baracoins.to_s.size <= 15)
                    LibMagick.drawSetFontSize d_wand, 40
                  else
                    LibMagick.drawSetFontSize d_wand, 20
                  end
                  LibMagick.drawSetTextAlignment d_wand, LibMagick::AlignType::LeftAlign
                  LibMagick.drawAnnotation d_wand, 549, 1118, "#{baracoins}"
                  LibMagick.magickDrawImage wand1, d_wand
                  LibMagick.magickWriteImage wand1, "profile#{imggnamee}.png"
                end
                LibMagick.destroyMagickWand wand2
                LibMagick.destroyPixelWand p_wand
                LibMagick.destroyDrawingWand d_wand
                LibMagick.destroyMagickWand wand1
                LibMagick.magickWandTerminus
                BOT.upload_file(payload.channel_id, "", File.open("profile#{imggnamee}.png", "r"))
                File.delete("./#{imggnamee}yx.png")
                File.delete("./profile#{imggnamee}.png")
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
                colour: 0xffff00,
                title: "User not registered!",
                description: "Type #{PREFIX[0]}register to register!"
              )

              BOT.create_message(payload.channel_id, "", embed)
            end
          rescue
            embed = Discord::Embed.new(
              colour: 0xffff00,
              title: "User not registered!",
              description: "Type #{PREFIX[0]}register to register!"
            )
            BOT.create_message(payload.channel_id, "", embed)
          end
        elsif argscount.size == 1
          begin
            imggnamee = rand(1..1650)
            responsee = HTTP::Client.get "url_for_db"
            value = JSON.parse(responsee.body).as_h
            valuee = JSON.parse(responsee.body)
            if value["#{payload.author.id}"]?
              if payload.author.avatar.nil?
                HTTP::Client.get("https://discordapp.com/assets/dd4dbc0016779df1378e7812eabaa04d.png") do |response|
                  File.write("#{imggnamee}yx.png", response.body_io)
                end
              else
                HTTP::Client.get("https://cdn.discordapp.com/avatars/#{payload.author.id}/#{payload.author.avatar}.png?size=1024") do |response|
                  File.write("#{imggnamee}yx.png", response.body_io)
                end
              end
              usernamee = valuee["#{payload.author.id}"]["username"]
              backgrounddd = valuee["#{payload.author.id}"]["background"]
              discriminatorr = valuee["#{payload.author.id}"]["discriminator"]
              baracoins = valuee["#{payload.author.id}"]["baracoins"]
              eggplants = valuee["#{payload.author.id}"]["eggplants"]
              slogan = valuee["#{payload.author.id}"]["slogan"]
              eembed = Discord::Embed.new(
                title: "#{usernamee}##{discriminatorr}",
                colour: 0xffff00,
                thumbnail: Discord::EmbedThumbnail.new(
                  url: "https://i.imgur.com/2K7FXik.png"
                ),
                fields: [Discord::EmbedField.new(
                  name: "__Slogan__",
                  value: "#{slogan}"
                ),
                         Discord::EmbedField.new(
                           name: "__Level__",
                           value: "<:level:509000627704168460> #{eggplants} <:level:509000627704168460>"
                         ),
                         Discord::EmbedField.new(
                           name: "__Bara-coins__",
                           value: "<:baracoin:508999232775258112> #{baracoins} <:baracoin:508999232775258112>"
                         ),
                ]
              )
              BOT.create_message(payload.channel_id, "", eembed)
              LibMagick.magickWandGenesis
              wand1 = LibMagick.newMagickWand
              wand2 = LibMagick.newMagickWand
              d_wand = LibMagick.newDrawingWand
              p_wand = LibMagick.newPixelWand
              if LibMagick.magickReadImage(wand1, "./src/images/#{backgrounddd}.png")
                LibMagick.pixelSetColor p_wand, "white"
                LibMagick.drawSetFillColor d_wand, p_wand
                LibMagick.drawSetFont d_wand, "Arial-Bold"
                LibMagick.drawSetFontSize d_wand, 60
                LibMagick.drawSetTextAntialias d_wand, true
                LibMagick.drawSetTextAlignment d_wand, LibMagick::AlignType::CenterAlign
                LibMagick.magickReadImage wand2, "#{imggnamee}yx.png"
                LibMagick.magickAdaptiveResizeImage wand2, 256, 256
                LibMagick.magickCompositeImage wand1, wand2, LibMagick::CompositeOperator::OverCompositeOp, 372, 17
                LibMagick.drawAnnotation d_wand, 500, 455, "#{usernamee}##{discriminatorr}"
                LibMagick.magickDrawImage wand1, d_wand
                LibMagick.drawAnnotation d_wand, 500, 642, "#{slogan}"
                LibMagick.magickDrawImage wand1, d_wand
                if eggplants.to_s.size <= 5
                  LibMagick.drawSetFontSize d_wand, 160
                elsif (eggplants.to_s.size > 5) && (eggplants.to_s.size < 10)
                  LibMagick.drawSetFontSize d_wand, 80
                elsif (eggplants.to_s.size >= 10) && (eggplants.to_s.size <= 15)
                  LibMagick.drawSetFontSize d_wand, 40
                else
                  LibMagick.drawSetFontSize d_wand, 20
                end
                LibMagick.drawSetTextAlignment d_wand, LibMagick::AlignType::LeftAlign
                LibMagick.drawAnnotation d_wand, 549, 901, "#{eggplants}"
                LibMagick.magickDrawImage wand1, d_wand
                if baracoins.to_s.size <= 5
                  LibMagick.drawSetFontSize d_wand, 160
                elsif (baracoins.to_s.size > 5) && (baracoins.to_s.size < 10)
                  LibMagick.drawSetFontSize d_wand, 80
                elsif (baracoins.to_s.size >= 10) && (baracoins.to_s.size <= 15)
                  LibMagick.drawSetFontSize d_wand, 40
                else
                  LibMagick.drawSetFontSize d_wand, 20
                end
                LibMagick.drawSetTextAlignment d_wand, LibMagick::AlignType::LeftAlign
                LibMagick.drawAnnotation d_wand, 549, 1118, "#{baracoins}"
                LibMagick.magickDrawImage wand1, d_wand
                LibMagick.magickWriteImage wand1, "profile#{imggnamee}.png"
              end
              LibMagick.destroyMagickWand wand2
              LibMagick.destroyPixelWand p_wand
              LibMagick.destroyDrawingWand d_wand
              LibMagick.destroyMagickWand wand1
              LibMagick.magickWandTerminus
              BOT.upload_file(payload.channel_id, "", File.open("profile#{imggnamee}.png", "r"))
              File.delete("./#{imggnamee}yx.png")
              File.delete("./profile#{imggnamee}.png")
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
              title: "User not registered!",
              description: "Type #{PREFIX[0]}register to register!"
            )
            BOT.create_message(payload.channel_id, "", embed)
          end
        end
      end
    end
  end
end
