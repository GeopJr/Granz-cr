<template>
  <div>
    <Commands
      v-for="(value, key) in commandList"
      :key="key"
      :commands="value"
      :category="key"
    />
  </div>
</template>

<script>
import Commands from '@/components/Commands.vue'
import commandList from '@/assets/commands.json'
import Data from '@/assets/data.json'

export default {
  components: {
    Commands,
  },
  data: () => ({
    commandList,
  }),
  head() {
    const title = 'Commands'
    const desc = "Granz' Command List"
    return {
      title,
      meta: [
        { hid: 'description', name: 'description', content: desc },
        { name: 'og:description', content: desc },
        { name: 'og:title', content: title + ' - ' + Data.name },
      ],
    }
  },
}
</script>
