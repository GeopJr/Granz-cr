<template>
  <v-app dark>
    <v-app-bar fixed app flat class="rounded-b-xl">
      <v-btn class="ml-0" icon :to="'/'" title="Home">
        <v-avatar>
          <v-img src="/avi.jpg" quality="50" alt="Avatar" />
        </v-avatar>
      </v-btn>
      <v-toolbar-title class="d-none d-sm-flex ml-3">{{
        info.name
      }}</v-toolbar-title>
      <v-spacer />
      <v-btn-toggle rounded router>
        <v-tooltip v-for="page in pages" :key="page.endpoint" bottom>
          <template #activator="{ on, attrs }">
            <v-btn
              :aria-label="page.aria"
              v-bind="attrs"
              :href="page.custom ? page.endpoint : ''"
              :to="page.custom ? '' : '/' + page.endpoint"
              :target="page.custom ? '_blank' : ''"
              :rel="page.custom ? 'noopener' : ''"
              v-on="on"
            >
              <v-icon medium> fa-{{ page.icon }} </v-icon>
            </v-btn>
          </template>
          <span>{{
            page.endpoint === ''
              ? 'Home'
              : page.aria.charAt(0).toUpperCase() + page.aria.slice(1)
          }}</span>
        </v-tooltip>
      </v-btn-toggle>
    </v-app-bar>
    <transition name="fade" appear>
      <v-main>
        <v-container fill-height>
          <nuxt />
        </v-container>
      </v-main>
    </transition>
    <v-footer app absolute rounded padless class="rounded-t-xl">
      <v-card flat tile class="text-center c-footer rounded-t-xl">
        <v-card-text class="pt-0">
          Made with
          <v-icon medium> fa fa-linux </v-icon>,
          <v-icon medium> fa-mars-double </v-icon> and
          <v-icon medium> fa-heart </v-icon>.
        </v-card-text>
        <v-divider />
        <v-card-text class="pa-3">
          <strong class="accent--text">©</strong>
          {{ new Date().getFullYear() }} —
          <a
            class="accent--text"
            href="https://geopjr.dev/"
            style="text-decoration: none; font-weight: bold"
            >GeopJr</a
          >
        </v-card-text>
      </v-card>
    </v-footer>
  </v-app>
</template>

<script>
import Data from '@/assets/data.json'

export default {
  data: () => ({
    info: Data,
    pages: [
      {
        endpoint: '',
        icon: 'home',
        brand: false,
        aria: 'Home',
      },
      {
        endpoint: 'commands',
        icon: 'cog',
        brand: false,
        aria: 'Commands',
      },
      {
        endpoint: 'https://github.com/GeopJr/Granz-cr',
        icon: 'github',
        brand: true,
        aria: 'Code',
        custom: true,
      },
      {
        endpoint:
          'https://discordapp.com/oauth2/authorize?client_id=443053627419000833&scope=bot&permissions=388190',
        icon: 'discord-alt',
        brand: false,
        aria: 'Invite',
        custom: true,
      },
      {
        endpoint: 'https://discord.gg/7XQNZGq',
        icon: 'info',
        brand: false,
        aria: 'Invite',
        custom: true,
      },
      {
        endpoint: 'https://geopjr.dev/contact',
        icon: 'id-card',
        brand: false,
        aria: 'Contact',
        custom: true,
      },
    ],
  }),
}
</script>

<style>
.c-icon {
  vertical-align: middle;
}
.c-footer {
  width: 100%;
  padding-top: 16px !important;
}
.fade-enter-active {
  transition: opacity 1s;
}
.fade-enter {
  opacity: 0;
}
.v-card__title {
  word-break: break-word !important;
}
html {
  overflow: auto !important;
}
</style>
