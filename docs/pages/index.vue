<template>
  <Showcase />
</template>

<script>
import Showcase from '~/components/Showcase.vue'

export default {
  components: {
    Showcase,
  },
  head() {
    return {
      title: 'Home',
    }
  },
}
</script>
