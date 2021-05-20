<template>
  <v-row justify="center">
    <v-col class="text-center" cols="12">
      <v-banner single-line elevation="6" class="text-center">
        {{ category.charAt(0).toUpperCase() + category.slice(1) }}
      </v-banner>
    </v-col>
    <v-col
      v-for="command in commands"
      :key="command.name"
      cols="12"
      md="4"
      sm="12"
    >
      <discord-messages>
        <discord-message
          author="GeopJr"
          avatar="https://i.imgur.com/H7GmGzQs.png"
          role-color="#ffff00"
        >
          --help {{ command.name }}
        </discord-message>
        <discord-message
          author="Granz"
          avatar="https://i.imgur.com/vYD4xJMs.jpg"
          role-color="#0086ff"
          :bot="true"
        >
          <discord-embed
            slot="embeds"
            color="#0086ff"
            :author-name="
              '[' +
              command.name.toLowerCase() +
              '] in [' +
              category.toLowerCase() +
              ']'
            "
          >
            Here's what I know about <u>{{ command.name }}</u>
            <embed-fields slot="fields">
              <embed-field :inline="true" title="Description">
                {{ command.desc }}
              </embed-field>
              <embed-field :inline="true" title="Usage">
                {{ command.usage }}
              </embed-field>
              <embed-field :inline="true" title="Example">
                {{ command.example }}
              </embed-field>
            </embed-fields>
          </discord-embed>
        </discord-message>
      </discord-messages>
    </v-col>
  </v-row>
</template>

<script>
export default {
  props: {
    category: {
      type: String,
      default: null,
    },
    commands: {
      type: Array,
      default: null,
    },
  },
}
</script>

<style scoped>
.discord-messages {
  border-radius: 6px;
  height: 100%;
}
</style>
