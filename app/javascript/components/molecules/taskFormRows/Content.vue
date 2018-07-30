<template lang="pug">
tr
  th Content
  td
    input(type=text v-model="content")
</template>
<script>
export default {
  props: ['propContent'],
  data () {
    return {
      content: ''
    }
  },
  created () {
    if (this.propContent) {
      this.content = this.propContent
    }
  },
  watch: {
    content () {
      this.$emit('update', this.content)
    },
    propContent () {
      if (this.content !== this.propContent) {
        this.content = this.propContent
      }
    }
  }
}
</script>
<style>
</style>
