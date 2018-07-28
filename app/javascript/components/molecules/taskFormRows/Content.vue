<template lang="pug">
tr
  th Content
  td
    input(type=text v-model="content")
</template>
<script>
export default {
  data () {
    return {
      content: ''
    }
  },
  watch: {
    content () {
      this.$emit('update', this.content)
    }
  }
}
</script>
<style>
</style>
