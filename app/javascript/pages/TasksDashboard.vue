<template lang="pug">
.tasksDashboard
  Button(label="ok!" :proc="alertMsg(msg)")
  input(type=text v-model="msg")
</template>

<script>
import Button from '@/components/atoms/Button'
export default {
  props: ['props'],
  components: { Button },
  data () {
    return {
      msg: ''
    }
  },
  methods: {
    alertMsg (msg) {
      return () => {
        alert(msg)
      }
    }
  }
}
</script>

<style lang="scss" scoped>
.tasksDashboard {
}
</style>
