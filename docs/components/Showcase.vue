<template>
  <v-row justify="center" align="center">
    <v-col class="text-center" cols="12" md="6" sm="12">
      <img class="showcase-img" src="/avi.jpg" />
    </v-col>
    <v-col cols="12" md="6" sm="12">
      <client-only placeholder="Loading...">
        <discord-messages>
          <discord-message
            author="GeopJr"
            avatar="https://i.imgur.com/H7GmGzQs.png"
            role-color="#ffff00"
          >
            Hey <mention>Granz</mention>, who are you?
          </discord-message>
          <discord-message
            author="Granz"
            avatar="https://i.imgur.com/vYD4xJMs.jpg"
            role-color="#0086ff"
            :bot="true"
          >
            Hello! I am a multifunctional Discord bot written in Crystal using
            discordcr!
          </discord-message>
          <discord-message
            author="GeopJr"
            avatar="https://i.imgur.com/H7GmGzQs.png"
            role-color="#ffff00"
          >
            Where can I find your commands?
          </discord-message>
          <discord-message
            author="Granz"
            avatar="https://i.imgur.com/vYD4xJMs.jpg"
            role-color="#0086ff"
            :bot="true"
          >
            You can find a list of them here:
            <a href="/commands">https://granz.geopjr.dev/commands</a>! I have
            many fun, useful, gaming and adming commands!
          </discord-message>
          <discord-message
            author="GeopJr"
            avatar="https://i.imgur.com/H7GmGzQs.png"
            role-color="#ffff00"
          >
            --ping
          </discord-message>
          <discord-message
            author="Granz"
            avatar="https://i.imgur.com/vYD4xJMs.jpg"
            role-color="#0086ff"
            :bot="true"
          >
            <discord-embed slot="embeds" color="#0086ff">
              🏓 Pong! 🏓 (19.0 ms.)
            </discord-embed>
          </discord-message>
        </discord-messages>
      </client-only>
    </v-col>
  </v-row>
</template>

<script>
export default {
  props: {
    content: {
      type: Array,
      default: null,
    },
  },
}
</script>

<style scoped>
.showcase-img {
  max-width: 100%;
}

.discord-messages,
.showcase-img {
  border-radius: 6px;
}
</style>
