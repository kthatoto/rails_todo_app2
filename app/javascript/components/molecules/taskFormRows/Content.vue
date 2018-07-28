<template lang="pug">
tr
  th Content
  td
    input(type=text v-model="newContent")
</template>
<script>
export default {
  data () {
    return {
      newContent: ''
    }
  },
  watch: {
    newContent () {
      this.$emit('update', this.newContent)
    }
  }
}
</script>
<style>
</style>
