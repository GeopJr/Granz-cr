require "discordcr"
require "json"
require "http/client"
require "magickwand-crystal"
LibMagick.magickWandGenesis # lib init

client = Discord::Client.new(token: "Bot token", client_id: 443053627419000833_u64)

PREFIX  = ["--", "<@443053627419000833>", "<@443053627419000833> ", "<@!443053627419000833>", "<@!443053627419000833> "]
VERSION = "3.0"
UPTIMER = Time.utc_now
cachee = Discord::Cache.new(client)
client.cache = cachee

barafile = HTTP::Client.get "-"
filenumbar = JSON.parse(barafile.body)

# # cmd_count
# client.on_message_create do |payload|
#   next if payload.author.bot
#   begin
#     if (payload.content.starts_with? PREFIX[1]) || (payload.content.starts_with? PREFIX[2]) || (payload.content.starts_with? PREFIX[3]) || (payload.content.starts_with? PREFIX[4])
#       response = HTTP::Client.get "-get_cmd_count_from_ur_json-"
#       value = JSON.parse(response.body)
#       ehh = value["cmd"].as_i + 1 #add 1 to your counter
#       headerss = HTTP::Headers{"Content-Type" => "application/json"}
#       bodyy = {"cmd" => ehh}.to_json
#       HTTP::Client.put("-post_to_the_same_json-", headers: headerss, body: bodyy) do |res|
#         statuss = res.status_code
#         if statuss != 200
#           puts "2Uh oh! Stats update responded with status #{statuss}!"
#         elsif statuss == 204
#           # nothing
#         end
#       end
#       end
#   rescue
#     # :P
#   end
# end

# #  stats
# client.on_message_create do |payload|
#   next if payload.author.bot
#   begin
#     if (payload.content.starts_with? PREFIX[0] + "stats") || (payload.content.starts_with? PREFIX[1] + "stats") || (payload.content.starts_with? PREFIX[2] + "stats") || (payload.content.starts_with? PREFIX[3] + "stats") || (payload.content.starts_with? PREFIX[4] + "stats")
#       response = HTTP::Client.get "-get_server_count_from_your_json-"
#       value = JSON.parse(response.body)
#       response = HTTP::Client.get "-get_cmd_count_from_ur_json-"
#       valuee = JSON.parse(response.body)
#       timee = Time.now - UPTIMER
#       embed = Discord::Embed.new(
#         title: "Here's some stats about me!!!",
#         fields: [Discord::EmbedField.new(
#           name: "__Servers:__",
#           value: "#{valuee["server_count"]}",
#           inline: true
#         ),
#                  Discord::EmbedField.new(
#                    name: "__Commands Used:__",
#                    value: "#{value["cmd"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}",
#                    inline: true
#                  ),
#                  Discord::EmbedField.new(
#                    name: "__Uptime:__",
#                    value: "#{timee.hours} Hours, #{timee.minutes} Minutes, #{timee.seconds} Seconds",
#                    inline: true
#                  ),
#         ],
#         timestamp: Time.now,
#         colour: 0xffff00,
#         footer: Discord::EmbedFooter.new(
#           text: "\xE3\x80\x8EGeop\xE3\x80\x8F#4066",
#           icon_url: "https://cdn.discordapp.com/avatars/216156825978929152/c7eaee00bbe99b16304429fb9b9116ea.png"
#         ),
#         author: Discord::EmbedAuthor.new(
#           name: "Granz#8561",
#           icon_url: "https://cdn.discordapp.com/avatars/443053627419000833/333d3868fa0837e800e6515558fd8179.png"
#         ),
#         url: "https://granz.geopjr.xyz"
#       )
#       client.create_message(payload.channel_id, "", embed)
#     end
#   rescue
#     embed = Discord::Embed.new(
#       title: "Error",
#       url: "https://granz.geopjr.xyz"
#     )
#     client.create_message(payload.channel_id, "", embed)
#   end
# 
# end

# uptime
client.on_message_create do |payload|
  next if payload.author.bot
  if (payload.content.starts_with? PREFIX[0] + "uptime") || (payload.content.starts_with? PREFIX[1] + "uptime") || (payload.content.starts_with? PREFIX[2] + "uptime") || (payload.content.starts_with? PREFIX[3] + "uptime") || (payload.content.starts_with? PREFIX[4] + "uptime")
    begin
      timee = Time.now - UPTIMER
      embed = Discord::Embed.new(
        timestamp: Time.now,
        colour: 0xffff00,
        title: "I've been up for:",
        description: "#{timee.hours} Hours, #{timee.minutes} Minutes, #{timee.seconds} Seconds"
      )
      client.create_message(payload.channel_id, "", embed)
    rescue
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Error",
        url: "https://granz.geopjr.xyz"
      )
      client.create_message(payload.channel_id, "", embed)
    end
  end
end
# Help
client.on_message_create do |payload|
  next if payload.author.bot
  begin
    if (payload.content.starts_with? PREFIX[0] + "help") || (payload.content.starts_with? PREFIX[1] + "help") || (payload.content.starts_with? PREFIX[2] + "help") || (payload.content == PREFIX[1]) || (payload.content == PREFIX[2]) || (payload.content.starts_with? PREFIX[3] + "help") || (payload.content.starts_with? PREFIX[4] + "help") || (payload.content == PREFIX[3]) || (payload.content == PREFIX[4])
      embed = Discord::Embed.new(
        title: "You called for help , here I am !!!",
        description: "\n__[Command List !](https://granz.geopjr.xyz/commands)__\n\n__Type --info for some info__\n\n__Found a bug? Add me \xE3\x80\x8EGeop\xE3\x80\x8F#4066__\n\n__[Support Server](https://discordbots.org/servers/404294934041067522)__",
        timestamp: Time.now,
        colour: 0xffff00,
        footer: Discord::EmbedFooter.new(
          text: "\xE3\x80\x8EGeop\xE3\x80\x8F#4066",
          icon_url: "https://cdn.discordapp.com/avatars/216156825978929152/c7eaee00bbe99b16304429fb9b9116ea.png"
        ),
        author: Discord::EmbedAuthor.new(
          name: "Granz#8561",
          icon_url: "https://cdn.discordapp.com/avatars/443053627419000833/333d3868fa0837e800e6515558fd8179.png"
        ),
        url: "https://granz.geopjr.xyz"
      )
      client.create_message(payload.channel_id, "", embed)
    end
  rescue
    embed = Discord::Embed.new(
      title: "Error",
      url: "https://granz.geopjr.xyz"
    )
    client.create_message(payload.channel_id, "", embed)
  end
end
# INFO
client.on_message_create do |payload|
  next if payload.author.bot
  begin
    if (payload.content.starts_with? PREFIX[0] + "info") || (payload.content.starts_with? PREFIX[1] + "info") || (payload.content.starts_with? PREFIX[2] + "info") || (payload.content.starts_with? PREFIX[3] + "info") || (payload.content.starts_with? PREFIX[4] + "info")
      embed = Discord::Embed.new(
        title: "Some Info",
        timestamp: Time.now,
        colour: 0xffff00,
        footer: Discord::EmbedFooter.new(
          text: "\xE3\x80\x8EGeop\xE3\x80\x8F#4066",
          icon_url: "https://cdn.discordapp.com/avatars/216156825978929152/c7eaee00bbe99b16304429fb9b9116ea.png"
        ),
        author: Discord::EmbedAuthor.new(
          name: "Granz#8561",
          icon_url: "https://cdn.discordapp.com/avatars/443053627419000833/333d3868fa0837e800e6515558fd8179.png"
        ),
        url: "https://granz.geopjr.xyz",
        fields: [Discord::EmbedField.new(
          name: "__Name & Avatar__",
          value: "Granz is a character made by Mentaiko"
        ),
                 Discord::EmbedField.new(
                   name: "__Version__",
                   value: "#{VERSION}"
                 ),
                 Discord::EmbedField.new(
                   name: "__Written in__",
                   value: "Crystal using discordcr"
                 ),
                 Discord::EmbedField.new(
                   name: "__Prefix__",
                   value: "#{PREFIX[0]} | #{PREFIX[1]}"
                 ),
                 Discord::EmbedField.new(
                   name: "__Invite Link__",
                   value: "[HERE](https://discordapp.com/oauth2/authorize?client_id=443053627419000833&scope=bot&permissions=388190&redirect_uri=https://granz.geopjr.xyz/thanks.html&response_type=code)"
                 ),
                 Discord::EmbedField.new(
                   name: "__Support Server__",
                   value: "https://discordbots.org/servers/404294934041067522"
                 ),
                 Discord::EmbedField.new(
                   name: "__MIT Licenced__",
                   value: "https://github.com/GeopJr/Granz-cr"
                 ),
                 Discord::EmbedField.new(
                   name: "__Found an error ?__", value: "<:steam:314349923044687872> [**Steam**](https://steamcommunity.com/id/geopjunior/)\n<:discord:314003252830011395> **『Geop』#4066**\n<:update:264184209617321984> **e-mail**: geopjr@geopjr.xyz"
                 ),
        ]
      )
      client.create_message(payload.channel_id, "", embed)
    end
  rescue
    embed = Discord::Embed.new(
      title: "Error",
      url: "https://granz.geopjr.xyz"
    )
    client.create_message(payload.channel_id, "", embed)
  end
end
# Bara
client.on_message_create do |payload|
  next if payload.author.bot
  if (payload.content.starts_with? PREFIX[0] + "bara") || (payload.content.starts_with? PREFIX[1] + "bara") || (payload.content.starts_with? PREFIX[2] + "bara") || (payload.content.starts_with? PREFIX[3] + "bara") || (payload.content.starts_with? PREFIX[4] + "bara")
    channel = client.get_channel(payload.channel_id)
    embeded = Discord::Embed.new(
      colour: 0xffff00,
      image: Discord::EmbedImage.new(
        url: "https://i.imgur.com/yVs6TqV.gif"
      ),
      title: "I'm sorry. I can't do that because this is a SFW channel."
    )
    next client.create_message(payload.channel_id, "", embeded) unless channel.nsfw == true
    begin
      response = HTTP::Client.get "-"
      value = JSON.parse(response.body)
      filesssss = filenumbar["files"].as_i
      imggnamee = rand(1..filesssss)
      embed = Discord::Embed.new(
        title: "Link",
        url: "#{value[imggnamee]}",
        colour: 0xffff00,
        image: Discord::EmbedImage.new(
          url: "#{value[imggnamee].as_s}"
        )
      )
      client.create_message(payload.channel_id, "", embed)
    rescue
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Error",
        url: "https://granz.geopjr.xyz"
      )
      client.create_message(payload.channel_id, "", embed)
    end
  end
end
# Change my mind wand
client.on_message_create do |payload|
  next if payload.author.bot
  if (payload.content.starts_with? PREFIX[0] + "changemymind") || (payload.content.starts_with? PREFIX[1] + "changemymind") || (payload.content.starts_with? PREFIX[2] + "changemymind") || (payload.content.starts_with? PREFIX[3] + "changemymind") || (payload.content.starts_with? PREFIX[4] + "changemymind")
    pres = payload.content.gsub("<@443053627419000833> ", "<@443053627419000833>").gsub("<@!443053627419000833> ", "<@!443053627419000833>")
    argscount = pres.split(" ")

    argss = pres.gsub("changemymind ", "").gsub("<@443053627419000833> ", "").gsub("<@443053627419000833>", "").gsub("<@!443053627419000833>", "").gsub("<@!443053627419000833> ", "").gsub("--", "")
    ###
    ###
    imggnamee = rand(1..1650)
    if argss.size < 13
      LibMagick.magickWandGenesis
      m_wand = LibMagick.newMagickWand
      d_wand = LibMagick.newDrawingWand
      p_wand = LibMagick.newPixelWand

      if LibMagick.magickReadImage(m_wand, "changemymind.png")
        LibMagick.pixelSetColor p_wand, "black"
        LibMagick.drawSetFillColor d_wand, p_wand
        LibMagick.drawSetFont d_wand, "Verdana-Bold"
        LibMagick.drawSetFontSize d_wand, 40
        LibMagick.drawSetTextAntialias d_wand, true
        LibMagick.drawRotate d_wand, -23
        LibMagick.drawAnnotation d_wand, 220, 450, argss
        LibMagick.magickDrawImage m_wand, d_wand
        LibMagick.magickTrimImage m_wand, 0
        LibMagick.magickWriteImage m_wand, "#{imggnamee}.png"
      end
      LibMagick.destroyPixelWand p_wand
      LibMagick.destroyDrawingWand d_wand
      LibMagick.destroyMagickWand m_wand
      LibMagick.magickWandTerminus
      client.upload_file(payload.channel_id, "", File.open("#{imggnamee}.png", "r"))
      File.delete("./#{imggnamee}.png")
    elsif (argss.size >= 13) && (argss.size < 25)
      LibMagick.magickWandGenesis
      m_wand = LibMagick.newMagickWand
      d_wand = LibMagick.newDrawingWand
      p_wand = LibMagick.newPixelWand
      if LibMagick.magickReadImage(m_wand, "changemymind.png")
        LibMagick.pixelSetColor p_wand, "black"
        LibMagick.drawSetFillColor d_wand, p_wand
        LibMagick.drawSetFont d_wand, "Verdana-Bold"
        LibMagick.drawSetFontSize d_wand, 20
        LibMagick.drawSetTextAntialias d_wand, true
        LibMagick.drawRotate d_wand, -23
        LibMagick.drawAnnotation d_wand, 220, 450, argss
        LibMagick.magickDrawImage m_wand, d_wand
        LibMagick.magickTrimImage m_wand, 0
        LibMagick.magickWriteImage m_wand, "#{imggnamee}.png"
      end
      LibMagick.destroyPixelWand p_wand
      LibMagick.destroyDrawingWand d_wand
      LibMagick.destroyMagickWand m_wand
      LibMagick.magickWandTerminus
      client.upload_file(payload.channel_id, "", File.open("#{imggnamee}.png", "r"))
      File.delete("./#{imggnamee}.png")
    elsif (argss.size >= 25) && (argss.size < 39)
      LibMagick.magickWandGenesis
      m_wand = LibMagick.newMagickWand
      d_wand = LibMagick.newDrawingWand
      p_wand = LibMagick.newPixelWand
      if LibMagick.magickReadImage(m_wand, "changemymind.png")
        LibMagick.pixelSetColor p_wand, "black"
        LibMagick.drawSetFillColor d_wand, p_wand
        LibMagick.drawSetFont d_wand, "Verdana-Bold"
        LibMagick.drawSetFontSize d_wand, 10
        LibMagick.drawSetTextAntialias d_wand, true
        LibMagick.drawRotate d_wand, -23
        LibMagick.drawAnnotation d_wand, 220, 450, argss
        LibMagick.magickDrawImage m_wand, d_wand
        LibMagick.magickTrimImage m_wand, 0
        LibMagick.magickWriteImage m_wand, "#{imggnamee}.png"
      end
      LibMagick.destroyPixelWand p_wand
      LibMagick.destroyDrawingWand d_wand
      LibMagick.destroyMagickWand m_wand
      LibMagick.magickWandTerminus
      client.upload_file(payload.channel_id, "", File.open("#{imggnamee}.png", "r"))
      File.delete("./#{imggnamee}.png")
    else
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Too many characters (1-39)"
      )
      client.create_message(payload.channel_id, "", embed)
    end
    ####
  end
