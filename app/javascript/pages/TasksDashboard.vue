<template lang="pug">
.tasksDashboard
</template>

<script>
export default {
  props: ['tasks'],
  data () {
    return {
    }
  },
  created () {
    console.log(this.tasks)
  }
}
</script>

<style lang="scss" scoped>
.tasksDashboard {
}
</style>
