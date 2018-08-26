require "discordcr"
require "json"
require "http/client"

client = Discord::Client.new(token: "Bot token", client_id: 443053627419000833_u64)

PREFIX  = ["--", "<@443053627419000833>", "<@443053627419000833> "]
VERSION = "1.5"
UPTIMER = Time.utc_now

# uptime
client.on_message_create do |payload|
  next if payload.author.bot
  if (payload.content.starts_with? PREFIX[0] + "uptime") || (payload.content.starts_with? PREFIX[1] + "uptime") || (payload.content.starts_with? PREFIX[2] + "uptime")
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
    if (payload.content.starts_with? PREFIX[0] + "help") || (payload.content.starts_with? PREFIX[1] + "help") || (payload.content.starts_with? PREFIX[2] + "help") || (payload.content == PREFIX[1]) || (payload.content == PREFIX[2])
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
          icon_url: "https://cdn.discordapp.com/avatars/443053627419000833/0da891379e4d9d7af31b27ec67c49a3b.png"
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
    if (payload.content.starts_with? PREFIX[0] + "info") || (payload.content.starts_with? PREFIX[1] + "info") || (payload.content.starts_with? PREFIX[2] + "info")
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
          icon_url: "https://cdn.discordapp.com/avatars/443053627419000833/0da891379e4d9d7af31b27ec67c49a3b.png"
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
  if (payload.content.starts_with? PREFIX[0] + "bara") || (payload.content.starts_with? PREFIX[1] + "bara") || (payload.content.starts_with? PREFIX[2] + "bara")
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
      response = HTTP::Client.get "https://barapi.000webhostapp.com/api/random.php"
      value = JSON.parse(response.body)
      embed = Discord::Embed.new(
        timestamp: Time.now,
        colour: 0xffff00,
        image: Discord::EmbedImage.new(
          url: "#{value[0].as_s}"
        ),
        footer: Discord::EmbedFooter.new(
          text: "https://barapi.geopjr.xyz/"
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
# DDG
client.on_message_create do |payload|
  next if payload.author.bot
  if (payload.content.starts_with? PREFIX[0] + "ddg") || (payload.content.starts_with? PREFIX[1] + "ddg") || (payload.content.starts_with? PREFIX[2] + "ddg")
    pres = payload.content.gsub("<@443053627419000833> ", "<@443053627419000833>")
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
  if (payload.content.starts_with? PREFIX[0] + "google") || (payload.content.starts_with? PREFIX[1] + "google") || (payload.content.starts_with? PREFIX[2] + "google")
    pres = payload.content.gsub("<@443053627419000833> ", "<@443053627419000833>")
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
  if (payload.content.starts_with? PREFIX[0] + "lmgtfy") || (payload.content.starts_with? PREFIX[1] + "lmgtfy") || (payload.content.starts_with? PREFIX[2] + "lmgtfy")
    pres = payload.content.gsub("<@443053627419000833> ", "<@443053627419000833>")
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
  if (payload.content.starts_with? PREFIX[0] + "avatar") || (payload.content.starts_with? PREFIX[1] + "avatar") || (payload.content.starts_with? PREFIX[2] + "avatar")
    pres = payload.content.gsub("<@443053627419000833> ", "<@443053627419000833>")
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

# tanki
client.on_message_create do |payload|
  next if payload.author.bot
  if (payload.content.starts_with? PREFIX[0] + "tanki") || (payload.content.starts_with? PREFIX[1] + "tanki") || (payload.content.starts_with? PREFIX[2] + "tanki")
    pres = payload.content.gsub("<@443053627419000833> ", "<@443053627419000833>")
    argscount = pres.split(" ")
    if argscount.size > 2
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Too many arguments"
      )
      client.create_message(payload.channel_id, "", embed)
    elsif argscount.size > 1
      argss = pres.gsub("tanki ", "").gsub("<@443053627419000833> ", "").gsub("<@443053627419000833>", "").gsub("--", "")
      begin
        response = HTTP::Client.get "https://ratings.tankionline.com/api/eu/profile/?user=#{argss}&lang=en"
        value = JSON.parse(response.body)
        if value["response"]["hasPremium"] == false
          if value["response"]["rank"] == 1
            rank = "Recruit"
            rimg = "https://i.imgur.com/ZcBNexc.png"
          elsif value["response"]["rank"] == 2
            rank = "Private"
            rimg = "https://i.imgur.com/Jaar0MF.png"
          elsif value["response"]["rank"] == 3
            rank = "Gefreiter"
            rimg = "https://i.imgur.com/j2DfBdW.png"
          elsif value["response"]["rank"] == 4
            rank = "Corporal"
            rimg = "https://i.imgur.com/7Pn4X88.png"
          elsif value["response"]["rank"] == 5
            rank = "Master Corporal"
            rimg = "https://i.imgur.com/WKZ0sVp.png"
          elsif value["response"]["rank"] == 6
            rank = "Sergeant"
            rimg = "https://i.imgur.com/O2WuJAJ.png"
          elsif value["response"]["rank"] == 7
            rank = "Staff Sergeant"
            rimg = "https://i.imgur.com/bTQLm9h.png"
          elsif value["response"]["rank"] == 8
            rank = "Master Sergeant"
            rimg = "https://i.imgur.com/VvivZg0.png"
          elsif value["response"]["rank"] == 9
            rank = "First Sergeant"
            rimg = "https://i.imgur.com/rCkln3K.png"
          elsif value["response"]["rank"] == 10
            rank = "Sergeant-Major"
            rimg = "https://i.imgur.com/xCKvB2G.png"
          elsif value["response"]["rank"] == 11
            rank = "Warrant Officer 1"
            rimg = "https://i.imgur.com/TJKJ4eB.png"
          elsif value["response"]["rank"] == 12
            rank = "Warrant Officer 2"
            rimg = "https://i.imgur.com/Q8U5QIz.png"
          elsif value["response"]["rank"] == 13
            rank = "Warrant Officer 3"
            rimg = "https://i.imgur.com/Ygi65T7.png"
          elsif value["response"]["rank"] == 14
            rank = "Warrant Officer 4"
            rimg = "https://i.imgur.com/rx0zDOR.png"
          elsif value["response"]["rank"] == 15
            rank = "Warrant Officer 5"
            rimg = "https://i.imgur.com/jDmMo5j.png"
          elsif value["response"]["rank"] == 16
            rank = "Third Lieutenant"
            rimg = "https://i.imgur.com/LLvlTZY.png"
          elsif value["response"]["rank"] == 17
            rank = "Second Lieutenant"
            rimg = "https://i.imgur.com/1Oor2V6.png"
          elsif value["response"]["rank"] == 18
            rank = "First Lieutenant"
            rimg = "https://i.imgur.com/03s6YiZ.png"
          elsif value["response"]["rank"] == 19
            rank = "Captain"
            rimg = "https://i.imgur.com/kf8Uo7U.png"
          elsif value["response"]["rank"] == 20
            rank = "Major"
            rimg = "https://i.imgur.com/Zl9q3rP.png"
          elsif value["response"]["rank"] == 21
            rank = "Lieutenant Colonel"
            rimg = "https://i.imgur.com/bmTEps1.png"
          elsif value["response"]["rank"] == 22
            rank = "Colonel"
            rimg = "https://i.imgur.com/Ac9S6w7.png"
          elsif value["response"]["rank"] == 23
            rank = "Brigadier"
            rimg = "https://i.imgur.com/vBo95NA.png"
          elsif value["response"]["rank"] == 24
            rank = "Major General"
            rimg = "https://i.imgur.com/YOuPegl.png"
          elsif value["response"]["rank"] == 25
            rank = "Lieutenant General"
            rimg = "https://i.imgur.com/dYh43EF.png"
          elsif value["response"]["rank"] == 26
            rank = "General"
            rimg = "https://i.imgur.com/59NrDOX.png"
          elsif value["response"]["rank"] == 27
            rank = "Marshal"
            rimg = "https://i.imgur.com/S4smUqx.png"
          elsif value["response"]["rank"] == 28
            rank = "Field Marshal"
            rimg = "https://i.imgur.com/DRmWUfj.png"
          elsif value["response"]["rank"] == 29
            rank = "Commander"
            rimg = "https://i.imgur.com/lZu9Rqt.png"
          elsif value["response"]["rank"] == 30
            rank = "Generalissimo"
            rimg = "https://i.imgur.com/Fggz9xh.png"
          elsif value["response"]["rank"].as_i > 31
            numrank = value["response"]["rank"].as_i - 30
            rank = "Legend #{numrank}"
            rimg = "https://i.imgur.com/NahcZQ9.png"
          else
            value["response"]["rank"] == 31
            rank = "Legend"
            rimg = "https://i.imgur.com/NahcZQ9.png"
          end
        elsif value["response"]["hasPremium"] == true
          if value["response"]["rank"] == 1
            rank = "Recruit"
            rimg = "https://i.imgur.com/ZcBNexc.png"
          elsif value["response"]["rank"] == 2
            rank = "Private"
            rimg = "https://i.imgur.com/Jaar0MF.png"
          elsif value["response"]["rank"] == 3
            rank = "Gefreiter"
            rimg = "https://i.imgur.com/j2DfBdW.png"
          elsif value["response"]["rank"] == 4
            rank = "Corporal"
            rimg = "https://i.imgur.com/7Pn4X88.png"
          elsif value["response"]["rank"] == 5
            rank = "Master Corporal"
            rimg = "https://i.imgur.com/WKZ0sVp.png"
          elsif value["response"]["rank"] == 6
            rank = "Sergeant"
            rimg = "https://i.imgur.com/O2WuJAJ.png"
          elsif value["response"]["rank"] == 7
            rank = "Staff Sergeant"
            rimg = "https://i.imgur.com/bTQLm9h.png"
          elsif value["response"]["rank"] == 8
            rank = "Master Sergeant"
            rimg = "https://i.imgur.com/VvivZg0.png"
          elsif value["response"]["rank"] == 9
            rank = "First Sergeant"
            rimg = "https://i.imgur.com/rCkln3K.png"
          elsif value["response"]["rank"] == 10
            rank = "Sergeant-Major"
            rimg = "https://i.imgur.com/uOXqDLo.png"
          elsif value["response"]["rank"] == 11
            rank = "Warrant Officer 1"
            rimg = "https://i.imgur.com/sEzBbLQ.png"
          elsif value["response"]["rank"] == 12
            rank = "Warrant Officer 2"
            rimg = "https://i.imgur.com/EZJslol.png"
          elsif value["response"]["rank"] == 13
            rank = "Warrant Officer 3"
            rimg = "https://i.imgur.com/xMboj6l.png"
          elsif value["response"]["rank"] == 14
            rank = "Warrant Officer 4"
            rimg = "https://i.imgur.com/qLzwet8.png"
          elsif value["response"]["rank"] == 15
            rank = "Warrant Officer 5"
            rimg = "https://i.imgur.com/0hKtwX2.png"
          elsif value["response"]["rank"] == 16
            rank = "Third Lieutenant"
            rimg = "https://i.imgur.com/Miz0wqt.png"
          elsif value["response"]["rank"] == 17
            rank = "Second Lieutenant"
            rimg = "https://i.imgur.com/qkTXhJR.png"
          elsif value["response"]["rank"] == 18
            rank = "First Lieutenant"
            rimg = "https://i.imgur.com/VeA0ugN.png"
          elsif value["response"]["rank"] == 19
            rank = "Captain"
            rimg = "https://i.imgur.com/INKmQMy.png"
          elsif value["response"]["rank"] == 20
            rank = "Major"
            rimg = "https://i.imgur.com/hJL5fqH.png"
          elsif value["response"]["rank"] == 21
            rank = "Lieutenant Colonel"
            rimg = "https://i.imgur.com/QpggknT.png"
          elsif value["response"]["rank"] == 22
            rank = "Colonel"
            rimg = "https://i.imgur.com/9dg1YYq.png"
          elsif value["response"]["rank"] == 23
            rank = "Brigadier"
            rimg = "https://i.imgur.com/Af6FJjE.png"
          elsif value["response"]["rank"] == 24
            rank = "Major General"
            rimg = "https://i.imgur.com/SYIelDs.png"
          elsif value["response"]["rank"] == 25
            rank = "Lieutenant General"
            rimg = "https://i.imgur.com/J7ob7co.png"
          elsif value["response"]["rank"] == 26
            rank = "General"
            rimg = "https://i.imgur.com/laq0luJ.png"
          elsif value["response"]["rank"] == 27
            rank = "Marshal"
            rimg = "https://i.imgur.com/4QzfKbh.png"
          elsif value["response"]["rank"] == 28
            rank = "Field Marshal"
            rimg = "https://i.imgur.com/LVcFtIW.png"
          elsif value["response"]["rank"] == 29
            rank = "Commander"
            rimg = "https://i.imgur.com/YLKv7Qy.png"
          elsif value["response"]["rank"] == 30
            rank = "Generalissimo"
            rimg = "https://i.imgur.com/i8lKuZh.png"
          elsif value["response"]["rank"].as_i > 31
            numrank = value["response"]["rank"].as_i - 30
            rank = "Legend #{numrank}"
            rimg = "https://i.imgur.com/qK6onnG.png"
          else
            value["response"]["rank"] == 31
            rank = "Legend"
            rimg = "https://i.imgur.com/qK6onnG.png"
          end
        end

        exp = value["response"]["score"]
        expc = value["response"]["scoreNext"]
        nex = value["response"]["scoreNext"].as_i - value["response"]["score"].as_i
        if value["response"]["hasPremium"] == false
          prem = "<:xmark:314349398824058880>"
        else
          value["response"]["hasPremium"] == true
          prem = "<:check:314349398811475968>"
        end
        crys = value["response"]["earnedCrystals"]
        gold = value["response"]["caughtGolds"]
        kills = value["response"]["kills"]
        deaths = value["response"]["deaths"]
        kd = kills.as_i.to_f / deaths.as_i
        if value["response"]["rating"]["efficiency"]["position"] == -1
          eplac = "-"
        else
          eplac = value["response"]["rating"]["efficiency"]["position"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse
        end
        if value["response"]["rating"]["efficiency"]["value"] == -1
          evalu = "-"
        else
          evalu = value["response"]["rating"]["efficiency"]["value"].as_i.round(-2).to_s.chomp("00").to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse
        end
        if value["response"]["rating"]["score"]["position"] == -1
          explac = "-"
        else
          explac = value["response"]["rating"]["score"]["position"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse
        end
        if value["response"]["rating"]["score"]["value"] == -1
          exvalu = "-"
        else
          exvalu = value["response"]["rating"]["score"]["value"].to_s.chomp("00").to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse
        end
        if value["response"]["rating"]["golds"]["position"] == -1
          gplac = "-"
        else
          gplac = value["response"]["rating"]["golds"]["position"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse
        end
        if value["response"]["rating"]["golds"]["value"] == -1
          gvalu = "-"
        else
          gvalu = value["response"]["rating"]["golds"]["value"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse
        end
        if value["response"]["rating"]["crystals"]["position"] == -1
          cryplac = "-"
        else
          cryplac = value["response"]["rating"]["crystals"]["position"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse
        end
        if value["response"]["rating"]["crystals"]["value"] == -1
          cryvalu = "-"
        else
          cryvalu = value["response"]["rating"]["crystals"]["value"].to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse
        end

        mines = value["response"]["suppliesUsage"][3]["usages"]
        repair = value["response"]["suppliesUsage"][4]["usages"]
        golbo = value["response"]["suppliesUsage"][1]["usages"]
        darm = value["response"]["suppliesUsage"][0]["usages"]
        spebo = value["response"]["suppliesUsage"][2]["usages"]
        ddu = value["response"]["suppliesUsage"][5]["usages"]
        bu = value["response"]["suppliesUsage"][6]["usages"]

        embed = Discord::Embed.new(
          timestamp: Time.now,
          colour: 0xffff00,
          title: "Stats of #{argss}",
          footer: Discord::EmbedFooter.new(
            text: "\xE3\x80\x8EGeop\xE3\x80\x8F#4066",
            icon_url: "https://cdn.discordapp.com/avatars/216156825978929152/c7eaee00bbe99b16304429fb9b9116ea.png"
          ),
          url: "http://ratings.tankionline.com/en/user/#{argss}/",
          thumbnail: Discord::EmbedThumbnail.new(
            url: "#{rimg}"
          ),
          author: Discord::EmbedAuthor.new(
            name: "Granz#8561",
            icon_url: "https://cdn.discordapp.com/avatars/443053627419000833/0da891379e4d9d7af31b27ec67c49a3b.png"
          ),
          fields: [Discord::EmbedField.new(
            name: "__Name__",
            value: "#{value["response"]["name"]}"
          ),
                   Discord::EmbedField.new(
                     name: "__Rank__",
                     value: "#{rank}"
                   ),
                   Discord::EmbedField.new(
                     name: "__Premium__",
                     value: "#{prem}"
                   ),
                   Discord::EmbedField.new(
                     name: "__EXP__",
                     value: "#{exp.to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}/#{expc.to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}"
                   ),
                   Discord::EmbedField.new(
                     name: "__EXP left to rank up__",
                     value: "#{nex.to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse} exp"
                   ),
                   Discord::EmbedField.new(
                     name: "__Caught Golden Boxes__",
                     value: "#{gold.to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}"
                   ),
                   Discord::EmbedField.new(
                     name: "__Obtained Crystals__",
                     value: "#{crys.to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}"
                   ),
                   Discord::EmbedField.new(
                     name: "__Kills__",
                     value: "#{kills.to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}",
                     inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__Deaths__",
                     value: "#{deaths.to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}",
                     inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__K/D Ratio__",
                     value: "#{kd.round(2)}",
                     inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__Efficiency Rating Place | Value__",
                     value: "#{eplac} | #{evalu}",
                   ),
                   Discord::EmbedField.new(
                     name: "__Experience Rating Place | Value__",
                     value: "#{explac} | #{exvalu}",
                   ),
                   Discord::EmbedField.new(
                     name: "__Gold Box Rating Place | Value__",
                     value: "#{gplac} | #{gvalu}",
                   ),
                   Discord::EmbedField.new(
                     name: "__Crystals Rating Place | Value__",
                     value: "#{cryplac} | #{cryvalu}",
                   ),
                   Discord::EmbedField.new(
                     name: "__Mines Used__",
                     value: "#{mines.to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}",
                     inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__Repair Kits Used__",
                     value: "#{repair.to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}",
                     inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__Gold Boxes Used__",
                     value: "#{golbo.to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}",
                     inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__Double Armors Used__",
                     value: "#{darm.to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}",
                     inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__Speed Boosts__",
                     value: "#{spebo.to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}",
                     inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__Double Damage Used__",
                     value: "#{ddu.to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}",
                     inline: true
                   ),
                   Discord::EmbedField.new(
                     name: "__Batteries Used__",
                     value: "#{bu.to_s.reverse.gsub(/(\d{3})(?=\d)/, "\\1,").reverse}",
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
  if (payload.content.starts_with? PREFIX[0] + "acronym") || (payload.content.starts_with? PREFIX[1] + "acronym") || (payload.content.starts_with? PREFIX[2] + "acronym")
    pres = payload.content.gsub("<@443053627419000833> ", "<@443053627419000833>")
    argscount = pres.split(" ")
    if argscount.size > 2
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Too many arguments"
      )
      client.create_message(payload.channel_id, "", embed)
    elsif argscount.size > 1
      acro = pres.gsub("acronym ", "").gsub("<@443053627419000833> ", "").gsub("<@443053627419000833>", "").gsub("--", "")
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
  if (payload.content.starts_with? PREFIX[0] + "bird") || (payload.content.starts_with? PREFIX[1] + "bird") || (payload.content.starts_with? PREFIX[2] + "bird")
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
  if (payload.content.starts_with? PREFIX[0] + "doge") || (payload.content.starts_with? PREFIX[1] + "doge") || (payload.content.starts_with? PREFIX[2] + "doge")
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
  if (payload.content.starts_with? PREFIX[0] + "cat") || (payload.content.starts_with? PREFIX[1] + "cat") || (payload.content.starts_with? PREFIX[2] + "cat")
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
  if (payload.content.starts_with? PREFIX[0] + "coffee") || (payload.content.starts_with? PREFIX[1] + "coffee") || (payload.content.starts_with? PREFIX[2] + "coffee")
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
  if (payload.content.starts_with? PREFIX[0] + "cookie") || (payload.content.starts_with? PREFIX[1] + "cookie") || (payload.content.starts_with? PREFIX[2] + "cookie")
    channel = client.get_channel(payload.channel_id)
    begin
      response = HTTP::Client.get "http://www.yerkee.com/api/fortune"
      value = JSON.parse(response.body)
      embed = Discord::Embed.new(
        timestamp: Time.now,
        colour: 0xffff00,
        image: Discord::EmbedImage.new(
          url: "#{value["fortune"].as_s}"
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
# dog
client.on_message_create do |payload|
  next if payload.author.bot
  if (payload.content.starts_with? PREFIX[0] + "dog") || (payload.content.starts_with? PREFIX[1] + "dog") || (payload.content.starts_with? PREFIX[2] + "dog")
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
  if (payload.content.starts_with? PREFIX[0] + "fox") || (payload.content.starts_with? PREFIX[1] + "fox") || (payload.content.starts_with? PREFIX[2] + "fox")
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
  if (payload.content.starts_with? PREFIX[0] + "id") || (payload.content.starts_with? PREFIX[1] + "id") || (payload.content.starts_with? PREFIX[2] + "id")
    pres = payload.content.gsub("<@443053627419000833> ", "<@443053627419000833>")
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
  if (payload.content.starts_with? PREFIX[0] + "trump") || (payload.content.starts_with? PREFIX[1] + "trump") || (payload.content.starts_with? PREFIX[2] + "trump")
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
  if (payload.content.starts_with? PREFIX[0] + "joke") || (payload.content.starts_with? PREFIX[1] + "joke") || (payload.content.starts_with? PREFIX[2] + "joke")
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
  if (payload.content.starts_with? PREFIX[0] + "norris") || (payload.content.starts_with? PREFIX[1] + "norris") || (payload.content.starts_with? PREFIX[2] + "norris")
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
  if (payload.content.starts_with? PREFIX[0] + "neko") || (payload.content.starts_with? PREFIX[1] + "neko") || (payload.content.starts_with? PREFIX[2] + "neko")
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
    if (payload.content.starts_with? PREFIX[0] + "blush") || (payload.content.starts_with? PREFIX[1] + "blush") || (payload.content.starts_with? PREFIX[2] + "blush")
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
  if (payload.content.starts_with? PREFIX[0] + "amiibo") || (payload.content.starts_with? PREFIX[1] + "amiibo") || (payload.content.starts_with? PREFIX[2] + "amiibo")
    pres = payload.content.gsub("<@443053627419000833> ", "<@443053627419000833>")
    argscount = pres.split(" ")
    if argscount.size > 2
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Too many arguments"
      )
      client.create_message(payload.channel_id, "", embed)
    elsif argscount.size > 1
      argss = pres.gsub("amiibo ", "").gsub("<@443053627419000833> ", "").gsub("<@443053627419000833>", "").gsub("--", "")
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
            icon_url: "https://cdn.discordapp.com/avatars/443053627419000833/0da891379e4d9d7af31b27ec67c49a3b.png"
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
  if (payload.content.starts_with? PREFIX[0] + "algebra") || (payload.content.starts_with? PREFIX[1] + "algebra") || (payload.content.starts_with? PREFIX[2] + "algebra")
    pres = payload.content.gsub("<@443053627419000833> ", "<@443053627419000833>")
    argscount = pres.split(" ")
    if argscount.size > 1
      argss = pres.gsub("algebra ", "").gsub("<@443053627419000833> ", "").gsub("<@443053627419000833>", "").gsub("--", "")
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
  if (payload.content.starts_with? PREFIX[0] + "achievement") || (payload.content.starts_with? PREFIX[1] + "achievement") || (payload.content.starts_with? PREFIX[2] + "achievement")
    pres = payload.content.gsub("<@443053627419000833> ", "<@443053627419000833>")
    argscount = pres.split(" ")
    if argscount.size > 1
      argss = pres.gsub("achievement ", "").gsub("<@443053627419000833> ", "").gsub("<@443053627419000833>", "").gsub("--", "")
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
  if (payload.content.starts_with? PREFIX[0] + "choose") || (payload.content.starts_with? PREFIX[1] + "choose") || (payload.content.starts_with? PREFIX[2] + "choose")
    pres = payload.content.gsub("<@443053627419000833> ", "<@443053627419000833>")
    argscount = pres.split(" ")
    if argscount.size > 2
      argss = pres.gsub("choose ", "").gsub("<@443053627419000833> ", "").gsub("<@443053627419000833>", "").gsub("--", "")
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
  if (payload.content.starts_with? PREFIX[0] + "howcute") || (payload.content.starts_with? PREFIX[1] + "howcute") || (payload.content.starts_with? PREFIX[2] + "howcute")
    pres = payload.content.gsub("<@443053627419000833> ", "<@443053627419000833>")
    argscount = pres.split(" ")
    if argscount.size > 1
      arr = (0..100).to_a
      argss = pres.gsub("howcute ", "").gsub("<@443053627419000833> ", "").gsub("<@443053627419000833>", "").gsub("--", "")
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
  if (payload.content.starts_with? PREFIX[0] + "howgay") || (payload.content.starts_with? PREFIX[1] + "howgay") || (payload.content.starts_with? PREFIX[2] + "howgay")
    pres = payload.content.gsub("<@443053627419000833> ", "<@443053627419000833>")
    argscount = pres.split(" ")
    if argscount.size > 1
      arr = (0..100).to_a
      argss = pres.gsub("howgay ", "").gsub("<@443053627419000833> ", "").gsub("<@443053627419000833>", "").gsub("--", "")
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
  if (payload.content.starts_with? PREFIX[0] + "rate ") || (payload.content.starts_with? PREFIX[1] + "rate ") || (payload.content.starts_with? PREFIX[2] + "rate ")
    pres = payload.content.gsub("<@443053627419000833> ", "<@443053627419000833>")
    argscount = pres.split(" ")
    if argscount.size > 1
      arr = (0..10).to_a
      argss = pres.gsub("rate ", "").gsub("<@443053627419000833> ", "").gsub("<@443053627419000833>", "").gsub("--", "")
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
  if (payload.content.starts_with? PREFIX[0] + "yesno") || (payload.content.starts_with? PREFIX[1] + "yesno") || (payload.content.starts_with? PREFIX[2] + "yesno")
    pres = payload.content.gsub("<@443053627419000833> ", "<@443053627419000833>")
    argscount = pres.split(" ")
    if argscount.size > 1
      arr = ["Yes.", "No."]
      argss = pres.gsub("yesno ", "").gsub("<@443053627419000833> ", "").gsub("<@443053627419000833>", "").gsub("--", "")
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
  if (payload.content.starts_with? PREFIX[0] + "ratewaifu") || (payload.content.starts_with? PREFIX[1] + "ratewaifu") || (payload.content.starts_with? PREFIX[2] + "ratewaifu")
    pres = payload.content.gsub("<@443053627419000833> ", "<@443053627419000833>")
    argscount = pres.split(" ")
    if argscount.size > 1
      arr = (0..100).to_a
      argss = pres.gsub("ratewaifu ", "").gsub("<@443053627419000833> ", "").gsub("<@443053627419000833>", "").gsub("--", "")
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
  if (payload.content.starts_with? PREFIX[0] + "ratehusbando") || (payload.content.starts_with? PREFIX[1] + "ratehusbando") || (payload.content.starts_with? PREFIX[2] + "ratehusbando")
    pres = payload.content.gsub("<@443053627419000833> ", "<@443053627419000833>")
    argscount = pres.split(" ")
    if argscount.size > 1
      arr = (0..100).to_a
      argss = pres.gsub("ratehusbando ", "").gsub("<@443053627419000833> ", "").gsub("<@443053627419000833>", "").gsub("--", "")
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
  if (payload.content.starts_with? PREFIX[0] + "qrcode") || (payload.content.starts_with? PREFIX[1] + "qrcode") || (payload.content.starts_with? PREFIX[2] + "qrcode")
    pres = payload.content.gsub("<@443053627419000833> ", "<@443053627419000833>")
    argscount = pres.split(" ")
    if argscount.size > 1
      argss = pres.gsub("qrcode ", "").gsub("<@443053627419000833> ", "").gsub("<@443053627419000833>", "").gsub("--", "")
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
  if (payload.content.starts_with? PREFIX[0] + "hug") || (payload.content.starts_with? PREFIX[1] + "hug") || (payload.content.starts_with? PREFIX[2] + "hug")
    pres = payload.content.gsub("<@443053627419000833> ", "<@443053627419000833>")
    argscount = pres.split(" ")
    if argscount.size > 2
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Too many arguments"
      )
      client.create_message(payload.channel_id, "", embed)
    elsif argscount.size > 1
      mentioned_user = payload.mentions
      argss = pres.gsub("hug ", "").gsub("<@443053627419000833> ", "").gsub("<@443053627419000833>", "").gsub("--", "")
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
  if (payload.content.starts_with? PREFIX[0] + "kiss") || (payload.content.starts_with? PREFIX[1] + "kiss") || (payload.content.starts_with? PREFIX[2] + "kiss")
    pres = payload.content.gsub("<@443053627419000833> ", "<@443053627419000833>")
    argscount = pres.split(" ")
    if argscount.size > 2
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Too many arguments"
      )
      client.create_message(payload.channel_id, "", embed)
    elsif argscount.size > 1
      mentioned_user = payload.mentions
      argss = pres.gsub("kiss ", "").gsub("<@443053627419000833> ", "").gsub("<@443053627419000833>", "").gsub("--", "")
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
    if (payload.content.starts_with? PREFIX[0] + "noticeme") || (payload.content.starts_with? PREFIX[1] + "noticeme") || (payload.content.starts_with? PREFIX[2] + "noticeme")
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
  if (payload.content.starts_with? PREFIX[0] + "mcskin") || (payload.content.starts_with? PREFIX[1] + "mcskin") || (payload.content.starts_with? PREFIX[2] + "mcskin")
    pres = payload.content.gsub("<@443053627419000833> ", "<@443053627419000833>")
    argscount = pres.split(" ")
    if argscount.size > 2
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Too many arguments"
      )
      client.create_message(payload.channel_id, "", embed)
    elsif argscount.size > 1
      argss = pres.gsub("mcskin ", "").gsub("<@443053627419000833> ", "").gsub("<@443053627419000833>", "").gsub("--", "")
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
  if (payload.content.starts_with? PREFIX[0] + "mcuuid") || (payload.content.starts_with? PREFIX[1] + "mcuuid") || (payload.content.starts_with? PREFIX[2] + "mcuuid")
    pres = payload.content.gsub("<@443053627419000833> ", "<@443053627419000833>")
    argscount = pres.split(" ")
    if argscount.size > 2
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Too many arguments"
      )
      client.create_message(payload.channel_id, "", embed)
    elsif argscount.size > 1
      argss = pres.gsub("mcuuid ", "").gsub("<@443053627419000833> ", "").gsub("<@443053627419000833>", "").gsub("--", "")
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
  if (payload.content.starts_with? PREFIX[0] + "mcstatus") || (payload.content.starts_with? PREFIX[1] + "mcstatus") || (payload.content.starts_with? PREFIX[2] + "mcstatus")
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
  if (payload.content.starts_with? PREFIX[0] + "pat") || (payload.content.starts_with? PREFIX[1] + "pat") || (payload.content.starts_with? PREFIX[2] + "pat")
    pres = payload.content.gsub("<@443053627419000833> ", "<@443053627419000833>")
    argscount = pres.split(" ")
    if argscount.size > 2
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Too many arguments"
      )
      client.create_message(payload.channel_id, "", embed)
    elsif argscount.size > 1
      mentioned_user = payload.mentions
      argss = pres.gsub("pat ", "").gsub("<@443053627419000833> ", "").gsub("<@443053627419000833>", "").gsub("--", "")
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
    if (payload.content.starts_with? PREFIX[0] + "ping") || (payload.content.starts_with? PREFIX[1] + "ping") || (payload.content.starts_with? PREFIX[2] + "ping")
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
  if (payload.content.starts_with? PREFIX[0] + "shoot") || (payload.content.starts_with? PREFIX[1] + "shoot") || (payload.content.starts_with? PREFIX[2] + "shoot")
    pres = payload.content.gsub("<@443053627419000833> ", "<@443053627419000833>")
    argscount = pres.split(" ")
    if argscount.size > 2
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Too many arguments"
      )
      client.create_message(payload.channel_id, "", embed)
    elsif argscount.size > 1
      mentioned_user = payload.mentions
      argss = pres.gsub("shoot ", "").gsub("<@443053627419000833> ", "").gsub("<@443053627419000833>", "").gsub("--", "")
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
  if (payload.content.starts_with? PREFIX[0] + "temperature") || (payload.content.starts_with? PREFIX[1] + "temperature") || (payload.content.starts_with? PREFIX[2] + "temperature")
    pres = payload.content.gsub("<@443053627419000833> ", "<@443053627419000833>")
    argscount = pres.split(" ")
    if argscount.size > 4
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Too many arguments"
      )
      client.create_message(payload.channel_id, "", embed)
    elsif argscount.size > 3
      acro = pres.gsub("temperature ", "").gsub("<@443053627419000833> ", "").gsub("<@443053627419000833>", "").gsub("--", "")
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
  if (payload.content.starts_with? PREFIX[0] + "lowercase") || (payload.content.starts_with? PREFIX[1] + "lowercase") || (payload.content.starts_with? PREFIX[2] + "lowercase")
    pres = payload.content.gsub("<@443053627419000833> ", "<@443053627419000833>")
    argscount = pres.split(" ")
    if argscount.size > 1
      acro = pres.gsub("lowercase ", "").gsub("<@443053627419000833> ", "").gsub("<@443053627419000833>", "").gsub("--", "")
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
  if (payload.content.starts_with? PREFIX[0] + "uppercase") || (payload.content.starts_with? PREFIX[1] + "uppercase") || (payload.content.starts_with? PREFIX[2] + "uppercase")
    pres = payload.content.gsub("<@443053627419000833> ", "<@443053627419000833>")
    argscount = pres.split(" ")
    if argscount.size > 1
      acro = pres.gsub("uppercase ", "").gsub("<@443053627419000833> ", "").gsub("<@443053627419000833>", "").gsub("--", "")
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
  if (payload.content.starts_with? PREFIX[0] + "reverse") || (payload.content.starts_with? PREFIX[1] + "reverse") || (payload.content.starts_with? PREFIX[2] + "reverse")
    pres = payload.content.gsub("<@443053627419000833> ", "<@443053627419000833>")
    argscount = pres.split(" ")
    if argscount.size > 1
      acro = pres.gsub("reverse ", "").gsub("<@443053627419000833> ", "").gsub("<@443053627419000833>", "").gsub("--", "")
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
  if (payload.content.starts_with? PREFIX[0] + "restart") || (payload.content.starts_with? PREFIX[1] + "restart") || (payload.content.starts_with? PREFIX[2] + "restart")
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
  if (payload.content.starts_with? PREFIX[0] + "server") || (payload.content.starts_with? PREFIX[1] + "server") || (payload.content.starts_with? PREFIX[2] + "server")
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
      embed = Discord::Embed.new(
        colour: 0xffff00,
        title: "Error",
        url: "https://granz.geopjr.xyz"
      )
      client.create_message(payload.channel_id, "", embed)
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