end
# Gay wand
client.on_message_create do |payload|
  next if payload.author.bot
  if (payload.content.starts_with? PREFIX[0] + "gay") || (payload.content.starts_with? PREFIX[1] + "gay") || (payload.content.starts_with? PREFIX[2] + "gay") || (payload.content.starts_with? PREFIX[3] + "gay") || (payload.content.starts_with? PREFIX[4] + "gay")
    pres = payload.content.gsub("<@443053627419000833> ", "<@443053627419000833>").gsub("<@!443053627419000833> ", "<@!443053627419000833>")
    argscount = pres.split(" ")

    argss = pres.gsub("gay ", "").gsub("<@443053627419000833> ", "").gsub("<@443053627419000833>", "").gsub("<@!443053627419000833>", "").gsub("<@!443053627419000833> ", "").gsub("--", "")
    ###

    if argscount.size > 2
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Too many arguments"
      )
      client.create_message(payload.channel_id, "", embed)
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
          LibMagick.magickReadImage wand2, "gay.png"
          LibMagick.magickReadImage wand1, "#{imggnamee}y.jpg"
          LibMagick.magickAdaptiveResizeImage wand1, 1024, 1024
          LibMagick.magickCompositeImage wand1, wand2, LibMagick::CompositeOperator::OverCompositeOp, 0, 0
          LibMagick.magickWriteImage wand1, "gay#{imggnamee}.png"
          LibMagick.destroyMagickWand wand2
          LibMagick.destroyMagickWand wand1
          LibMagick.magickWandTerminus
          client.upload_file(payload.channel_id, "", File.open("gay#{imggnamee}.png", "r"))
          File.delete("./#{imggnamee}y.jpg")
          File.delete("./gay#{imggnamee}.png")
        else
          embed = Discord::Embed.new(
            timestamp: Time.now,
            colour: 0xffff00,
            title: "Mention a user"
          )

          client.create_message(payload.channel_id, "", embed)
        end
      rescue
        embed = Discord::Embed.new(
          colour: 0xffff00,
          title: "Mention a user"
        )
        client.create_message(payload.channel_id, "", embed)
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
        LibMagick.magickReadImage wand2, "gay.png"
        LibMagick.magickReadImage wand1, "#{imggnamee}y.jpg"
        LibMagick.magickAdaptiveResizeImage wand1, 1024, 1024
        LibMagick.magickCompositeImage wand1, wand2, LibMagick::CompositeOperator::OverCompositeOp, 0, 0
        LibMagick.magickWriteImage wand1, "gay#{imggnamee}.png"
        LibMagick.destroyMagickWand wand2
        LibMagick.destroyMagickWand wand1
        LibMagick.magickWandTerminus
        client.upload_file(payload.channel_id, "", File.open("gay#{imggnamee}.png", "r"))
        File.delete("./#{imggnamee}y.jpg")
        File.delete("./gay#{imggnamee}.png")
      rescue
        embed = Discord::Embed.new(
          colour: 0xffff00,
          title: "Mention a user"
        )
        client.create_message(payload.channel_id, "", embed)
      end
    end
  end
end
# Imgtanki
client.on_message_create do |payload|
  next if payload.author.bot
  if (payload.content.starts_with? PREFIX[0] + "imgtanki") || (payload.content.starts_with? PREFIX[1] + "imgtanki") || (payload.content.starts_with? PREFIX[2] + "imgtanki") || (payload.content.starts_with? PREFIX[3] + "imgtanki") || (payload.content.starts_with? PREFIX[4] + "imgtanki")
    pres = payload.content.gsub("<@443053627419000833> ", "<@443053627419000833>").gsub("<@!443053627419000833> ", "<@!443053627419000833>")
    argscount = pres.split(" ")
    if argscount.size > 2
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Too many arguments"
      )
      client.create_message(payload.channel_id, "", embed)
    elsif argscount.size > 1
      argss = pres.gsub("imgtanki ", "").gsub("<@443053627419000833> ", "").gsub("<@443053627419000833>", "").gsub("<@!443053627419000833>", "").gsub("<@!443053627419000833> ", "").gsub("--", "")
      begin
        response = HTTP::Client.get "-"
        value = JSON.parse(response.body)
        imggnamee = rand(1..1650)
        LibMagick.magickWandGenesis
        m_wand = LibMagick.newMagickWand
        wand_rank = LibMagick.newMagickWand
        wand_author = LibMagick.newMagickWand
        d_wand = LibMagick.newDrawingWand
        p_wand = LibMagick.newPixelWand
        pp_wand = LibMagick.newPixelWand
        if LibMagick.magickReadImage(m_wand, "taaan.jpg")
          LibMagick.pixelSetColor p_wand, "white"
          LibMagick.drawSetFillColor d_wand, p_wand
          LibMagick.magickReadImage wand_rank, "#{value["rank_img"]}"
          LibMagick.magickReadImage wand_author, "https://cdn.discordapp.com/avatars/#{payload.author.id}/#{payload.author.avatar}.jpg?size=32"
          LibMagick.drawSetFont d_wand, "Arial-Bold"
          LibMagick.drawSetFontSize d_wand, 40
          LibMagick.drawSetTextAntialias d_wand, true
          LibMagick.magickCompositeImage wand_rank, m_wand, LibMagick::CompositeOperator::OverCompositeOp, 0, 0
          LibMagick.magickCompositeImage wand_author, m_wand, LibMagick::CompositeOperator::OverCompositeOp, 0, 1196
          LibMagick.drawSetTextAlignment d_wand, LibMagick::AlignType::LeftAlign
          LibMagick.drawSetFontSize d_wand, 25
          LibMagick.drawSetStrokeWidth d_wand, 0
          LibMagick.drawSetStrokeAntialias d_wand, false
          LibMagick.drawSetFont d_wand, "Tahoma"
          LibMagick.drawAnnotation d_wand, 50, 1190, "Requested By: #{payload.author.username}##{payload.author.discriminator} | https://ratings.geopjr.xyz/"
          LibMagick.magickDrawImage m_wand, d_wand
          LibMagick.drawSetTextAlignment d_wand, LibMagick::AlignType::CenterAlign
          LibMagick.drawSetFontSize d_wand, 40
          LibMagick.drawSetFont d_wand, "Arial-Bold"
          LibMagick.drawAnnotation d_wand, 500, 50, "#{value["name"]}"
          LibMagick.magickDrawImage m_wand, d_wand
          LibMagick.drawSetFontSize d_wand, 35
          LibMagick.pixelSetColor p_wand, "#3498db"
          LibMagick.drawAnnotation d_wand, 500, 100, "#{value["rank"]}"
          LibMagick.magickDrawImage m_wand, d_wand
          LibMagick.drawSetFontSize d_wand, 35
          LibMagick.drawAnnotation d_wand, 500, 150, "Playtime: #{value["timePlayed"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}"
          LibMagick.magickDrawImage m_wand, d_wand
          LibMagick.drawSetFontSize d_wand, 25
          LibMagick.pixelSetColor p_wand, "#3498db"
          LibMagick.drawAnnotation d_wand, 750, 250, "Resistance Modules:"
          LibMagick.magickDrawImage m_wand, d_wand
          LibMagick.drawSetFontSize d_wand, 25
          LibMagick.pixelSetColor p_wand, "white"
          LibMagick.drawAnnotation d_wand, 750, 290, "#{value["resistanceModules"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}"
          LibMagick.magickDrawImage m_wand, d_wand
          LibMagick.drawSetFontSize d_wand, 25
          LibMagick.pixelSetColor p_wand, "#3498db"
          LibMagick.drawAnnotation d_wand, 750, 330, "Turrets Played:"
          LibMagick.magickDrawImage m_wand, d_wand
          LibMagick.pixelSetColor p_wand, "white"
          LibMagick.drawSetFontSize d_wand, 25
          LibMagick.drawAnnotation d_wand, 750, 370, "#{value["turretsPlayed"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}"
          LibMagick.magickDrawImage m_wand, d_wand
          LibMagick.drawSetFontSize d_wand, 25
          LibMagick.pixelSetColor p_wand, "#3498db"
          LibMagick.drawAnnotation d_wand, 750, 410, "Mines Used:"
          LibMagick.magickDrawImage m_wand, d_wand
          LibMagick.pixelSetColor p_wand, "white"
          LibMagick.drawSetFontSize d_wand, 25
          LibMagick.drawAnnotation d_wand, 750, 450, "#{value["supplies"]["Mine"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}"
          LibMagick.magickDrawImage m_wand, d_wand
          LibMagick.drawSetFontSize d_wand, 25
          LibMagick.pixelSetColor p_wand, "#3498db"
          LibMagick.drawAnnotation d_wand, 750, 490, "Repair Kits Used:"
          LibMagick.magickDrawImage m_wand, d_wand
          LibMagick.pixelSetColor p_wand, "white"
          LibMagick.drawSetFontSize d_wand, 25
          LibMagick.drawAnnotation d_wand, 750, 530, "#{value["supplies"]["Repair Kit"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}"
          LibMagick.magickDrawImage m_wand, d_wand
          LibMagick.drawSetFontSize d_wand, 25
          LibMagick.pixelSetColor p_wand, "#3498db"
          LibMagick.drawAnnotation d_wand, 750, 570, "Gold Boxes Used:"
          LibMagick.magickDrawImage m_wand, d_wand
          LibMagick.pixelSetColor p_wand, "white"
          LibMagick.drawSetFontSize d_wand, 25
          LibMagick.drawAnnotation d_wand, 750, 610, "#{value["supplies"]["Gold box"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}"
          LibMagick.magickDrawImage m_wand, d_wand
          LibMagick.drawSetFontSize d_wand, 25
          LibMagick.pixelSetColor p_wand, "#3498db"
          LibMagick.drawAnnotation d_wand, 750, 650, "Double Armors Used:"
          LibMagick.magickDrawImage m_wand, d_wand
          LibMagick.pixelSetColor p_wand, "white"
          LibMagick.drawSetFontSize d_wand, 25
          LibMagick.drawAnnotation d_wand, 750, 690, "#{value["supplies"]["Double Armor"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}"
          LibMagick.magickDrawImage m_wand, d_wand
          LibMagick.pixelSetColor p_wand, "#3498db"
          LibMagick.drawSetFontSize d_wand, 25
          LibMagick.drawAnnotation d_wand, 750, 730, "Speed Boosts Used:"
          LibMagick.magickDrawImage m_wand, d_wand
          LibMagick.pixelSetColor p_wand, "white"
          LibMagick.drawSetFontSize d_wand, 25
          LibMagick.drawAnnotation d_wand, 750, 770, "#{value["supplies"]["Speed Boost"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}"
          LibMagick.magickDrawImage m_wand, d_wand
          LibMagick.drawSetFontSize d_wand, 25
          LibMagick.pixelSetColor p_wand, "#3498db"
          LibMagick.drawAnnotation d_wand, 750, 810, "Double Damage Used:"
          LibMagick.magickDrawImage m_wand, d_wand
          LibMagick.pixelSetColor p_wand, "white"
          LibMagick.drawSetFontSize d_wand, 25
          LibMagick.drawAnnotation d_wand, 750, 850, "#{value["supplies"]["Double Damage"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}"
          LibMagick.magickDrawImage m_wand, d_wand
          LibMagick.drawSetFontSize d_wand, 25
          LibMagick.pixelSetColor p_wand, "#3498db"
          LibMagick.drawAnnotation d_wand, 750, 890, "Batteries Used:"
          LibMagick.magickDrawImage m_wand, d_wand
          LibMagick.pixelSetColor p_wand, "white"
          LibMagick.drawSetFontSize d_wand, 25
          LibMagick.drawAnnotation d_wand, 750, 930, "#{value["supplies"]["Battery"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}"
          LibMagick.magickDrawImage m_wand, d_wand
          LibMagick.drawSetFontSize d_wand, 25
          LibMagick.pixelSetColor p_wand, "#3498db"
          LibMagick.drawAnnotation d_wand, 750, 970, "Total:"
          LibMagick.magickDrawImage m_wand, d_wand
          LibMagick.drawSetFontSize d_wand, 25
          LibMagick.pixelSetColor p_wand, "white"
          LibMagick.drawAnnotation d_wand, 750, 1010, "#{value["supplies"]["totalUsages"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}"
          LibMagick.magickDrawImage m_wand, d_wand
          LibMagick.drawSetFontSize d_wand, 25
          LibMagick.pixelSetColor p_wand, "#3498db"
          LibMagick.drawAnnotation d_wand, 250, 250, "EXP:"
          LibMagick.magickDrawImage m_wand, d_wand
          LibMagick.drawSetFontSize d_wand, 25
          LibMagick.pixelSetColor p_wand, "white"
          LibMagick.drawAnnotation d_wand, 250, 290, "#{value["exp"]["exp"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}/#{value["exp"]["expNext"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}"
          LibMagick.magickDrawImage m_wand, d_wand
          LibMagick.pixelSetColor p_wand, "#3498db"
          LibMagick.drawSetFontSize d_wand, 25
          LibMagick.drawAnnotation d_wand, 250, 330, "EXP Left:"
          LibMagick.magickDrawImage m_wand, d_wand
          LibMagick.drawSetFontSize d_wand, 25
          LibMagick.pixelSetColor p_wand, "white"
          LibMagick.drawAnnotation d_wand, 250, 370, "#{value["exp"]["expLeft"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse} exp"
          LibMagick.magickDrawImage m_wand, d_wand
          LibMagick.drawSetFontSize d_wand, 25
          LibMagick.pixelSetColor p_wand, "#3498db"
          LibMagick.drawAnnotation d_wand, 250, 410, "Golds Caught:"
          LibMagick.magickDrawImage m_wand, d_wand
          LibMagick.drawSetFontSize d_wand, 25
          LibMagick.pixelSetColor p_wand, "white"
          LibMagick.drawAnnotation d_wand, 250, 450, "#{value["golds"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}"
          LibMagick.magickDrawImage m_wand, d_wand
          LibMagick.pixelSetColor p_wand, "#3498db"
          LibMagick.drawSetFontSize d_wand, 25
          LibMagick.drawAnnotation d_wand, 250, 490, "Crystals:"
          LibMagick.magickDrawImage m_wand, d_wand
          LibMagick.drawSetFontSize d_wand, 25
          LibMagick.pixelSetColor p_wand, "white"
          LibMagick.drawAnnotation d_wand, 250, 530, "#{value["crystals"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}"
          LibMagick.magickDrawImage m_wand, d_wand
          LibMagick.drawSetFontSize d_wand, 25
          LibMagick.pixelSetColor p_wand, "#3498db"
          LibMagick.drawAnnotation d_wand, 250, 570, "Kills:"
          LibMagick.magickDrawImage m_wand, d_wand
          LibMagick.pixelSetColor p_wand, "white"
          LibMagick.drawSetFontSize d_wand, 25
          LibMagick.drawAnnotation d_wand, 250, 610, "#{value["kills"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}"
          LibMagick.magickDrawImage m_wand, d_wand
          LibMagick.drawSetFontSize d_wand, 25
          LibMagick.pixelSetColor p_wand, "#3498db"
          LibMagick.drawAnnotation d_wand, 250, 650, "Deaths:"
          LibMagick.magickDrawImage m_wand, d_wand
          LibMagick.drawSetFontSize d_wand, 25
          LibMagick.pixelSetColor p_wand, "white"
          LibMagick.drawAnnotation d_wand, 250, 690, "#{value["deaths"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}"
          LibMagick.magickDrawImage m_wand, d_wand
          LibMagick.drawSetFontSize d_wand, 25
          LibMagick.pixelSetColor p_wand, "#3498db"
          LibMagick.drawAnnotation d_wand, 250, 730, "K/D:"
          LibMagick.magickDrawImage m_wand, d_wand
          LibMagick.drawSetFontSize d_wand, 25
          LibMagick.pixelSetColor p_wand, "white"
          LibMagick.drawAnnotation d_wand, 250, 770, "#{value["kd_ratio"]}"
          LibMagick.magickDrawImage m_wand, d_wand
          LibMagick.pixelSetColor p_wand, "#3498db"
          LibMagick.drawSetFontSize d_wand, 25
          LibMagick.drawAnnotation d_wand, 250, 810, "Efficiency Rating Place | Value:"
          LibMagick.magickDrawImage m_wand, d_wand
          LibMagick.pixelSetColor p_wand, "white"
          LibMagick.drawSetFontSize d_wand, 25
          LibMagick.drawAnnotation d_wand, 250, 850, "#{value["rating"]["efficiency"]["position"]["now"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse} | #{value["rating"]["efficiency"]["value"]["now"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}"
          LibMagick.magickDrawImage m_wand, d_wand
          LibMagick.pixelSetColor p_wand, "#3498db"
          LibMagick.drawSetFontSize d_wand, 25
          LibMagick.drawAnnotation d_wand, 250, 890, "Experience Rating Place | Value:"
          LibMagick.magickDrawImage m_wand, d_wand
          LibMagick.drawSetFontSize d_wand, 25
          LibMagick.pixelSetColor p_wand, "white"
          LibMagick.drawAnnotation d_wand, 250, 930, "#{value["rating"]["experience"]["position"]["now"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse} | #{value["rating"]["experience"]["value"]["now"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}"
          LibMagick.magickDrawImage m_wand, d_wand
          LibMagick.drawSetFontSize d_wand, 25
          LibMagick.pixelSetColor p_wand, "#3498db"
          LibMagick.drawAnnotation d_wand, 250, 970, "Gold Box Rating Place | Value:"
          LibMagick.magickDrawImage m_wand, d_wand
          LibMagick.drawSetFontSize d_wand, 25
          LibMagick.pixelSetColor p_wand, "white"
          LibMagick.drawAnnotation d_wand, 250, 1010, "#{value["rating"]["golds"]["position"]["now"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse} | #{value["rating"]["golds"]["value"]["now"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}"
          LibMagick.magickDrawImage m_wand, d_wand
          LibMagick.drawSetFontSize d_wand, 25
          LibMagick.pixelSetColor p_wand, "#3498db"
          LibMagick.drawAnnotation d_wand, 250, 1050, "Crystals Rating Place | Value:"
          LibMagick.magickDrawImage m_wand, d_wand
          LibMagick.pixelSetColor p_wand, "white"
          LibMagick.drawSetFontSize d_wand, 25
          LibMagick.drawAnnotation d_wand, 250, 1090, "#{value["rating"]["crystals"]["position"]["now"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse} | #{value["rating"]["crystals"]["value"]["now"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}"
          LibMagick.magickDrawImage m_wand, d_wand
          LibMagick.magickTrimImage m_wand, 0
          LibMagick.magickWriteImage m_wand, "#{imggnamee}tanki.png"
        end
        LibMagick.destroyPixelWand p_wand
        LibMagick.destroyPixelWand pp_wand
        LibMagick.destroyDrawingWand d_wand
        LibMagick.destroyMagickWand m_wand
        LibMagick.destroyMagickWand wand_rank
        LibMagick.destroyMagickWand wand_author
        LibMagick.magickWandTerminus
        client.upload_file(payload.channel_id, "", File.open("#{imggnamee}tanki.png", "r"))
        File.delete("./#{imggnamee}tanki.png")
      rescue
        embed = Discord::Embed.new(
          colour: 0xffff00,
          title: "I am afraid there is not such user in existance"
        )
        client.create_message(payload.channel_id, "", embed)
      end
    else
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Too few arguments"
      )
      client.create_message(payload.channel_id, "", embed)
    end
  end
