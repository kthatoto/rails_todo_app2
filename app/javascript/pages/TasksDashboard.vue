<template lang="pug">
.tasksDashboard
</template>

<script>
export default {
  props: ['data'],
  data () {
    return {
    }
  },
  created () {
    console.log(this.data)
  }
}
</script>

<style lang="scss" scoped>
.tasksDashboard {
}
</style>
