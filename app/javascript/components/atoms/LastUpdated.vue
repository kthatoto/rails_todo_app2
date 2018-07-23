<template lang="pug">
.lastUpdated
  | updated on {{ display() }}
</template>
<script>
export default {
  props: ['updated'],
  methods: {
    display () {
      return this.updated.substring(0, 10)
    }
  }
}
</script>
<style lang="scss">
.lastUpdated {
  color: #999;
  font-size: 1rem;
}
</style>