end
# okbyemom wand
client.on_message_create do |payload|
  next if payload.author.bot
  if (payload.content.starts_with? PREFIX[0] + "okbyemom") || (payload.content.starts_with? PREFIX[1] + "okbyemom") || (payload.content.starts_with? PREFIX[2] + "okbyemom") || (payload.content.starts_with? PREFIX[3] + "okbyemom") || (payload.content.starts_with? PREFIX[4] + "okbyemom")
    pres = payload.content.gsub("<@443053627419000833> ", "<@443053627419000833>").gsub("<@!443053627419000833> ", "<@!443053627419000833>")
    argscount = pres.split(" ")
    begin
      argss = pres.gsub("okbyemom ", "").gsub("okbyemom", "").gsub("<@443053627419000833> ", "").gsub("<@443053627419000833>", "").gsub("<@!443053627419000833>", "").gsub("<@!443053627419000833> ", "").gsub("--", "")
      ###
      ###
      imggnamee = rand(1..1650)

      LibMagick.magickWandGenesis
      m_wand = LibMagick.newMagickWand
      d_wand = LibMagick.newDrawingWand
      p_wand = LibMagick.newPixelWand

      if LibMagick.magickReadImage(m_wand, "okbyemom.png")
        LibMagick.pixelSetColor p_wand, "black"
        LibMagick.drawSetFillColor d_wand, p_wand
        LibMagick.drawSetFont d_wand, "Verdana-Bold"
        LibMagick.drawSetFontSize d_wand, 20
        LibMagick.drawSetTextAntialias d_wand, true
        LibMagick.drawRotate d_wand, -23
        LibMagick.drawAnnotation d_wand, 75, 653, argss
        LibMagick.magickDrawImage m_wand, d_wand
        LibMagick.magickTrimImage m_wand, 0
        LibMagick.magickWriteImage m_wand, "#{imggnamee}xx.png"
      end
      LibMagick.destroyPixelWand p_wand
      LibMagick.destroyDrawingWand d_wand
      LibMagick.destroyMagickWand m_wand
      LibMagick.magickWandTerminus
      client.upload_file(payload.channel_id, "", File.open("#{imggnamee}xx.png", "r"))
      File.delete("./#{imggnamee}xx.png")
    rescue
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Can't be empty"
      )
      client.create_message(payload.channel_id, "", embed)
    end

    ####
  end
end

# DDG
client.on_message_create do |payload|
  next if payload.author.bot
  if (payload.content.starts_with? PREFIX[0] + "ddg") || (payload.content.starts_with? PREFIX[1] + "ddg") || (payload.content.starts_with? PREFIX[2] + "ddg") || (payload.content.starts_with? PREFIX[3] + "ddg") || (payload.content.starts_with? PREFIX[4] + "ddg")
    pres = payload.content.gsub("<@443053627419000833> ", "<@443053627419000833>").gsub("<@!443053627419000833> ", "<@!443053627419000833>")
    argscount = pres.split(" ")
    if argscount.size > 1
      argss = pres.gsub("ddg", "").split(" ")
      argsss = argss.delete_at(0)
      args = argss.join("%20")
      begin
        embed = Discord::Embed.new(
          timestamp: Time.now,
          colour: 0xffff00,
          title: "<http://duckduckgo.com/#{args}?ia=web>",
          description: "Replying to: <@#{payload.author.id}>"
        )
        client.create_message(payload.channel_id, "", embed)
      rescue
        embed = Discord::Embed.new(
          colour: 0xffff00,
          title: "Error",
          url: "https://granz.geopjr.xyz"
        )
        client.create_message(payload.channel_id, "", embed)
      end
    else
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Too few arguments"
      )
      client.create_message(payload.channel_id, "", embed)
    end
  end
end
# google
client.on_message_create do |payload|
  next if payload.author.bot
  if (payload.content.starts_with? PREFIX[0] + "google") || (payload.content.starts_with? PREFIX[1] + "google") || (payload.content.starts_with? PREFIX[2] + "google") || (payload.content.starts_with? PREFIX[3] + "google") || (payload.content.starts_with? PREFIX[4] + "google")
    pres = payload.content.gsub("<@443053627419000833> ", "<@443053627419000833>").gsub("<@!443053627419000833> ", "<@!443053627419000833>")
    argscount = pres.split(" ")
    if argscount.size > 1
      argss = pres.gsub("google", "").split(" ")
      argsss = argss.delete_at(0)
      args = argss.join("+")
      begin
        embed = Discord::Embed.new(
          timestamp: Time.now,
          colour: 0xffff00,
          title: "<https://www.google.com/search?q=#{args}>",
          description: "Replying to: <@#{payload.author.id}>"
        )
        client.create_message(payload.channel_id, "", embed)
      rescue
        embed = Discord::Embed.new(
          colour: 0xffff00,
          title: "Error",
          url: "https://granz.geopjr.xyz"
        )
        client.create_message(payload.channel_id, "", embed)
      end
    else
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Too few arguments"
      )
      client.create_message(payload.channel_id, "", embed)
    end
  end
end

# LMGTFY
client.on_message_create do |payload|
  next if payload.author.bot
  if (payload.content.starts_with? PREFIX[0] + "lmgtfy") || (payload.content.starts_with? PREFIX[1] + "lmgtfy") || (payload.content.starts_with? PREFIX[2] + "lmgtfy") || (payload.content.starts_with? PREFIX[3] + "lmgtfy") || (payload.content.starts_with? PREFIX[4] + "lmgtfy")
    pres = payload.content.gsub("<@443053627419000833> ", "<@443053627419000833>").gsub("<@!443053627419000833> ", "<@!443053627419000833>")
    argscount = pres.split(" ")
    if argscount.size > 1
      argss = pres.gsub("lmgtfy", "").split(" ")
      argsss = argss.delete_at(0)
      args = argss.join("+")
      begin
        embed = Discord::Embed.new(
          timestamp: Time.now,
          colour: 0xffff00,
          title: "<http://lmgtfy.com/?q=#{args}>",
          description: "Replying to: <@#{payload.author.id}>"
        )
        client.create_message(payload.channel_id, "", embed)
      rescue
        embed = Discord::Embed.new(
          colour: 0xffff00,
          title: "Error",
          url: "https://granz.geopjr.xyz"
        )
        client.create_message(payload.channel_id, "", embed)
      end
    else
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Too few arguments"
      )
      client.create_message(payload.channel_id, "", embed)
    end
  end
end

# Avatar
client.on_message_create do |payload|
  next if payload.author.bot
  if (payload.content.starts_with? PREFIX[0] + "avatar") || (payload.content.starts_with? PREFIX[1] + "avatar") || (payload.content.starts_with? PREFIX[2] + "avatar") || (payload.content.starts_with? PREFIX[3] + "avatar") || (payload.content.starts_with? PREFIX[4] + "avatar")
    pres = payload.content.gsub("<@443053627419000833> ", "<@443053627419000833>").gsub("<@!443053627419000833> ", "<@!443053627419000833>")
    argscount = pres.split(" ")
    if argscount.size > 2
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Too many arguments"
      )
      client.create_message(payload.channel_id, "", embed)
    elsif argscount.size > 1
      mentioned_user = payload.mentions
      begin
        if (mentioned_user[0] == payload.author) || (mentioned_user[0] != payload.author)
          embed = Discord::Embed.new(
            timestamp: Time.now,
            colour: 0xffff00,
            image: Discord::EmbedImage.new(
              url: "https://cdn.discordapp.com/avatars/#{mentioned_user[0].id}/#{mentioned_user[0].avatar}.webp?size=1024"
            )
          )
        else
          embed = Discord::Embed.new(
            timestamp: Time.now,
            colour: 0xffff00,
            title: "Mention a user"
          )
        end
        client.create_message(payload.channel_id, "", embed)
      rescue
        embed = Discord::Embed.new(
          colour: 0xffff00,
          title: "Mention a user"
        )
        client.create_message(payload.channel_id, "", embed)
      end
    elsif argscount.size == 1
      begin
        embed = Discord::Embed.new(
          timestamp: Time.now,
          colour: 0xffff00,
          image: Discord::EmbedImage.new(
            url: "https://cdn.discordapp.com/avatars/#{payload.author.id}/#{payload.author.avatar}.webp?size=1024"
          )
        )
        client.create_message(payload.channel_id, "", embed)
      rescue
        embed = Discord::Embed.new(
          colour: 0xffff00,
          title: "Error",
          url: "https://granz.geopjr.xyz"
        )
        client.create_message(payload.channel_id, "", embed)
      end
    else
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Too few arguments"
      )
      client.create_message(payload.channel_id, "", embed)
    end
  end
