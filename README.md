<div align="center">
<br />
  <p>
    <img src="https://i.imgur.com/90xR5vB.png"/>
  </p>
  <br />
  <p>
    <a href="https://top.gg/bot/443053627419000833"><img src="https://discordbots.org/api/widget/status/443053627419000833.svg" alt="Discord_Bots" /></a>
    <img src="https://github.com/GeopJr/Granz-cr/workflows/Docs/badge.svg" alt="DOCS" />
  </p>
</div>

# Granz-cr

A Discord Bot & Framework written in Crystal using discordcr

# How to install

- `shards install`
- Open config.json, replace the info with [yours](https://github.com/geopjr/granz-cr#configjson)
- Set the Env vars you [need](https://github.com/geopjr/granz-cr#env-vars)
- Everthing should now work
- `crystal src/Granz.cr` or compile

# config.json

```json
{
  // Your bot's ID
  "client_id": 100000000000000000,
  // Your ID
  "my_id": 100000000000000000,
  // Bot version
  "version": 2,
  // Prefix
  "prefix": "--",
  // Support guild url (leave empty if none)
  "support_guild": "7XQNZGq",
  // Your tag
  "my_tag": "GeopJr#4066"
}
```

# Env Vars

```
GRANZ_BUILD: Set to true to build commands.md
GRANZ_BOTLIST: Set to true to use bot_list.cr
TOPGG_TOKEN: Set to top.gg token if any
BOTSGG_TOKEN: Set to bots.gg token if any
BOTSONDISCORD_TOKEN: Set to bots.ondiscord.xyz token if any
GRANZ_TOKEN: Set to bot's token
```

# Framework

#### You can use Granz as a base for your bot!

- Register commands dynamically
- Generate a markdown of all the commands
- Dynamic help command
- More More More!

# Invite it

[CLICK HERE](https://discordapp.com/oauth2/authorize?client_id=443053627419000833&scope=bot&permissions=103894080)

# Copyrights

Granz's avatar is copyrighted under [Mentaiko Itto©](https://twitter.com/ittorasii)

> Thanks to [z64](https://github.com/z64) for helping me with both crystal and discordcr
