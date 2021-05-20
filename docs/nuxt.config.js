import Data from './assets/data.json'

export default {
  ssr: true,
  target: 'server',
  loadingIndicator: {
    name: 'folding-cube',
    color: Data.colors.theme,
    background: '#121212',
  },
  loading: {
    color: Data.colors.theme,
  },
  render: {
    static: {
      maxAge: 60 * 60 * 24 * 30 * 1000,
    },
  },
  head: {
    titleTemplate: '%s - ' + Data.name,
    title: Data.name,
    htmlAttrs: {
      lang: 'en',
    },
    meta: [
      { charset: 'utf-8' },
      { name: 'viewport', content: 'width=device-width, initial-scale=1' },
      {
        hid: 'description',
        name: 'description',
        content: 'Homepage of ' + Data.name,
      },
      { name: 'theme-color', content: Data.colors.theme },
      // OpenGraph
      { name: 'og:site_name', content: 'GeopJr#4066' },
      { name: 'og:description', content: 'Homepage of ' + Data.name },
      { name: 'og:title', content: Data.name },
      { name: 'og:type', content: 'website' },
      { name: 'og:url', content: 'https://' + Data.domain },
      { name: 'og:image:type', content: 'image/png' },
      { name: 'og:image', content: Data.avi.cdn },
      // Apple
      { name: 'apple-mobile-web-app-title', content: Data.name },
      {
        name: 'apple-mobile-web-app-status-bar-style',
        content: 'black-translucent',
      },
      { name: 'apple-mobile-web-app-capable', content: 'yes' },
    ],
    link: [
      { rel: 'canonical', href: 'https://' + Data.domain },
      // Font
      {
        rel: 'preload stylesheet prefetch',
        href:
          'https://cdn.jsdelivr.net/npm/fork-awesome@1.1.7/css/fork-awesome.min.css',
        integrity: 'sha256-gsmEoJAws/Kd3CjuOQzLie5Q3yshhvmo7YNtBG7aaEY=',
        crossorigin: 'anonymous',
        as: 'style',
      },
      // Favicons
      {
        rel: 'icon',
        sizes: '32x32',
        type: 'image/png',
        href: '/favicons/favicon-32x32.png?v=2',
      },
      {
        rel: 'icon',
        sizes: '16x16',
        type: 'image/png',
        href: '/favicons/favicon-16x16.png?v=2',
      },
      { rel: 'icon', type: 'image/x-icon', href: '/favicons/favicon.ico?v=2' },
      { rel: 'manifest', href: '/favicons/manifest.json' },
      { rel: 'mask-icon', href: '/favicons/safari-pinned-tab.svg' },
      {
        rel: 'icon',
        type: 'image/x-icon',
        href: '/favicons/favicon.ico',
        color: Data.colors.theme,
      },
      // Apple
      {
        rel: 'apple-touch-icon',
        sizes: '180x180',
        href: '/favicons/apple-touch-icon.png',
      },
    ],
  },
  components: true,
  buildModules: [
    '@nuxtjs/eslint-module',
    [
      '@nuxtjs/vuetify',
      { customVariables: ['~/assets/variables.scss'], treeShake: true },
    ],
    // 'nuxt-vite',
  ],
  // Reduces vuetify size apparently
  build: {
    extractCSS: true,
  },
  modules: [],
  plugins: [{ src: '~/plugins/discord-msg.js', mode: 'client' }],
  vuetify: {
    breakpoint: {
      thresholds: {
        xl: 12000,
      },
    },
    icons: {
      iconfont: 'fa',
    },
    theme: {
      dark: true,
      themes: {
        light: {
          primary: Data.colors.theme,
          accent: Data.colors.theme,
        },
        dark: {
          primary: Data.colors.theme,
          accent: Data.colors.theme,
        },
      },
    },
  },
  css: ['@/assets/transitions.css'],
}