end
# bo4 bo3 iw wwii
client.on_message_create do |payload|
  next if payload.author.bot
  if (payload.content.starts_with? PREFIX[0] + "bo4") || (payload.content.starts_with? PREFIX[1] + "bo4") || (payload.content.starts_with? PREFIX[2] + "bo4") || (payload.content.starts_with? PREFIX[3] + "bo4") || (payload.content.starts_with? PREFIX[4] + "bo4")
    pres = payload.content.gsub("<@443053627419000833> ", "<@443053627419000833>").gsub("<@!443053627419000833> ", "<@!443053627419000833>")
    argscount = pres.split(" ")
    if argscount.size > 3
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Too many arguments"
      )
      client.create_message(payload.channel_id, "", embed)
    elsif argscount.size > 2
      argss = pres.gsub("bo4 ", "").gsub("<@443053627419000833> ", "").gsub("<@443053627419000833>", "").gsub("<@!443053627419000833>", "").gsub("<@!443053627419000833> ", "").gsub("--", "")
      begin
        argsss = argss.split(" ")
        response = HTTP::Client.get "https://bo4tracker.com/api/stats/bo4/#{argsss[0]}/#{argsss[1]}"
        value = JSON.parse(response.body)

        timee = value["stats"]["timeplayed"].as_i / 3600

        embed = Discord::Embed.new(
          title: "#{value["user"]["username"]}",
          timestamp: Time.now,
          colour: 0xffff00,
          thumbnail: Discord::EmbedThumbnail.new(
            url: "#{value["user"]["avatar"]}"
          ),
          author: Discord::EmbedAuthor.new(
            name: "Granz#8561",
            icon_url: "https://cdn.discordapp.com/avatars/443053627419000833/333d3868fa0837e800e6515558fd8179.png"
          ),
          fields: [Discord::EmbedField.new(
            name: "__Identifier__",
            value: "#{value["identifier"]}",
            inline: true
          ),
                   Discord::EmbedField.new(
                     name: "__ID__",
                     value: "#{value["user"]["id"]}",
                     inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__Level__",
                     value: "#{value["stats"]["level"]}"
                   ),
                   Discord::EmbedField.new(
                     name: "__RankXp__",
                     value: "#{value["stats"]["rankxp"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}",
                     inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__Time Played__",
                     value: "#{timee.round(0)} Hours",
                     inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__Kills__",
                     value: "#{value["stats"]["kills"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__Kills Confirmed__",
                     value: "#{value["stats"]["killsconfirmed"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__Kills Denied__",
                     value: "#{value["stats"]["killsdenied"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__Deaths__",
                     value: "#{value["stats"]["deaths"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__Wins__",
                     value: "#{value["stats"]["wins"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__Losses__",
                     value: "#{value["stats"]["losses"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__Hits__",
                     value: "#{value["stats"]["hits"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__Misses__",
                     value: "#{value["stats"]["misses"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                   ),

                   Discord::EmbedField.new(
                     name: "__Total Heals__",
                     value: "#{value["stats"]["totalheals"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__EKIA__",
                     value: "#{value["stats"]["ekia"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__Current Winstreak__",
                     value: "#{value["stats"]["curwinstreak"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__Longest Winstreak__",
                     value: "#{value["stats"]["longestkillstreak"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__Team Kills__",
                     value: "#{value["stats"]["teamkills"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__Suicides__",
                     value: "#{value["stats"]["suicides"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__Offends__",
                     value: "#{value["stats"]["offends"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__Captures__",
                     value: "#{value["stats"]["captures"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                   ),

                   Discord::EmbedField.new(
                     name: "__Defends__",
                     value: "#{value["stats"]["defends"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                   ),

          ]
        )
        client.create_message(payload.channel_id, "", embed)
      rescue
        embed = Discord::Embed.new(
          colour: 0xffff00,
          title: "I am afraid there is not such user in existance",
          description: "Try a different platform (psn/xbl/steam)"
        )
        client.create_message(payload.channel_id, "", embed)
      end
    else
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Too few arguments",
        description: "Platforms (psn/xbl/steam)"
      )
      client.create_message(payload.channel_id, "", embed)
    end
  end
end

client.on_message_create do |payload|
  next if payload.author.bot
  if (payload.content.starts_with? PREFIX[0] + "bo3") || (payload.content.starts_with? PREFIX[1] + "bo3") || (payload.content.starts_with? PREFIX[2] + "bo3") || (payload.content.starts_with? PREFIX[3] + "bo3") || (payload.content.starts_with? PREFIX[4] + "bo3")
    pres = payload.content.gsub("<@443053627419000833> ", "<@443053627419000833>").gsub("<@!443053627419000833> ", "<@!443053627419000833>")
    argscount = pres.split(" ")
    if argscount.size > 3
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Too many arguments"
      )
      client.create_message(payload.channel_id, "", embed)
    elsif argscount.size > 2
      argss = pres.gsub("bo3 ", "").gsub("<@443053627419000833> ", "").gsub("<@443053627419000833>", "").gsub("<@!443053627419000833>", "").gsub("<@!443053627419000833> ", "").gsub("--", "")
      begin
        argsss = argss.split(" ")
        response = HTTP::Client.get "https://bo4tracker.com/api/stats/bo3/#{argsss[0]}/#{argsss[1]}"
        value = JSON.parse(response.body)

        timee = value["stats"]["timeplayed"].as_i / 3600

        embed = Discord::Embed.new(
          title: "#{value["user"]["username"]}",
          timestamp: Time.now,
          colour: 0xffff00,
          thumbnail: Discord::EmbedThumbnail.new(
            url: "#{value["user"]["avatar"]}"
          ),
          author: Discord::EmbedAuthor.new(
            name: "Granz#8561",
            icon_url: "https://cdn.discordapp.com/avatars/443053627419000833/333d3868fa0837e800e6515558fd8179.png"
          ),
          fields: [Discord::EmbedField.new(
            name: "__Identifier__",
            value: "#{value["identifier"]}",
            inline: true
          ),
                   Discord::EmbedField.new(
                     name: "__ID__",
                     value: "#{value["user"]["id"]}",
                     inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__Level__",
                     value: "#{value["stats"]["level"]}"
                   ),
                   Discord::EmbedField.new(
                     name: "__RankXp__",
                     value: "#{value["stats"]["rankxp"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}",
                     inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__Time Played__",
                     value: "#{timee.round(0)} Hours",
                     inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__Kills__",
                     value: "#{value["stats"]["kills"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__Kills Confirmed__",
                     value: "#{value["stats"]["killsconfirmed"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__Kills Denied__",
                     value: "#{value["stats"]["killsdenied"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__Deaths__",
                     value: "#{value["stats"]["deaths"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__Wins__",
                     value: "#{value["stats"]["wins"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__Losses__",
                     value: "#{value["stats"]["losses"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__Hits__",
                     value: "#{value["stats"]["hits"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__Misses__",
                     value: "#{value["stats"]["misses"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                   ),

                   Discord::EmbedField.new(
                     name: "__Total Heals__",
                     value: "#{value["stats"]["totalheals"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__EKIA__",
                     value: "#{value["stats"]["ekia"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__Current Winstreak__",
                     value: "#{value["stats"]["curwinstreak"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__Longest Winstreak__",
                     value: "#{value["stats"]["longestkillstreak"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__Team Kills__",
                     value: "#{value["stats"]["teamkills"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__Suicides__",
                     value: "#{value["stats"]["suicides"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__Offends__",
                     value: "#{value["stats"]["offends"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__Captures__",
                     value: "#{value["stats"]["captures"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                   ),

                   Discord::EmbedField.new(
                     name: "__Defends__",
                     value: "#{value["stats"]["defends"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                   ),

          ]
        )
        client.create_message(payload.channel_id, "", embed)
      rescue
        embed = Discord::Embed.new(
          colour: 0xffff00,
          title: "I am afraid there is not such user in existance",
          description: "Try a different platform (psn/xbl/steam)"
        )
        client.create_message(payload.channel_id, "", embed)
      end
    else
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Too few arguments",
        description: "Platforms (psn/xbl/steam)"
      )
      client.create_message(payload.channel_id, "", embed)
    end
  end
end

client.on_message_create do |payload|
  next if payload.author.bot
  if (payload.content.starts_with? PREFIX[0] + "wwii") || (payload.content.starts_with? PREFIX[1] + "wwii") || (payload.content.starts_with? PREFIX[2] + "wwii") || (payload.content.starts_with? PREFIX[3] + "wwii") || (payload.content.starts_with? PREFIX[4] + "wwii")
    pres = payload.content.gsub("<@443053627419000833> ", "<@443053627419000833>").gsub("<@!443053627419000833> ", "<@!443053627419000833>")
    argscount = pres.split(" ")
    if argscount.size > 3
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Too many arguments"
      )
      client.create_message(payload.channel_id, "", embed)
    elsif argscount.size > 2
      argss = pres.gsub("wwii ", "").gsub("<@443053627419000833> ", "").gsub("<@443053627419000833>", "").gsub("<@!443053627419000833>", "").gsub("<@!443053627419000833> ", "").gsub("--", "")
      begin
        argsss = argss.split(" ")
        response = HTTP::Client.get "https://bo4tracker.com/api/stats/wwii/#{argsss[0]}/#{argsss[1]}"
        value = JSON.parse(response.body)

        timee = value["stats"]["timeplayed"].as_i / 3600

        embed = Discord::Embed.new(
          title: "#{value["user"]["username"]}",
          timestamp: Time.now,
          colour: 0xffff00,
          thumbnail: Discord::EmbedThumbnail.new(
            url: "#{value["user"]["avatar"]}"
          ),
          author: Discord::EmbedAuthor.new(
            name: "Granz#8561",
            icon_url: "https://cdn.discordapp.com/avatars/443053627419000833/333d3868fa0837e800e6515558fd8179.png"
          ),
          fields: [Discord::EmbedField.new(
            name: "__Identifier__",
            value: "#{value["identifier"]}",
            inline: true
          ),
                   Discord::EmbedField.new(
                     name: "__ID__",
                     value: "#{value["user"]["id"]}",
                     inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__Level__",
                     value: "#{value["stats"]["level"]}"
                   ),
                   Discord::EmbedField.new(
                     name: "__RankXp__",
                     value: "#{value["stats"]["rankxp"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}",
                     inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__Time Played__",
                     value: "#{timee.round(0)} Hours",
                     inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__Kills__",
                     value: "#{value["stats"]["kills"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__Kills Confirmed__",
                     value: "#{value["stats"]["killsconfirmed"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__Kills Denied__",
                     value: "#{value["stats"]["killsdenied"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__Deaths__",
                     value: "#{value["stats"]["deaths"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__Wins__",
                     value: "#{value["stats"]["wins"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__Losses__",
                     value: "#{value["stats"]["losses"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__Hits__",
                     value: "#{value["stats"]["hits"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__Misses__",
                     value: "#{value["stats"]["misses"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                   ),

                   Discord::EmbedField.new(
                     name: "__Total Heals__",
                     value: "#{value["stats"]["totalheals"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__EKIA__",
                     value: "#{value["stats"]["ekia"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__Current Winstreak__",
                     value: "#{value["stats"]["curwinstreak"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__Longest Winstreak__",
                     value: "#{value["stats"]["longestkillstreak"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__Team Kills__",
                     value: "#{value["stats"]["teamkills"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__Suicides__",
                     value: "#{value["stats"]["suicides"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__Offends__",
                     value: "#{value["stats"]["offends"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__Captures__",
                     value: "#{value["stats"]["captures"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                   ),

                   Discord::EmbedField.new(
                     name: "__Defends__",
                     value: "#{value["stats"]["defends"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                   ),

          ]
        )
        client.create_message(payload.channel_id, "", embed)
      rescue
        embed = Discord::Embed.new(
          colour: 0xffff00,
          title: "I am afraid there is not such user in existance",
          description: "Try a different platform (psn/xbl/steam)"
        )
        client.create_message(payload.channel_id, "", embed)
      end
    else
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Too few arguments",
        description: "Platforms (psn/xbl/steam)"
      )
      client.create_message(payload.channel_id, "", embed)
    end
  end
end

client.on_message_create do |payload|
  next if payload.author.bot
  if (payload.content.starts_with? PREFIX[0] + "iw") || (payload.content.starts_with? PREFIX[1] + "iw") || (payload.content.starts_with? PREFIX[2] + "iw") || (payload.content.starts_with? PREFIX[3] + "iw") || (payload.content.starts_with? PREFIX[4] + "iw")
    pres = payload.content.gsub("<@443053627419000833> ", "<@443053627419000833>").gsub("<@!443053627419000833> ", "<@!443053627419000833>")
    argscount = pres.split(" ")
    if argscount.size > 3
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Too many arguments"
      )
      client.create_message(payload.channel_id, "", embed)
    elsif argscount.size > 2
      argss = pres.gsub("iw ", "").gsub("<@443053627419000833> ", "").gsub("<@443053627419000833>", "").gsub("<@!443053627419000833>", "").gsub("<@!443053627419000833> ", "").gsub("--", "")
      begin
        argsss = argss.split(" ")
        response = HTTP::Client.get "https://bo4tracker.com/api/stats/bo3/#{argsss[0]}/#{argsss[1]}"
        value = JSON.parse(response.body)

        timee = value["stats"]["timeplayed"].as_i / 3600

        embed = Discord::Embed.new(
          title: "#{value["user"]["username"]}",
          timestamp: Time.now,
          colour: 0xffff00,
          thumbnail: Discord::EmbedThumbnail.new(
            url: "#{value["user"]["avatar"]}"
          ),
          author: Discord::EmbedAuthor.new(
            name: "Granz#8561",
            icon_url: "https://cdn.discordapp.com/avatars/443053627419000833/333d3868fa0837e800e6515558fd8179.png"
          ),
          fields: [Discord::EmbedField.new(
            name: "__Identifier__",
            value: "#{value["identifier"]}",
            inline: true
          ),
                   Discord::EmbedField.new(
                     name: "__ID__",
                     value: "#{value["user"]["id"]}",
                     inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__Level__",
                     value: "#{value["stats"]["level"]}"
                   ),
                   Discord::EmbedField.new(
                     name: "__RankXp__",
                     value: "#{value["stats"]["rankxp"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}",
                     inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__Time Played__",
                     value: "#{timee.round(0)} Hours",
                     inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__Kills__",
                     value: "#{value["stats"]["kills"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__Kills Confirmed__",
                     value: "#{value["stats"]["killsconfirmed"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__Kills Denied__",
                     value: "#{value["stats"]["killsdenied"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__Deaths__",
                     value: "#{value["stats"]["deaths"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__Wins__",
                     value: "#{value["stats"]["wins"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__Losses__",
                     value: "#{value["stats"]["losses"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__Hits__",
                     value: "#{value["stats"]["hits"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__Misses__",
                     value: "#{value["stats"]["misses"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                   ),

                   Discord::EmbedField.new(
                     name: "__Total Heals__",
                     value: "#{value["stats"]["totalheals"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__EKIA__",
                     value: "#{value["stats"]["ekia"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__Current Winstreak__",
                     value: "#{value["stats"]["curwinstreak"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__Longest Winstreak__",
                     value: "#{value["stats"]["longestkillstreak"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__Team Kills__",
                     value: "#{value["stats"]["teamkills"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__Suicides__",
                     value: "#{value["stats"]["suicides"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__Offends__",
                     value: "#{value["stats"]["offends"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__Captures__",
                     value: "#{value["stats"]["captures"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                   ),

                   Discord::EmbedField.new(
                     name: "__Defends__",
                     value: "#{value["stats"]["defends"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}", inline: true
                   ),

          ]
        )
        client.create_message(payload.channel_id, "", embed)
      rescue
        embed = Discord::Embed.new(
          colour: 0xffff00,
          title: "I am afraid there is not such user in existance",
          description: "Try a different platform (psn/xbl/steam)"
        )
        client.create_message(payload.channel_id, "", embed)
      end
    else
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Too few arguments",
        description: "Platforms (psn/xbl/steam)"
      )
      client.create_message(payload.channel_id, "", embed)
    end
  end
end

# ip locator
# ip
client.on_message_create do |payload|
  next if payload.author.bot
  if (payload.content.starts_with? PREFIX[0] + "ip") || (payload.content.starts_with? PREFIX[1] + "ip") || (payload.content.starts_with? PREFIX[2] + "ip") || (payload.content.starts_with? PREFIX[3] + "ip") || (payload.content.starts_with? PREFIX[4] + "ip")
    pres = payload.content.gsub("<@443053627419000833> ", "<@443053627419000833>").gsub("<@!443053627419000833> ", "<@!443053627419000833>")
    argscount = pres.split(" ")
    if argscount.size > 2
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Too many arguments"
      )
      client.create_message(payload.channel_id, "", embed)
    elsif argscount.size > 1
      acro = pres.gsub("ip ", "").gsub("<@443053627419000833> ", "").gsub("<@443053627419000833>", "").gsub("<@!443053627419000833>", "").gsub("<@!443053627419000833> ", "").gsub("--", "")
      begin
        response = HTTP::Client.get "https://ipvigilante.com/json/#{acro}"
        value = JSON.parse(response.body)
        embed = Discord::Embed.new(
          timestamp: Time.now,
          colour: 0xffff00,
          title: "IP INFO :",
          fields: [Discord::EmbedField.new(
            name: "__ipv4__",
            value: "#{value["data"]["ipv4"]}"
          ),
                   Discord::EmbedField.new(
                     name: "__Continent__",
                     value: "#{value["data"]["continent_name"]}"
                   ),
                   Discord::EmbedField.new(
                     name: "__Country__",
                     value: "#{value["data"]["country_name"]}"
                   ),
                   Discord::EmbedField.new(
                     name: "__Location__",
                     value: "Lat: #{value["data"]["latitude"]}\nLong: #{value["data"]["longitude"]}\nOther:\n#{value["data"]["subdivision_1_name"]}\n#{value["data"]["city_name"]}\n#{value["data"]["subdivision_2_name"]}"
                   ),
          ]
        )
        client.create_message(payload.channel_id, "", embed)
      rescue
        embed = Discord::Embed.new(
          colour: 0xffff00,
          title: "Not found!"
        )
        client.create_message(payload.channel_id, "", embed)
      end
    else
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Too few arguments"
      )
      client.create_message(payload.channel_id, "", embed)
    end
  end
end

# advanced maths
client.on_message_create do |payload|
  next if payload.author.bot
  if (payload.content.starts_with? PREFIX[0] + "maths") || (payload.content.starts_with? PREFIX[1] + "maths") || (payload.content.starts_with? PREFIX[2] + "maths") || (payload.content.starts_with? PREFIX[3] + "maths") || (payload.content.starts_with? PREFIX[4] + "maths")
    pres = payload.content.gsub("<@443053627419000833> ", "<@443053627419000833>").gsub("<@!443053627419000833> ", "<@!443053627419000833>")
    argscount = pres.split(" ")
    if argscount.size > 3
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Too many arguments"
      )
      client.create_message(payload.channel_id, "", embed)
    elsif argscount.size > 2
      acro = pres.gsub("maths ", "").gsub("<@443053627419000833> ", "").gsub("<@443053627419000833>", "").gsub("<@!443053627419000833>", "").gsub("<@!443053627419000833> ", "").gsub("--", "")
      aeee = acro.split(" ")
      aooo = aeee.join(" ").gsub("#{aeee[0]} ", "")
      begin
        response = HTTP::Client.get "https://newton.now.sh/#{aeee[0].downcase}/#{aooo}"
        value = JSON.parse(response.body)
        embed = Discord::Embed.new(
          timestamp: Time.now,
          colour: 0xffff00,
          title: "Advanced Maths:",
          fields: [Discord::EmbedField.new(
            name: "__Operation__",
            value: "#{value["operation"]}"
          ),
                   Discord::EmbedField.new(
                     name: "__Expression__",
                     value: "#{value["expression"]}"
                   ),
                   Discord::EmbedField.new(
                     name: "__Result__",
                     value: "#{value["result"]}"
                   ),
          ]
        )
        client.create_message(payload.channel_id, "", embed)
      rescue
        embed = Discord::Embed.new(
          colour: 0xffff00,
          title: "Usage :",
          description: "--maths <operation> <expression>"
        )
        client.create_message(payload.channel_id, "", embed)
      end
    else
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Too few arguments",
        description: "--maths <operation> <expression>"
      )
      client.create_message(payload.channel_id, "", embed)
    end
  end
end



# tanki
client.on_message_create do |payload|
  next if payload.author.bot
  if (payload.content.starts_with? PREFIX[0] + "tanki") || (payload.content.starts_with? PREFIX[1] + "tanki") || (payload.content.starts_with? PREFIX[2] + "tanki") || (payload.content.starts_with? PREFIX[3] + "tanki") || (payload.content.starts_with? PREFIX[4] + "tanki")
    pres = payload.content.gsub("<@443053627419000833> ", "<@443053627419000833>").gsub("<@!443053627419000833> ", "<@!443053627419000833>")
    argscount = pres.split(" ")
    if argscount.size > 2
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Too many arguments"
      )
      client.create_message(payload.channel_id, "", embed)
    elsif argscount.size > 1
      argss = pres.gsub("tanki ", "").gsub("<@443053627419000833> ", "").gsub("<@443053627419000833>", "").gsub("<@!443053627419000833>", "").gsub("<@!443053627419000833> ", "").gsub("--", "")
      begin
        response = HTTP::Client.get "-"
        value = JSON.parse(response.body)

        if value["premium"] == "No"
          prem = "<:xmark:314349398824058880>"
        else
          value["premium"] == "Yes"
          prem = "<:check:314349398811475968>"
        end

        embed = Discord::Embed.new(
          timestamp: Time.now,
          colour: 0xffff00,
          title: "Stats of #{argss}",
          footer: Discord::EmbedFooter.new(
            text: "\xE3\x80\x8EGeop\xE3\x80\x8F#4066",
            icon_url: "https://cdn.discordapp.com/avatars/216156825978929152/c7eaee00bbe99b16304429fb9b9116ea.png"
          ),
          url: "https://ratings.geopjr.xyz/ratings?name=#{argss}",
          thumbnail: Discord::EmbedThumbnail.new(
            url: "#{value["rank_img"]}"
          ),
          author: Discord::EmbedAuthor.new(
            name: "Granz#8561",
            icon_url: "https://cdn.discordapp.com/avatars/443053627419000833/333d3868fa0837e800e6515558fd8179.png"
          ),
          fields: [Discord::EmbedField.new(
            name: "👨__Name__",
            value: "#{value["name"]}",
            inline: true
          ),
                   Discord::EmbedField.new(
                     name: "🎖️__Rank__",
                     value: "#{value["rank"]}",
                     inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "⏰__Playtime__",
                     value: "#{value["timePlayed"]}",
                     inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "🏅__Premium__",
                     value: "#{prem}",
                     inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "📟__Resistance Modules__",
                     value: "#{value["resistanceModules"]}",
                     inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "🤖__Turrets Played__",
                     value: "#{value["turretsPlayed"]}",
                     inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "⬆️__EXP__",
                     value: "#{value["exp"]["exp"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}/#{value["exp"]["expNext"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}",
                     inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "⬆️__EXP left to rank up__",
                     value: "#{value["exp"]["expLeft"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse} exp",
                     inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "<:GoldBoxIcon:482918640820289546>__Gold Boxes Caught__",
                     value: "#{value["golds"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}",
                     inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "💎__Obtained Crystals__",
                     value: "#{value["crystals"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}",
                     inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "<:DoubleDamageIcon:482918526596939776>__Kills__",
                     value: "#{value["kills"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}",
                     inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "💀__Deaths__",
                     value: "#{value["deaths"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}",
                     inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "⚰️__K/D Ratio__",
                     value: "#{value["kd_ratio"]}",
                     inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "<:DoubleDamageIcon:482918526596939776>__Efficiency Rating Place | Value__",
                     value: "#{value["rating"]["efficiency"]["position"]["now"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse} | #{value["rating"]["efficiency"]["value"]["now"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}",
                     inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "⬆️__Experience Rating Place | Value__",
                     value: "#{value["rating"]["experience"]["position"]["now"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse} | #{value["rating"]["experience"]["value"]["now"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse} #{value["rating"]["experience"]["value"]["arrow"]}",
                     inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "<:GoldBoxIcon:482918640820289546>__Gold Box Rating Place | Value__",
                     value: "#{value["rating"]["golds"]["position"]["now"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse} | #{value["rating"]["golds"]["value"]["now"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse} #{value["rating"]["golds"]["value"]["arrow"]}",
                     inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "💎__Crystals Rating Place | Value__",
                     value: "#{value["rating"]["crystals"]["position"]["now"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse} | #{value["rating"]["crystals"]["value"]["now"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse} #{value["rating"]["crystals"]["value"]["arrow"]}",
                     inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "<:MineIcon:482918544133324812>__Mines Used__",
                     value: "#{value["supplies"]["Mine"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}",
                     inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "<:RepairKitIcon:482918499719708683>__Repair Kits Used__",
                     value: "#{value["supplies"]["Repair Kit"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}",
                     inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "<:GoldBoxIcon:482918640820289546>__Gold Boxes Used__",
                     value: "#{value["supplies"]["Gold box"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}",
                     inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "<:DoubleArmourIcon:482918515834224671>__Double Armors Used__",
                     value: "#{value["supplies"]["Double Armor"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}",
                     inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "<:SpeedBoostIcon:482918535786659842>__Speed Boosts Used__",
                     value: "#{value["supplies"]["Speed Boost"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}",
                     inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "<:DoubleDamageIcon:482918526596939776>__Double Damage Used__",
                     value: "#{value["supplies"]["Double Damage"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}",
                     inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "<:DroneIcon:482918650102415380>__Batteries Used__",
                     value: "#{value["supplies"]["Battery"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}",
                     inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "<:calculator:482936199455965185>__Total__",
                     value: "#{value["supplies"]["totalUsages"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}",
                     inline: true
                   ),
          ]
        )
        client.create_message(payload.channel_id, "", embed)
      rescue
        embed = Discord::Embed.new(
          colour: 0xffff00,
          title: "I am afraid there is not such user in existance"
        )
        client.create_message(payload.channel_id, "", embed)
      end
    else
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Too few arguments"
      )
      client.create_message(payload.channel_id, "", embed)
    end
  end
