<template lang="pug">
.tasksDashboard
  Header
  p(v-for="task in tasks") {{ task }}
</template>

<script>
import Header from '../components/organisms/Header'
export default {
  components: { Header },
  props: ['tasks'],
  data () {
    return {
    }
  }
}
</script>

<style lang="scss" scoped>
.tasksDashboard {
}
</style>
