<template lang="pug">
.button(@click="proc ? proc : none") {{ body }}
</template>
<script>
export default {
  props: ['body', 'proc'],
  methods: {
    none () {
      return
    }
  }
}
</script>
<style lang="scss" scoped>
.button {
  display: inline-block;
  border-radius: 4px;
  cursor: pointer;
  padding: 3px 5px;
  border: 1px solid #777;
  background-color: #999;
  color: white;
  text-align: center;
}
</style>