end

# acronym
client.on_message_create do |payload|
  next if payload.author.bot
  if (payload.content.starts_with? PREFIX[0] + "acronym") || (payload.content.starts_with? PREFIX[1] + "acronym") || (payload.content.starts_with? PREFIX[2] + "acronym") || (payload.content.starts_with? PREFIX[3] + "acronym") || (payload.content.starts_with? PREFIX[4] + "acronym")
    pres = payload.content.gsub("<@443053627419000833> ", "<@443053627419000833>").gsub("<@!443053627419000833> ", "<@!443053627419000833>")
    argscount = pres.split(" ")
    if argscount.size > 2
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Too many arguments"
      )
      client.create_message(payload.channel_id, "", embed)
    elsif argscount.size > 1
      acro = pres.gsub("acronym ", "").gsub("<@443053627419000833> ", "").gsub("<@443053627419000833>", "").gsub("<@!443053627419000833>", "").gsub("<@!443053627419000833> ", "").gsub("--", "")
      embeded = Discord::Embed.new(
        timestamp: Time.now,
        colour: 0xffff00,
        title: "Only Latin Letters Please"
      )
      next client.create_message(payload.channel_id, "", embeded) unless acro.match(/^[a-zA-Z_\-+ ]*$/)
      begin
        response = HTTP::Client.get "https://api.chew.pro/acronym/#{acro}"
        value = JSON.parse(response.body)
        embed = Discord::Embed.new(
          timestamp: Time.now,
          colour: 0xffff00,
          title: "#{acro} Stands For :",
          description: "#{value["phrase"]}"
        )
        client.create_message(payload.channel_id, "", embed)
      rescue
        embed = Discord::Embed.new(
          colour: 0xffff00,
          title: "Error",
          url: "https://granz.geopjr.xyz"
        )
        client.create_message(payload.channel_id, "", embed)
      end
    else
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Too few arguments"
      )
      client.create_message(payload.channel_id, "", embed)
    end
  end
end

# Bird
client.on_message_create do |payload|
  next if payload.author.bot
  if (payload.content.starts_with? PREFIX[0] + "bird") || (payload.content.starts_with? PREFIX[1] + "bird") || (payload.content.starts_with? PREFIX[2] + "bird") || (payload.content.starts_with? PREFIX[3] + "bird") || (payload.content.starts_with? PREFIX[4] + "bird")
    channel = client.get_channel(payload.channel_id)
    begin
      response = HTTP::Client.get "http://shibe.online/api/birds?count=1"
      value = JSON.parse(response.body)
      embed = Discord::Embed.new(
        timestamp: Time.now,
        colour: 0xffff00,
        image: Discord::EmbedImage.new(
          url: "#{value[0].as_s}"
        )
      )
      client.create_message(payload.channel_id, "", embed)
    rescue
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Error",
        url: "https://granz.geopjr.xyz"
      )
      client.create_message(payload.channel_id, "", embed)
    end
  end
end
# doge
client.on_message_create do |payload|
  next if payload.author.bot
  if (payload.content.starts_with? PREFIX[0] + "doge") || (payload.content.starts_with? PREFIX[1] + "doge") || (payload.content.starts_with? PREFIX[2] + "doge") || (payload.content.starts_with? PREFIX[3] + "doge") || (payload.content.starts_with? PREFIX[4] + "doge")
    channel = client.get_channel(payload.channel_id)
    begin
      response = HTTP::Client.get "http://shibe.online/api/shibes?count=1"
      value = JSON.parse(response.body)
      embed = Discord::Embed.new(
        timestamp: Time.now,
        colour: 0xffff00,
        image: Discord::EmbedImage.new(
          url: "#{value[0].as_s}"
        )
      )
      client.create_message(payload.channel_id, "", embed)
    rescue
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Error",
        url: "https://granz.geopjr.xyz"
      )
      client.create_message(payload.channel_id, "", embed)
    end
  end
end
# cat
client.on_message_create do |payload|
  next if payload.author.bot
  if (payload.content.starts_with? PREFIX[0] + "cat") || (payload.content.starts_with? PREFIX[1] + "cat") || (payload.content.starts_with? PREFIX[2] + "cat") || (payload.content.starts_with? PREFIX[3] + "cat") || (payload.content.starts_with? PREFIX[4] + "cat")
    channel = client.get_channel(payload.channel_id)
    begin
      response = HTTP::Client.get "http://shibe.online/api/cats?count=1"
      value = JSON.parse(response.body)
      embed = Discord::Embed.new(
        timestamp: Time.now,
        colour: 0xffff00,
        image: Discord::EmbedImage.new(
          url: "#{value[0].as_s}"
        )
      )
      client.create_message(payload.channel_id, "", embed)
    rescue
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Error",
        url: "https://granz.geopjr.xyz"
      )
      client.create_message(payload.channel_id, "", embed)
    end
  end
end
# coffee
client.on_message_create do |payload|
  next if payload.author.bot
  if (payload.content.starts_with? PREFIX[0] + "coffee") || (payload.content.starts_with? PREFIX[1] + "coffee") || (payload.content.starts_with? PREFIX[2] + "coffee") || (payload.content.starts_with? PREFIX[3] + "coffee") || (payload.content.starts_with? PREFIX[4] + "coffee")
    channel = client.get_channel(payload.channel_id)
    begin
      response = HTTP::Client.get "https://coffee.alexflipnote.xyz/random.json"
      value = JSON.parse(response.body)
      embed = Discord::Embed.new(
        timestamp: Time.now,
        colour: 0xffff00,
        image: Discord::EmbedImage.new(
          url: "#{value["file"].as_s}"
        )
      )
      client.create_message(payload.channel_id, "", embed)
    rescue
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Error",
        url: "https://granz.geopjr.xyz"
      )
      client.create_message(payload.channel_id, "", embed)
    end
  end
end
# cookie
client.on_message_create do |payload|
  next if payload.author.bot
  if (payload.content.starts_with? PREFIX[0] + "cookie") || (payload.content.starts_with? PREFIX[1] + "cookie") || (payload.content.starts_with? PREFIX[2] + "cookie") || (payload.content.starts_with? PREFIX[3] + "cookie") || (payload.content.starts_with? PREFIX[4] + "cookie")
    channel = client.get_channel(payload.channel_id)
    begin
      response = HTTP::Client.get "http://www.yerkee.com/api/fortune"
      value = JSON.parse(response.body)
      embed = Discord::Embed.new(
        timestamp: Time.now,
        colour: 0xffff00,
        title: "#{value["fortune"].as_s}"
      )
      client.create_message(payload.channel_id, "", embed)
    rescue
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Error",
        url: "https://granz.geopjr.xyz"
      )
      client.create_message(payload.channel_id, "", embed)
    end
  end
end
# dog
client.on_message_create do |payload|
  next if payload.author.bot
  if (payload.content == PREFIX[0] + "dog") || (payload.content == PREFIX[1] + "dog") || (payload.content == PREFIX[2] + "dog") || (payload.content == PREFIX[3] + "dog") || (payload.content == PREFIX[4] + "dog")
    channel = client.get_channel(payload.channel_id)
    begin
      response = HTTP::Client.get "https://random.dog/woof.json"
      value = JSON.parse(response.body)
      embed = Discord::Embed.new(
        timestamp: Time.now,
        colour: 0xffff00,
        image: Discord::EmbedImage.new(
          url: "#{value["url"].as_s}"
        )
      )
      client.create_message(payload.channel_id, "", embed)
    rescue
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Error",
        url: "https://granz.geopjr.xyz"
      )
      client.create_message(payload.channel_id, "", embed)
    end
  end
end
# fox
client.on_message_create do |payload|
  next if payload.author.bot
  if (payload.content.starts_with? PREFIX[0] + "fox") || (payload.content.starts_with? PREFIX[1] + "fox") || (payload.content.starts_with? PREFIX[2] + "fox") || (payload.content.starts_with? PREFIX[3] + "fox") || (payload.content.starts_with? PREFIX[4] + "fox")
    channel = client.get_channel(payload.channel_id)
    begin
      response = HTTP::Client.get "https://randomfox.ca/floof/"
      value = JSON.parse(response.body)
      embed = Discord::Embed.new(
        timestamp: Time.now,
        colour: 0xffff00,
        image: Discord::EmbedImage.new(
          url: "#{value["image"].as_s}"
        )
      )
      client.create_message(payload.channel_id, "", embed)
    rescue
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Error",
        url: "https://granz.geopjr.xyz"
      )
      client.create_message(payload.channel_id, "", embed)
    end
  end
end

# ID
client.on_message_create do |payload|
  next if payload.author.bot
  if (payload.content.starts_with? PREFIX[0] + "id") || (payload.content.starts_with? PREFIX[1] + "id") || (payload.content.starts_with? PREFIX[2] + "id") || (payload.content.starts_with? PREFIX[3] + "id") || (payload.content.starts_with? PREFIX[4] + "id")
    pres = payload.content.gsub("<@443053627419000833> ", "<@443053627419000833>").gsub("<@!443053627419000833> ", "<@!443053627419000833>")
    argscount = pres.split(" ")
    if argscount.size > 2
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Too many arguments"
      )
      client.create_message(payload.channel_id, "", embed)
    elsif argscount.size > 1
      mentioned_user = payload.mentions
      begin
        if (mentioned_user[0] == payload.author) || (mentioned_user[0] != payload.author)
          embed = Discord::Embed.new(
            timestamp: Time.now,
            colour: 0xffff00,
            title: "#{mentioned_user[0].id}"
          )
        else
          embed = Discord::Embed.new(
            timestamp: Time.now,
            colour: 0xffff00,
            title: "Mention a user"
          )
        end
        client.create_message(payload.channel_id, "", embed)
      rescue
        embed = Discord::Embed.new(
          colour: 0xffff00,
          title: "Mention a user"
        )
        client.create_message(payload.channel_id, "", embed)
      end
    elsif argscount.size == 1
      begin
        embed = Discord::Embed.new(
          timestamp: Time.now,
          colour: 0xffff00,
          title: "#{payload.author.id}"
        )
        client.create_message(payload.channel_id, "", embed)
      rescue
        embed = Discord::Embed.new(
          colour: 0xffff00,
          title: "Error",
          url: "https://granz.geopjr.xyz"
        )
        client.create_message(payload.channel_id, "", embed)
      end
    else
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Too few arguments"
      )
      client.create_message(payload.channel_id, "", embed)
    end
  end
end
# trump
client.on_message_create do |payload|
  next if payload.author.bot
  if (payload.content.starts_with? PREFIX[0] + "trump") || (payload.content.starts_with? PREFIX[1] + "trump") || (payload.content.starts_with? PREFIX[2] + "trump") || (payload.content.starts_with? PREFIX[3] + "trump") || (payload.content.starts_with? PREFIX[4] + "trump")
    channel = client.get_channel(payload.channel_id)
    begin
      response = HTTP::Client.get "https://api.whatdoestrumpthink.com/api/v1/quotes/random"
      value = JSON.parse(response.body)
      embed = Discord::Embed.new(
        timestamp: Time.now,
        colour: 0xffff00,
        title: "#{value["message"].as_s}"
      )
      client.create_message(payload.channel_id, "", embed)
    rescue
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Error",
        url: "https://granz.geopjr.xyz"
      )
      client.create_message(payload.channel_id, "", embed)
    end
  end
end
# joke
client.on_message_create do |payload|
  next if payload.author.bot
  if (payload.content.starts_with? PREFIX[0] + "joke") || (payload.content.starts_with? PREFIX[1] + "joke") || (payload.content.starts_with? PREFIX[2] + "joke") || (payload.content.starts_with? PREFIX[3] + "joke") || (payload.content.starts_with? PREFIX[4] + "joke")
    channel = client.get_channel(payload.channel_id)
    begin
      response = HTTP::Client.get "https://08ad1pao69.execute-api.us-east-1.amazonaws.com/dev/random_joke"
      value = JSON.parse(response.body)
      embed = Discord::Embed.new(
        timestamp: Time.now,
        colour: 0xffff00,
        title: "#{value["setup"].as_s}",
        description: "#{value["punchline"].as_s}"
      )
      client.create_message(payload.channel_id, "", embed)
    rescue
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Error",
        url: "https://granz.geopjr.xyz"
      )
      client.create_message(payload.channel_id, "", embed)
    end
  end
end
# norris
client.on_message_create do |payload|
  next if payload.author.bot
  if (payload.content.starts_with? PREFIX[0] + "norris") || (payload.content.starts_with? PREFIX[1] + "norris") || (payload.content.starts_with? PREFIX[2] + "norris") || (payload.content.starts_with? PREFIX[3] + "norris") || (payload.content.starts_with? PREFIX[4] + "norris")
    channel = client.get_channel(payload.channel_id)
    begin
      response = HTTP::Client.get "http://api.icndb.com/jokes/random"
      value = JSON.parse(response.body)
      embed = Discord::Embed.new(
        timestamp: Time.now,
        colour: 0xffff00,
        title: "#{value["value"]["joke"].as_s}",
      )
      client.create_message(payload.channel_id, "", embed)
    rescue
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Error",
        url: "https://granz.geopjr.xyz"
      )
      client.create_message(payload.channel_id, "", embed)
    end
  end
end
# neko
client.on_message_create do |payload|
  next if payload.author.bot
  if (payload.content.starts_with? PREFIX[0] + "neko") || (payload.content.starts_with? PREFIX[1] + "neko") || (payload.content.starts_with? PREFIX[2] + "neko") || (payload.content.starts_with? PREFIX[3] + "neko") || (payload.content.starts_with? PREFIX[4] + "neko")
    channel = client.get_channel(payload.channel_id)
    embeded = Discord::Embed.new(
      colour: 0xffff00,
      image: Discord::EmbedImage.new(
        url: "https://i.imgur.com/yVs6TqV.gif"
      ),
      title: "I'm sorry. I can't do that because this is a SFW channel."
    )
    next client.create_message(payload.channel_id, "", embeded) unless channel.nsfw == true
    begin
      response = HTTP::Client.get "https://nekos.life/api/lewd/neko"
      value = JSON.parse(response.body)
      embed = Discord::Embed.new(
        timestamp: Time.now,
        colour: 0xffff00,
        image: Discord::EmbedImage.new(
          url: "#{value["neko"].as_s}"
        )
      )
      client.create_message(payload.channel_id, "", embed)
    rescue
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Error",
        url: "https://granz.geopjr.xyz"
      )
      client.create_message(payload.channel_id, "", embed)
    end
  end
end
# Blush
client.on_message_create do |payload|
  next if payload.author.bot
  begin
    if (payload.content.starts_with? PREFIX[0] + "blush") || (payload.content.starts_with? PREFIX[1] + "blush") || (payload.content.starts_with? PREFIX[2] + "blush") || (payload.content.starts_with? PREFIX[3] + "blush") || (payload.content.starts_with? PREFIX[4] + "blush")
      embed = Discord::Embed.new(
        timestamp: Time.now,
        colour: 0xffff00,
        image: Discord::EmbedImage.new(
          url: "https://i.imgur.com/fIY6c7d.png"
        )
      )
      client.create_message(payload.channel_id, "", embed)
    end
  rescue
    embed = Discord::Embed.new(
      title: "Error",
      url: "https://granz.geopjr.xyz"
    )
    client.create_message(payload.channel_id, "", embed)
  end
end
# amiibo
client.on_message_create do |payload|
  next if payload.author.bot
  if (payload.content.starts_with? PREFIX[0] + "amiibo") || (payload.content.starts_with? PREFIX[1] + "amiibo") || (payload.content.starts_with? PREFIX[2] + "amiibo") || (payload.content.starts_with? PREFIX[3] + "amiibo") || (payload.content.starts_with? PREFIX[4] + "amiibo")
    pres = payload.content.gsub("<@443053627419000833> ", "<@443053627419000833>").gsub("<@!443053627419000833> ", "<@!443053627419000833>")
    argscount = pres.split(" ")
    if argscount.size > 2
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Too many arguments"
      )
      client.create_message(payload.channel_id, "", embed)
    elsif argscount.size > 1
      argss = pres.gsub("amiibo ", "").gsub("<@443053627419000833> ", "").gsub("<@443053627419000833>", "").gsub("<@!443053627419000833>", "").gsub("<@!443053627419000833> ", "").gsub("--", "")
      begin
        response = HTTP::Client.get "http://www.amiiboapi.com/api/amiibo/?name=#{argss}"
        value = JSON.parse(response.body)
        img = value["amiibo"][0]["image"]
        eu = value["amiibo"][0]["release"]["eu"]
        au = value["amiibo"][0]["release"]["au"]
        jp = value["amiibo"][0]["release"]["jp"]
        na = value["amiibo"][0]["release"]["na"]

        embed = Discord::Embed.new(
          title: "#{value["amiibo"][0]["character"]}",
          timestamp: Time.now,
          colour: 0xffff00,
          footer: Discord::EmbedFooter.new(
            text: "\xE3\x80\x8EGeop\xE3\x80\x8F#4066",
            icon_url: "https://cdn.discordapp.com/avatars/216156825978929152/c7eaee00bbe99b16304429fb9b9116ea.png"
          ),
          thumbnail: Discord::EmbedThumbnail.new(
            url: "#{img}"
          ),
          author: Discord::EmbedAuthor.new(
            name: "Granz#8561",
            icon_url: "https://cdn.discordapp.com/avatars/443053627419000833/333d3868fa0837e800e6515558fd8179.png"
          ),
          fields: [Discord::EmbedField.new(
            name: "__Amiibo Series__",
            value: "#{value["amiibo"][0]["amiiboSeries"]}"
          ),
                   Discord::EmbedField.new(
                     name: "__Game Series__",
                     value: "#{value["amiibo"][0]["gameSeries"]}"
                   ),
                   Discord::EmbedField.new(
                     name: "__Release Day__",
                     value: "**AU:** #{au}\n**EU:** #{eu}\n**JP:** #{jp}\n**NA:** #{na}"
                   ),
          ]
        )
        client.create_message(payload.channel_id, "", embed)
      rescue
        embed = Discord::Embed.new(
          colour: 0xffff00,
          title: "I am afraid there is not such user in existance"
        )
        client.create_message(payload.channel_id, "", embed)
      end
    else
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Too few arguments"
      )
      client.create_message(payload.channel_id, "", embed)
    end
  end
end
# algebra
client.on_message_create do |payload|
  next if payload.author.bot
  if (payload.content.starts_with? PREFIX[0] + "algebra") || (payload.content.starts_with? PREFIX[1] + "algebra") || (payload.content.starts_with? PREFIX[2] + "algebra") || (payload.content.starts_with? PREFIX[3] + "algebra") || (payload.content.starts_with? PREFIX[4] + "algebra")
    pres = payload.content.gsub("<@443053627419000833> ", "<@443053627419000833>").gsub("<@!443053627419000833> ", "<@!443053627419000833>")
    argscount = pres.split(" ")
    if argscount.size > 1
      argss = pres.gsub("algebra ", "").gsub("<@443053627419000833> ", "").gsub("<@443053627419000833>", "").gsub("<@!443053627419000833>", "").gsub("<@!443053627419000833> ", "").gsub("--", "")
      argsss = argss.split(" ").join("").gsub("+", "%2B").gsub("=", "%3D").gsub("/", "%2F").gsub(",", "%2C").gsub(".", "%2E")
      begin
        embed = Discord::Embed.new(
          colour: 0xffff00,
          image: Discord::EmbedImage.new(
            url: "https://chart.googleapis.com/chart?cht=tx&chl=#{argsss}"
          )
        )
        client.create_message(payload.channel_id, "", embed)
      rescue
        embed = Discord::Embed.new(
          colour: 0xffff00,
          title: "Error",
          url: "https://geopjr.xyz"
        )
        client.create_message(payload.channel_id, "", embed)
      end
    else
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Too few arguments"
      )
      client.create_message(payload.channel_id, "", embed)
    end
  end
end
# achievement
client.on_message_create do |payload|
  next if payload.author.bot
  if (payload.content.starts_with? PREFIX[0] + "achievement") || (payload.content.starts_with? PREFIX[1] + "achievement") || (payload.content.starts_with? PREFIX[2] + "achievement") || (payload.content.starts_with? PREFIX[3] + "achievement") || (payload.content.starts_with? PREFIX[4] + "achievement")
    pres = payload.content.gsub("<@443053627419000833> ", "<@443053627419000833>").gsub("<@!443053627419000833> ", "<@!443053627419000833>")
    argscount = pres.split(" ")
    if argscount.size > 1
      argss = pres.gsub("achievement ", "").gsub("<@443053627419000833> ", "").gsub("<@443053627419000833>", "").gsub("<@!443053627419000833>", "").gsub("<@!443053627419000833> ", "").gsub("--", "")
      id = argss.split(" ")
      mooor = argss.gsub("#{id[0]} ", "").split("|")
      begin
        embed = Discord::Embed.new(
          title: "Achievement Unlocked",
          timestamp: Time.now,
          colour: 0xffff00,
          image: Discord::EmbedImage.new(
            url: "https://www.minecraftskinstealer.com/achievement/a.php?i=#{id[0].gsub("+", "%2B").gsub(" ", "+")}&h=#{mooor[0].gsub("+", "%2B").gsub(" ", "+")}&t=#{mooor[1].gsub("+", "%2B").gsub(" ", "+")}"
          )
        )
        client.create_message(payload.channel_id, "", embed)
      rescue
        embed = Discord::Embed.new(
          colour: 0xffff00,
          title: "Error",
          description: "**--achievement <id> <title>|<description>**\n\nThe id's are located [__here__](https://granz.geopjr.xyz/ids.html)"
        )
        client.create_message(payload.channel_id, "", embed)
      end
    else
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Too few arguments",
        description: "**--achievement <id> <title>|<description>**\n\nThe id's are located [__here__](https://granz.geopjr.xyz/ids.html)"
      )
      client.create_message(payload.channel_id, "", embed)
    end
  end
end
# choose
client.on_message_create do |payload|
  next if payload.author.bot
  if (payload.content.starts_with? PREFIX[0] + "choose") || (payload.content.starts_with? PREFIX[1] + "choose") || (payload.content.starts_with? PREFIX[2] + "choose") || (payload.content.starts_with? PREFIX[3] + "choose") || (payload.content.starts_with? PREFIX[4] + "choose")
    pres = payload.content.gsub("<@443053627419000833> ", "<@443053627419000833>").gsub("<@!443053627419000833> ", "<@!443053627419000833>")
    argscount = pres.split(" ")
    if argscount.size > 2
      argss = pres.gsub("choose ", "").gsub("<@443053627419000833> ", "").gsub("<@443053627419000833>", "").gsub("<@!443053627419000833>", "").gsub("<@!443053627419000833> ", "").gsub("--", "")
      chs = argss.split(" ")
      begin
        embed = Discord::Embed.new(
          title: "Hmm, I pick :",
          description: "#{chs.sample}",
          timestamp: Time.now,
          colour: 0xffff00,
        )
        client.create_message(payload.channel_id, "", embed)
      rescue
        embed = Discord::Embed.new(
          colour: 0xffff00,
          title: "Error",
          url: "https://geopjr.xyz"
        )
        client.create_message(payload.channel_id, "", embed)
      end
    else
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Too few arguments"
      )
      client.create_message(payload.channel_id, "", embed)
    end
  end
end
# howcute
client.on_message_create do |payload|
  next if payload.author.bot
  if (payload.content.starts_with? PREFIX[0] + "howcute") || (payload.content.starts_with? PREFIX[1] + "howcute") || (payload.content.starts_with? PREFIX[2] + "howcute") || (payload.content.starts_with? PREFIX[3] + "howcute") || (payload.content.starts_with? PREFIX[4] + "howcute")
    pres = payload.content.gsub("<@443053627419000833> ", "<@443053627419000833>").gsub("<@!443053627419000833> ", "<@!443053627419000833>")
    argscount = pres.split(" ")
    if argscount.size > 1
      arr = (0..100).to_a
      argss = pres.gsub("howcute ", "").gsub("<@443053627419000833> ", "").gsub("<@443053627419000833>", "").gsub("<@!443053627419000833>", "").gsub("<@!443053627419000833> ", "").gsub("--", "")
      begin
        embed = Discord::Embed.new(
          title: "How cute are you ?",
          description: "**#{argss}** is **#{arr.sample}/100** cute :blush:",
          timestamp: Time.now,
          colour: 0xffff00,
        )
        client.create_message(payload.channel_id, "", embed)
      rescue
        embed = Discord::Embed.new(
          colour: 0xffff00,
          title: "Error",
          url: "https://geopjr.xyz"
        )
        client.create_message(payload.channel_id, "", embed)
      end
    else
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Too few arguments"
      )
      client.create_message(payload.channel_id, "", embed)
    end
  end
end
# howgay
client.on_message_create do |payload|
  next if payload.author.bot
  if (payload.content.starts_with? PREFIX[0] + "howgay") || (payload.content.starts_with? PREFIX[1] + "howgay") || (payload.content.starts_with? PREFIX[2] + "howgay") || (payload.content.starts_with? PREFIX[3] + "howgay") || (payload.content.starts_with? PREFIX[4] + "howgay")
    pres = payload.content.gsub("<@443053627419000833> ", "<@443053627419000833>").gsub("<@!443053627419000833> ", "<@!443053627419000833>")
    argscount = pres.split(" ")
    if argscount.size > 1
      arr = (0..100).to_a
      argss = pres.gsub("howgay ", "").gsub("<@443053627419000833> ", "").gsub("<@443053627419000833>", "").gsub("<@!443053627419000833>", "").gsub("<@!443053627419000833> ", "").gsub("--", "")
      begin
        embed = Discord::Embed.new(
          title: "How much of a homosexual are you ?",
          description: "**#{argss}** is **#{arr.sample}/100** homosexual :gay_pride_flag:",
          timestamp: Time.now,
          colour: 0xffff00,
        )
        client.create_message(payload.channel_id, "", embed)
      rescue
        embed = Discord::Embed.new(
          colour: 0xffff00,
          title: "Error",
          url: "https://geopjr.xyz"
        )
        client.create_message(payload.channel_id, "", embed)
      end
    else
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Too few arguments"
      )
      client.create_message(payload.channel_id, "", embed)
    end
  end
end
# rate
client.on_message_create do |payload|
  next if payload.author.bot
  if (payload.content.starts_with? PREFIX[0] + "rate ") || (payload.content.starts_with? PREFIX[1] + "rate ") || (payload.content.starts_with? PREFIX[2] + "rate ") || (payload.content.starts_with? PREFIX[3] + "rate ") || (payload.content.starts_with? PREFIX[4] + "rate ")
    pres = payload.content.gsub("<@443053627419000833> ", "<@443053627419000833>").gsub("<@!443053627419000833> ", "<@!443053627419000833>")
    argscount = pres.split(" ")
    if argscount.size > 1
      arr = (0..10).to_a
      argss = pres.gsub("rate ", "").gsub("<@443053627419000833> ", "").gsub("<@443053627419000833>", "").gsub("<@!443053627419000833>", "").gsub("<@!443053627419000833> ", "").gsub("--", "")
      begin
        embed = Discord::Embed.new(
          description: "I give **#{argss}** a **#{arr.sample}/10** ~Granz",
          timestamp: Time.now,
          colour: 0xffff00,
        )
        client.create_message(payload.channel_id, "", embed)
      rescue
        embed = Discord::Embed.new(
          colour: 0xffff00,
          title: "Error",
          url: "https://geopjr.xyz"
        )
        client.create_message(payload.channel_id, "", embed)
      end
    else
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Too few arguments"
      )
      client.create_message(payload.channel_id, "", embed)
    end
  end
end
# yesno
client.on_message_create do |payload|
  next if payload.author.bot
  if (payload.content.starts_with? PREFIX[0] + "yesno") || (payload.content.starts_with? PREFIX[1] + "yesno") || (payload.content.starts_with? PREFIX[2] + "yesno") || (payload.content.starts_with? PREFIX[3] + "yesno") || (payload.content.starts_with? PREFIX[4] + "yesno")
    pres = payload.content.gsub("<@443053627419000833> ", "<@443053627419000833>").gsub("<@!443053627419000833> ", "<@!443053627419000833>")
    argscount = pres.split(" ")
    if argscount.size > 1
      arr = ["Yes.", "No."]
      argss = pres.gsub("yesno ", "").gsub("<@443053627419000833> ", "").gsub("<@443053627419000833>", "").gsub("<@!443053627419000833>", "").gsub("<@!443053627419000833> ", "").gsub("--", "")
      begin
        embed = Discord::Embed.new(
          title: "#{arr.sample.to_s}",
          timestamp: Time.now,
          colour: 0xffff00,
        )
        client.create_message(payload.channel_id, "", embed)
      rescue
        embed = Discord::Embed.new(
          colour: 0xffff00,
          title: "Error",
          url: "https://geopjr.xyz"
        )
        client.create_message(payload.channel_id, "", embed)
      end
    else
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Too few arguments"
      )
      client.create_message(payload.channel_id, "", embed)
    end
  end
end
# ratewaifu
client.on_message_create do |payload|
  next if payload.author.bot
  if (payload.content.starts_with? PREFIX[0] + "ratewaifu") || (payload.content.starts_with? PREFIX[1] + "ratewaifu") || (payload.content.starts_with? PREFIX[2] + "ratewaifu") || (payload.content.starts_with? PREFIX[3] + "ratewaifu") || (payload.content.starts_with? PREFIX[4] + "ratewaifu")
    pres = payload.content.gsub("<@443053627419000833> ", "<@443053627419000833>").gsub("<@!443053627419000833> ", "<@!443053627419000833>")
    argscount = pres.split(" ")
    if argscount.size > 1
      arr = (0..100).to_a
      argss = pres.gsub("ratewaifu ", "").gsub("<@443053627419000833> ", "").gsub("<@443053627419000833>", "").gsub("<@!443053627419000833>", "").gsub("<@!443053627419000833> ", "").gsub("--", "")
      begin
        embed = Discord::Embed.new(
          title: "Waifu O' Meter",
          description: "My rating for **#{argss}** is **#{arr.sample}/100** :princess:",
          timestamp: Time.now,
          colour: 0xffff00,
        )
        client.create_message(payload.channel_id, "", embed)
      rescue
        embed = Discord::Embed.new(
          colour: 0xffff00,
          title: "Error",
          url: "https://geopjr.xyz"
        )
        client.create_message(payload.channel_id, "", embed)
      end
    else
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Too few arguments"
      )
      client.create_message(payload.channel_id, "", embed)
    end
  end
end
# ratehusbando
client.on_message_create do |payload|
  next if payload.author.bot
  if (payload.content.starts_with? PREFIX[0] + "ratehusbando") || (payload.content.starts_with? PREFIX[1] + "ratehusbando") || (payload.content.starts_with? PREFIX[2] + "ratehusbando") || (payload.content.starts_with? PREFIX[3] + "ratehusbando") || (payload.content.starts_with? PREFIX[4] + "ratehusbando")
    pres = payload.content.gsub("<@443053627419000833> ", "<@443053627419000833>").gsub("<@!443053627419000833> ", "<@!443053627419000833>")
    argscount = pres.split(" ")
    if argscount.size > 1
      arr = (0..100).to_a
      argss = pres.gsub("ratehusbando ", "").gsub("<@443053627419000833> ", "").gsub("<@443053627419000833>", "").gsub("<@!443053627419000833>", "").gsub("<@!443053627419000833> ", "").gsub("--", "")
      begin
        embed = Discord::Embed.new(
          title: "Husbando O' Meter",
          description: "My rating for **#{argss}** is **#{arr.sample}/100** :prince:",
          timestamp: Time.now,
          colour: 0xffff00,
        )
        client.create_message(payload.channel_id, "", embed)
      rescue
        embed = Discord::Embed.new(
          colour: 0xffff00,
          title: "Error",
          url: "https://geopjr.xyz"
        )
        client.create_message(payload.channel_id, "", embed)
      end
    else
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Too few arguments"
      )
      client.create_message(payload.channel_id, "", embed)
    end
  end
end
# qrcode
client.on_message_create do |payload|
  next if payload.author.bot
  if (payload.content.starts_with? PREFIX[0] + "qrcode") || (payload.content.starts_with? PREFIX[1] + "qrcode") || (payload.content.starts_with? PREFIX[2] + "qrcode") || (payload.content.starts_with? PREFIX[3] + "qrcode") || (payload.content.starts_with? PREFIX[4] + "qrcode")
    pres = payload.content.gsub("<@443053627419000833> ", "<@443053627419000833>").gsub("<@!443053627419000833> ", "<@!443053627419000833>")
    argscount = pres.split(" ")
    if argscount.size > 1
      argss = pres.gsub("qrcode ", "").gsub("<@443053627419000833> ", "").gsub("<@443053627419000833>", "").gsub("<@!443053627419000833>", "").gsub("<@!443053627419000833> ", "").gsub("--", "")
      begin
        embed = Discord::Embed.new(
          colour: 0xffff00,
          image: Discord::EmbedImage.new(
            url: "https://chart.googleapis.com/chart?cht=qr&chs=512x512&chl=#{argss.gsub(" ", "+")}"
          )
        )
        client.create_message(payload.channel_id, "", embed)
      rescue
        embed = Discord::Embed.new(
          colour: 0xffff00,
          title: "Error",
          url: "https://geopjr.xyz"
        )
        client.create_message(payload.channel_id, "", embed)
      end
    else
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Too few arguments"
      )
      client.create_message(payload.channel_id, "", embed)
    end
  end
end
# hug
client.on_message_create do |payload|
  next if payload.author.bot
  if (payload.content.starts_with? PREFIX[0] + "hug") || (payload.content.starts_with? PREFIX[1] + "hug") || (payload.content.starts_with? PREFIX[2] + "hug") || (payload.content.starts_with? PREFIX[3] + "hug") || (payload.content.starts_with? PREFIX[4] + "hug")
    pres = payload.content.gsub("<@443053627419000833> ", "<@443053627419000833>").gsub("<@!443053627419000833> ", "<@!443053627419000833>")
    argscount = pres.split(" ")
    if argscount.size > 2
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Too many arguments"
      )
      client.create_message(payload.channel_id, "", embed)
    elsif argscount.size > 1
      mentioned_user = payload.mentions
      argss = pres.gsub("hug ", "").gsub("<@443053627419000833> ", "").gsub("<@443053627419000833>", "").gsub("<@!443053627419000833>", "").gsub("<@!443053627419000833> ", "").gsub("--", "")
      begin
        if mentioned_user[0] == payload.author
          embed = Discord::Embed.new(
            colour: 0xffff00,
            description: "<@#{payload.author.id}> Sorry , you can't hug yourself :cry:. But I can hug you if you want :blush:"
          )
          client.create_message(payload.channel_id, "", embed)
        elsif mentioned_user[0] != payload.author
          response = HTTP::Client.get "https://nekos.life/api/hug"
          value = JSON.parse(response.body)
          embed = Discord::Embed.new(
            image: Discord::EmbedImage.new(
              url: "#{value["url"]}"
            ),
            colour: 0xffff00,
            description: "<@#{mentioned_user[0].id}> , got hugged by <@#{payload.author.id}> :hugging:"
          )
          client.create_message(payload.channel_id, "", embed)
        elsif mentioned_user[0] == "443053627419000833"
          embed = Discord::Embed.new(
            colour: 0xffff00,
            title: "NO"
          )
          client.create_message(payload.channel_id, "", embed)
        else
          embed = Discord::Embed.new(
            colour: 0xffff00,
            title: "Mention a user"
          )
          client.create_message(payload.channel_id, "", embed)
        end
      rescue
        embed = Discord::Embed.new(
          colour: 0xffff00,
          title: "Mention a user"
        )
        client.create_message(payload.channel_id, "", embed)
      end
    else
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Too few arguments"
      )
      client.create_message(payload.channel_id, "", embed)
    end
  end
end
# kiss
client.on_message_create do |payload|
  next if payload.author.bot
  if (payload.content.starts_with? PREFIX[0] + "kiss") || (payload.content.starts_with? PREFIX[1] + "kiss") || (payload.content.starts_with? PREFIX[2] + "kiss") || (payload.content.starts_with? PREFIX[3] + "kiss") || (payload.content.starts_with? PREFIX[4] + "kiss")
    pres = payload.content.gsub("<@443053627419000833> ", "<@443053627419000833>").gsub("<@!443053627419000833> ", "<@!443053627419000833>")
    argscount = pres.split(" ")
    if argscount.size > 2
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Too many arguments"
      )
      client.create_message(payload.channel_id, "", embed)
    elsif argscount.size > 1
      mentioned_user = payload.mentions
      argss = pres.gsub("kiss ", "").gsub("<@443053627419000833> ", "").gsub("<@443053627419000833>", "").gsub("<@!443053627419000833>", "").gsub("<@!443053627419000833> ", "").gsub("--", "")
      begin
        if mentioned_user[0] == payload.author
          embed = Discord::Embed.new(
            colour: 0xffff00,
            description: "<@#{payload.author.id}> Sorry , you can't kiss yourself :cry:. But I can kiss you if you want :blush:"
          )
          client.create_message(payload.channel_id, "", embed)
        elsif mentioned_user[0] != payload.author
          response = HTTP::Client.get "https://nekos.life/api/kiss"
          value = JSON.parse(response.body)
          embed = Discord::Embed.new(
            image: Discord::EmbedImage.new(
              url: "#{value["url"]}"
            ),
            colour: 0xffff00,
            description: "<@#{mentioned_user[0].id}> , got kissed by <@#{payload.author.id}> :kiss:"
          )
          client.create_message(payload.channel_id, "", embed)
        elsif mentioned_user[0] == "443053627419000833"
          embed = Discord::Embed.new(
            colour: 0xffff00,
            title: "NO"
          )
          client.create_message(payload.channel_id, "", embed)
        else
          embed = Discord::Embed.new(
            colour: 0xffff00,
            title: "Mention a user"
          )
          client.create_message(payload.channel_id, "", embed)
        end
      rescue
        embed = Discord::Embed.new(
          colour: 0xffff00,
          title: "Mention a user"
        )
        client.create_message(payload.channel_id, "", embed)
      end
    else
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Too few arguments"
      )
      client.create_message(payload.channel_id, "", embed)
    end
  end
end
# noticeme
client.on_message_create do |payload|
  next if payload.author.bot
  begin
    if (payload.content.starts_with? PREFIX[0] + "noticeme") || (payload.content.starts_with? PREFIX[1] + "noticeme") || (payload.content.starts_with? PREFIX[2] + "noticeme") || (payload.content.starts_with? PREFIX[3] + "noticeme") || (payload.content.starts_with? PREFIX[4] + "noticeme")
      embed = Discord::Embed.new(
        description: "<@#{payload.author.id}>, I notice you :relaxed:",
        colour: 0xffff00
      )
      client.create_message(payload.channel_id, "", embed)
    end
  rescue
    embed = Discord::Embed.new(
      title: "Error",
      url: "https://granz.geopjr.xyz"
    )
    client.create_message(payload.channel_id, "", embed)
  end
end
# mcskin
client.on_message_create do |payload|
  next if payload.author.bot
  if (payload.content.starts_with? PREFIX[0] + "mcskin") || (payload.content.starts_with? PREFIX[1] + "mcskin") || (payload.content.starts_with? PREFIX[2] + "mcskin") || (payload.content.starts_with? PREFIX[3] + "mcskin") || (payload.content.starts_with? PREFIX[4] + "mcskin")
    pres = payload.content.gsub("<@443053627419000833> ", "<@443053627419000833>").gsub("<@!443053627419000833> ", "<@!443053627419000833>")
    argscount = pres.split(" ")
    if argscount.size > 2
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Too many arguments"
      )
      client.create_message(payload.channel_id, "", embed)
    elsif argscount.size > 1
      argss = pres.gsub("mcskin ", "").gsub("<@443053627419000833> ", "").gsub("<@443053627419000833>", "").gsub("<@!443053627419000833>", "").gsub("<@!443053627419000833> ", "").gsub("--", "")
      begin
        embed = Discord::Embed.new(
          title: "Here you go :",
          image: Discord::EmbedImage.new(
            url: "https://crafatar.com/skins/#{argss}"
          ),
          thumbnail: Discord::EmbedThumbnail.new(
            url: "https://crafatar.com/renders/head/#{argss}?overlay"
          ),
          timestamp: Time.now,
          colour: 0xffff00,
        )
        client.create_message(payload.channel_id, "", embed)
      rescue
        embed = Discord::Embed.new(
          colour: 0xffff00,
          title: "UUID's only"
        )
        client.create_message(payload.channel_id, "", embed)
      end
    else
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Too few arguments"
      )
      client.create_message(payload.channel_id, "", embed)
    end
  end
end
# mcuuid
client.on_message_create do |payload|
  next if payload.author.bot
  if (payload.content.starts_with? PREFIX[0] + "mcuuid") || (payload.content.starts_with? PREFIX[1] + "mcuuid") || (payload.content.starts_with? PREFIX[2] + "mcuuid") || (payload.content.starts_with? PREFIX[3] + "mcuuid") || (payload.content.starts_with? PREFIX[4] + "mcuuid")
    pres = payload.content.gsub("<@443053627419000833> ", "<@443053627419000833>").gsub("<@!443053627419000833> ", "<@!443053627419000833>")
    argscount = pres.split(" ")
    if argscount.size > 2
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Too many arguments"
      )
      client.create_message(payload.channel_id, "", embed)
    elsif argscount.size > 1
      argss = pres.gsub("mcuuid ", "").gsub("<@443053627419000833> ", "").gsub("<@443053627419000833>", "").gsub("<@!443053627419000833>", "").gsub("<@!443053627419000833> ", "").gsub("--", "")
      begin
        response = HTTP::Client.get "https://api.mojang.com/users/profiles/minecraft/#{argss}"
        value = JSON.parse(response.body)
        embed = Discord::Embed.new(
          timestamp: Time.now,
          colour: 0xffff00,
          title: "#{value["name"].as_s}'s UUID is:",
          description: "#{value["id"].as_s}",
          thumbnail: Discord::EmbedThumbnail.new(
            url: "https://crafatar.com/renders/head/#{value["id"]}?overlay"
          )
        )
        client.create_message(payload.channel_id, "", embed)
      rescue
        embed = Discord::Embed.new(
          colour: 0xffff00,
          title: "Error",
          url: "https://granz.geopjr.xyz"
        )
        client.create_message(payload.channel_id, "", embed)
      end
    else
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Too few arguments"
      )
      client.create_message(payload.channel_id, "", embed)
    end
  end
end
# mcstatus
client.on_message_create do |payload|
  next if payload.author.bot
  if (payload.content.starts_with? PREFIX[0] + "mcstatus") || (payload.content.starts_with? PREFIX[1] + "mcstatus") || (payload.content.starts_with? PREFIX[2] + "mcstatus") || (payload.content.starts_with? PREFIX[3] + "mcstatus") || (payload.content.starts_with? PREFIX[4] + "mcstatus")
    begin
      response = HTTP::Client.get "https://status.mojang.com/check"
      value = JSON.parse(response.body)
      if value[0]["minecraft.net"] == "green"
        minecraft = "<:check:314349398811475968>"
      elsif value[0]["minecraft.net"] == "yellow"
        minecraft = ":warning:"
      else
        minecraft = "<:xmark:314349398824058880>"
      end
      if value[1]["session.minecraft.net"] == "green"
        session = "<:check:314349398811475968>"
      elsif value[1]["session.minecraft.net"] == "yellow"
        session = ":warning:"
      else
        session = "<:xmark:314349398824058880>"
      end
      if value[2]["account.mojang.com"] == "green"
        acc = "<:check:314349398811475968>"
      elsif value[2]["account.mojang.com"] == "yellow"
        acc = ":warning:"
      else
        acc = "<:xmark:314349398824058880>"
      end
      if value[3]["authserver.mojang.com"] == "green"
        aserv = "<:check:314349398811475968>"
      elsif value[3]["authserver.mojang.com"] == "yellow"
        aserv = ":warning:"
      else
        aserv = "<:xmark:314349398824058880>"
      end
      if value[4]["sessionserver.mojang.com"] == "green"
        sserv = "<:check:314349398811475968>"
      elsif value[4]["sessionserver.mojang.com"] == "yellow"
        sserv = ":warning:"
      else
        sserv = "<:xmark:314349398824058880>"
      end
      if value[5]["api.mojang.com"] == "green"
        api = "<:check:314349398811475968>"
      elsif value[5]["api.mojang.com"] == "yellow"
        api = ":warning:"
      else
        api = "<:xmark:314349398824058880>"
      end
      if value[6]["textures.minecraft.net"] == "green"
        textures = "<:check:314349398811475968>"
      elsif value[6]["textures.minecraft.net"] == "yellow"
        textures = ":warning:"
      else
        textures = "<:xmark:314349398824058880>"
      end
      if value[7]["mojang.com"] == "green"
        moj = "<:check:314349398811475968>"
      elsif value[7]["mojang.com"] == "yellow"
        moj = ":warning:"
      else
        moj = "<:xmark:314349398824058880>"
      end

      embed = Discord::Embed.new(
        timestamp: Time.now,
        colour: 0xffff00,
        title: "Minecraft Status",
        fields: [Discord::EmbedField.new(
          name: "__Minecraft.net__",
          value: "#{minecraft}"
        ),
                 Discord::EmbedField.new(
                   name: "__Sessions__",
                   value: "#{session}"
                 ),
                 Discord::EmbedField.new(
                   name: "__Accounts__",
                   value: "#{acc}"
                 ),
                 Discord::EmbedField.new(
                   name: "__Auth Server__",
                   value: "#{aserv}"
                 ),
                 Discord::EmbedField.new(
                   name: "__Session Server__",
                   value: "#{sserv}"
                 ),
                 Discord::EmbedField.new(
                   name: "__API__",
                   value: "#{api}"
                 ),
                 Discord::EmbedField.new(
                   name: "__Textures___",
                   value: "#{textures}"
                 ),
                 Discord::EmbedField.new(
                   name: "__Mojang.com__",
                   value: "#{moj}"
                 ),
        ]
      )
      client.create_message(payload.channel_id, "", embed)
    rescue
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Error",
        url: "https://granz.geopjr.xyz"
      )
      client.create_message(payload.channel_id, "", embed)
    end
  end
end
# pat
client.on_message_create do |payload|
  next if payload.author.bot
  if (payload.content.starts_with? PREFIX[0] + "pat") || (payload.content.starts_with? PREFIX[1] + "pat") || (payload.content.starts_with? PREFIX[2] + "pat") || (payload.content.starts_with? PREFIX[3] + "pat") || (payload.content.starts_with? PREFIX[4] + "pat")
    pres = payload.content.gsub("<@443053627419000833> ", "<@443053627419000833>").gsub("<@!443053627419000833> ", "<@!443053627419000833>")
    argscount = pres.split(" ")
    if argscount.size > 2
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Too many arguments"
      )
      client.create_message(payload.channel_id, "", embed)
    elsif argscount.size > 1
      mentioned_user = payload.mentions
      argss = pres.gsub("pat ", "").gsub("<@443053627419000833> ", "").gsub("<@443053627419000833>", "").gsub("<@!443053627419000833>", "").gsub("<@!443053627419000833> ", "").gsub("--", "")
      begin
        if mentioned_user[0] == payload.author
          embed = Discord::Embed.new(
            colour: 0xffff00,
            description: "<@#{payload.author.id}> Sorry , you can't pat yourself :cry:. But I can pat you if you want :blush:"
          )
          client.create_message(payload.channel_id, "", embed)
        elsif mentioned_user[0] != payload.author
          response = HTTP::Client.get "https://nekos.life/api/pat"
          value = JSON.parse(response.body)
          embed = Discord::Embed.new(
            image: Discord::EmbedImage.new(
              url: "#{value["url"]}"
            ),
            colour: 0xffff00,
            description: "<@#{mentioned_user[0].id}> , you received a pat from <@#{payload.author.id}> :blush:"
          )
          client.create_message(payload.channel_id, "", embed)
        elsif mentioned_user[0] == "443053627419000833"
          embed = Discord::Embed.new(
            colour: 0xffff00,
            title: "NO"
          )
          client.create_message(payload.channel_id, "", embed)
        else
          embed = Discord::Embed.new(
            colour: 0xffff00,
            title: "Mention a user"
          )
          client.create_message(payload.channel_id, "", embed)
        end
      rescue
        embed = Discord::Embed.new(
          colour: 0xffff00,
          title: "Mention a user"
        )
        client.create_message(payload.channel_id, "", embed)
      end
    else
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Too few arguments"
      )
      client.create_message(payload.channel_id, "", embed)
    end
  end
end
# ping
client.on_message_create do |payload|
  next if payload.author.bot
  begin
    if (payload.content.starts_with? PREFIX[0] + "ping") || (payload.content.starts_with? PREFIX[1] + "ping") || (payload.content.starts_with? PREFIX[2] + "ping") || (payload.content.starts_with? PREFIX[3] + "ping") || (payload.content.starts_with? PREFIX[4] + "ping")
      time = Time.utc_now - payload.timestamp
      embed = Discord::Embed.new(
        title: ":ping_pong: Pong! :ping_pong: (#{time.total_milliseconds.round(0)} ms.)",
        timestamp: Time.now,
        colour: 0xffff00,
      )
      client.create_message(payload.channel_id, "", embed)
    end
  rescue
    embed = Discord::Embed.new(
      title: "Error",
      url: "https://granz.geopjr.xyz"
    )
    client.create_message(payload.channel_id, "", embed)
  end
end
# shoot
client.on_message_create do |payload|
  next if payload.author.bot
  if (payload.content.starts_with? PREFIX[0] + "shoot") || (payload.content.starts_with? PREFIX[1] + "shoot") || (payload.content.starts_with? PREFIX[2] + "shoot") || (payload.content.starts_with? PREFIX[3] + "shoot") || (payload.content.starts_with? PREFIX[4] + "shoot")
    pres = payload.content.gsub("<@443053627419000833> ", "<@443053627419000833>").gsub("<@!443053627419000833> ", "<@!443053627419000833>")
    argscount = pres.split(" ")
    if argscount.size > 2
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Too many arguments"
      )
      client.create_message(payload.channel_id, "", embed)
    elsif argscount.size > 1
      mentioned_user = payload.mentions
      argss = pres.gsub("shoot ", "").gsub("<@443053627419000833> ", "").gsub("<@443053627419000833>", "").gsub("<@!443053627419000833>", "").gsub("<@!443053627419000833> ", "").gsub("--", "")
      begin
        if mentioned_user[0] == payload.author
          embed = Discord::Embed.new(
            colour: 0xffff00,
            description: "<@#{payload.author.id}> If you are feeling suicidal, talk to someone or call your country's suicide prevention hotline"
          )
          client.create_message(payload.channel_id, "", embed)
        elsif mentioned_user[0] != payload.author
          embed = Discord::Embed.new(
            colour: 0xffff00,
            description: "<@#{mentioned_user[0].id}> , got shot by <@#{payload.author.id}> :gun:"
          )
          client.create_message(payload.channel_id, "", embed)
        elsif mentioned_user[0] == "443053627419000833"
          embed = Discord::Embed.new(
            colour: 0xffff00,
            title: "NO"
          )
          client.create_message(payload.channel_id, "", embed)
        else
          embed = Discord::Embed.new(
            colour: 0xffff00,
            title: "Mention a user"
          )
          client.create_message(payload.channel_id, "", embed)
        end
      rescue
        embed = Discord::Embed.new(
          colour: 0xffff00,
          title: "Mention a user"
        )
        client.create_message(payload.channel_id, "", embed)
      end
    else
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Too few arguments"
      )
      client.create_message(payload.channel_id, "", embed)
    end
  end
end
# temperature
client.on_message_create do |payload|
  next if payload.author.bot
  if (payload.content.starts_with? PREFIX[0] + "temperature") || (payload.content.starts_with? PREFIX[1] + "temperature") || (payload.content.starts_with? PREFIX[2] + "temperature") || (payload.content.starts_with? PREFIX[3] + "temperature") || (payload.content.starts_with? PREFIX[4] + "temperature")
    pres = payload.content.gsub("<@443053627419000833> ", "<@443053627419000833>").gsub("<@!443053627419000833> ", "<@!443053627419000833>")
    argscount = pres.split(" ")
    if argscount.size > 4
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Too many arguments"
      )
      client.create_message(payload.channel_id, "", embed)
    elsif argscount.size > 3
      acro = pres.gsub("temperature ", "").gsub("<@443053627419000833> ", "").gsub("<@443053627419000833>", "").gsub("<@!443053627419000833>", "").gsub("<@!443053627419000833> ", "").gsub("--", "")
      acroo = acro.split(" ")
      embeded = Discord::Embed.new(
        timestamp: Time.now,
        colour: 0xffff00,
        title: "Only Numbers Please"
      )
      next client.create_message(payload.channel_id, "", embeded) unless acroo[0].to_s.match(/^[0-9_\-+ ]*$/)
      begin
        bef = acroo[1].to_s.downcase
        aft = acroo[2].to_s.downcase
        t = acroo[0]
        if bef == "celsius" || bef == "c"
          if aft == "celsius" || aft == "c"
            done = "INFINITY"
          elsif aft == "kelvin" || aft == "k"
            done = t.to_i + 273.15
          elsif aft == "fahrenheit" || aft == "f"
            prepare = t.to_i * 1.8
            done = prepare + 32
          else
            embed = Discord::Embed.new(
              timestamp: Time.now,
              colour: 0xffff00,
              title: "Check what you have typed and try again !"
            )
            client.create_message(payload.channel_id, "", embed)
          end
        elsif bef == "fahrenheit" || bef == "f"
          if aft == "celsius" || aft == "c"
            prepare = t.to_i - 32
            done = prepare / 1.8
          elsif aft == "kelvin" || aft == "k"
            prepare = t.to_i + 459.67
            done = prepare / 1.8
          elsif aft == "fahrenheit" || aft == "f"
            done = "INFINITY"
          else
            embed = Discord::Embed.new(
              timestamp: Time.now,
              colour: 0xffff00,
              title: "Check what you have typed and try again !"
            )
            client.create_message(payload.channel_id, "", embed)
          end
        elsif bef == "kelvin" || bef == "k"
          if aft == "celsius" || aft == "c"
            done = t.to_i - 273.15
          elsif aft == "kelvin" || aft == "k"
            done = "INFINITY"
          elsif aft == "fahrenheit" || aft == "f"
            prepare = t.to_i * 1.8
            done = prepare - 459.67
          else
            embed = Discord::Embed.new(
              timestamp: Time.now,
              colour: 0xffff00,
              title: "Check what you have typed and try again !"
            )
            client.create_message(payload.channel_id, "", embed)
          end
        else
          embed = Discord::Embed.new(
            timestamp: Time.now,
            colour: 0xffff00,
            title: "Check what you have typed and try again !"
          )
          client.create_message(payload.channel_id, "", embed)
        end
        embed = Discord::Embed.new(
          timestamp: Time.now,
          colour: 0xffff00,
          title: "#{done} #{aft.upcase}"
        )
        client.create_message(payload.channel_id, "", embed)
      rescue
        embed = Discord::Embed.new(
          timestamp: Time.now,
          colour: 0xffff00,
          title: "Check what you have typed and try again !"
        )
        client.create_message(payload.channel_id, "", embed)
      end
    else
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Too few arguments"
      )
      client.create_message(payload.channel_id, "", embed)
    end
  end
end
# lowercase
client.on_message_create do |payload|
  next if payload.author.bot
  if (payload.content.starts_with? PREFIX[0] + "lowercase") || (payload.content.starts_with? PREFIX[1] + "lowercase") || (payload.content.starts_with? PREFIX[2] + "lowercase") || (payload.content.starts_with? PREFIX[3] + "lowercase") || (payload.content.starts_with? PREFIX[4] + "lowercase")
    pres = payload.content.gsub("<@443053627419000833> ", "<@443053627419000833>").gsub("<@!443053627419000833> ", "<@!443053627419000833>")
    argscount = pres.split(" ")
    if argscount.size > 1
      acro = pres.gsub("lowercase ", "").gsub("<@443053627419000833> ", "").gsub("<@443053627419000833>", "").gsub("<@!443053627419000833>", "").gsub("<@!443053627419000833> ", "").gsub("--", "")
      begin
        embed = Discord::Embed.new(
          timestamp: Time.now,
          colour: 0xffff00,
          title: "#{acro.downcase}"
        )
        client.create_message(payload.channel_id, "", embed)
      rescue
        embed = Discord::Embed.new(
          timestamp: Time.now,
          colour: 0xffff00,
          title: "Error",
          url: "https://geopjr.xyz"
        )
        client.create_message(payload.channel_id, "", embed)
      end
    else
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Too few arguments"
      )
      client.create_message(payload.channel_id, "", embed)
    end
  end
end
# uppercase
client.on_message_create do |payload|
  next if payload.author.bot
  if (payload.content.starts_with? PREFIX[0] + "uppercase") || (payload.content.starts_with? PREFIX[1] + "uppercase") || (payload.content.starts_with? PREFIX[2] + "uppercase") || (payload.content.starts_with? PREFIX[3] + "uppercase") || (payload.content.starts_with? PREFIX[4] + "uppercase")
    pres = payload.content.gsub("<@443053627419000833> ", "<@443053627419000833>").gsub("<@!443053627419000833> ", "<@!443053627419000833>")
    argscount = pres.split(" ")
    if argscount.size > 1
      acro = pres.gsub("uppercase ", "").gsub("<@443053627419000833> ", "").gsub("<@443053627419000833>", "").gsub("<@!443053627419000833>", "").gsub("<@!443053627419000833> ", "").gsub("--", "")
      begin
        embed = Discord::Embed.new(
          timestamp: Time.now,
          colour: 0xffff00,
          title: "#{acro.upcase}"
        )
        client.create_message(payload.channel_id, "", embed)
      rescue
        embed = Discord::Embed.new(
          timestamp: Time.now,
          colour: 0xffff00,
          title: "Error",
          url: "https://geopjr.xyz"
        )
        client.create_message(payload.channel_id, "", embed)
      end
    else
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Too few arguments"
      )
      client.create_message(payload.channel_id, "", embed)
    end
  end
end
# reverse
client.on_message_create do |payload|
  next if payload.author.bot
  if (payload.content.starts_with? PREFIX[0] + "reverse") || (payload.content.starts_with? PREFIX[1] + "reverse") || (payload.content.starts_with? PREFIX[2] + "reverse") || (payload.content.starts_with? PREFIX[3] + "reverse") || (payload.content.starts_with? PREFIX[4] + "reverse")
    pres = payload.content.gsub("<@443053627419000833> ", "<@443053627419000833>").gsub("<@!443053627419000833> ", "<@!443053627419000833>")
    argscount = pres.split(" ")
    if argscount.size > 1
      acro = pres.gsub("reverse ", "").gsub("<@443053627419000833> ", "").gsub("<@443053627419000833>", "").gsub("<@!443053627419000833>", "").gsub("<@!443053627419000833> ", "").gsub("--", "")
      begin
        embed = Discord::Embed.new(
          timestamp: Time.now,
          colour: 0xffff00,
          title: "#{acro.reverse.to_s}"
        )
        client.create_message(payload.channel_id, "", embed)
      rescue
        embed = Discord::Embed.new(
          timestamp: Time.now,
          colour: 0xffff00,
          title: "Error",
          url: "https://geopjr.xyz"
        )
        client.create_message(payload.channel_id, "", embed)
      end
    else
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Too few arguments"
      )
      client.create_message(payload.channel_id, "", embed)
    end
  end
end
# restart
client.on_message_create do |payload|
  next if payload.author.bot
  if (payload.content.starts_with? PREFIX[0] + "restart") || (payload.content.starts_with? PREFIX[1] + "restart") || (payload.content.starts_with? PREFIX[2] + "restart") || (payload.content.starts_with? PREFIX[3] + "restart") || (payload.content.starts_with? PREFIX[4] + "restart")
    if payload.author.id == 216156825978929152_u64
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Restarting"
      )
      client.create_message(payload.channel_id, "", embed)
      client.stop
      exit
    end
  end
end
# server
client.on_message_create do |payload|
  next if payload.author.bot
  if (payload.content.starts_with? PREFIX[0] + "server") || (payload.content.starts_with? PREFIX[1] + "server") || (payload.content.starts_with? PREFIX[2] + "server") || (payload.content.starts_with? PREFIX[3] + "server") || (payload.content.starts_with? PREFIX[4] + "server")
    begin
      if guild_id = client.get_channel(payload.channel_id).guild_id
        guild_id # => Snowflake
        server = client.get_guild(guild_id)
        embed = Discord::Embed.new(
          timestamp: Time.now,
          colour: 0xffff00,
          title: "**Server Info**",
          thumbnail: Discord::EmbedThumbnail.new(
            url: "https://cdn.discordapp.com/icons/#{server.id}/#{server.icon}"
          ),
          fields: [
            Discord::EmbedField.new(name: "__Name__", value: "**#{server.name}**", inline: true),
            Discord::EmbedField.new(name: "__ID__", value: "**#{server.id}**", inline: true),
            Discord::EmbedField.new(name: "__Region__", value: "**#{server.region}**", inline: true),
            Discord::EmbedField.new(name: "__Owner__", value: "**<@#{server.owner_id}>**", inline: true),
            Discord::EmbedField.new(name: "__Roles__", value: "**#{server.roles.size}**", inline: true),
            Discord::EmbedField.new(name: "__Channels__", value: "**#{cachee.guild_channels(guild_id).size}**", inline: true),
          ]
        )
        client.create_message(payload.channel_id, "", embed)
      else
        embed = Discord::Embed.new(
          colour: 0xffff00,
          title: "This is not a server"
        )
        client.create_message(payload.channel_id, "", embed)
      end
    rescue
      if guild_id = client.get_channel(payload.channel_id).guild_id
        guild_id # => Snowflake
        server = client.get_guild(guild_id)
        embed = Discord::Embed.new(
          timestamp: Time.now,
          colour: 0xffff00,
          title: "**Server Info**",
          thumbnail: Discord::EmbedThumbnail.new(
            url: "https://cdn.discordapp.com/icons/#{server.id}/#{server.icon}"
          ),
          fields: [
            Discord::EmbedField.new(name: "__Name__", value: "**#{server.name}**", inline: true),
            Discord::EmbedField.new(name: "__ID__", value: "**#{server.id}**", inline: true),
            Discord::EmbedField.new(name: "__Region__", value: "**#{server.region}**", inline: true),
            Discord::EmbedField.new(name: "__Owner__", value: "**<@#{server.owner_id}>**", inline: true),
          ]
        )
        client.create_message(payload.channel_id, "", embed)
      else
        embed = Discord::Embed.new(
          colour: 0xffff00,
          title: "This is not a server"
        )
        client.create_message(payload.channel_id, "", embed)
      end
    end
  end
end

client.on_ready do |things|
  servers = things.guilds.size
  token = "-" # your discordbots.org token
  headers = HTTP::Headers{"Authorization" => token, "Content-Type" => "application/json"}
  body = {"server_count" => servers}.to_json
  HTTP::Client.post("https://discordbots.org/api/bots/443053627419000833/stats", headers: headers, body: body) do |res|
    status = res.status_code
    if status != 200
      puts "1Uh oh! Stats update responded with status #{status}!"
    end
  end
  tokenn = "-"
  headerss = HTTP::Headers{"Authorization" => tokenn, "Content-Type" => "application/json"}
  bodyy = {"server_count" => servers}.to_json
  HTTP::Client.post("https://bots.discord.pw/api/bots/443053627419000833/stats", headers: headerss, body: bodyy) do |res|
    statuss = res.status_code
    if statuss != 200
      puts "2Uh oh! Stats update responded with status #{statuss}!"
    elsif statuss == 204
      # nothing
    end
  end
  tokennn = "-"
  headersss = HTTP::Headers{"Authorization" => tokennn, "Content-Type" => "application/json"}
  bodyyy = {"guilds" => servers}.to_json
  HTTP::Client.post("https://discordbot.world/api/bot/443053627419000833/stats", headers: headersss, body: bodyyy) do |res|
    statusss = res.status_code
    if statusss != 200
      puts "3Uh oh! Stats update responded with status #{statusss}!"
    end
  end
  client.status_update("online", Discord::GamePlaying.new(name: "--help | in #{servers} servers", type: 2_i64))
end

client.run
