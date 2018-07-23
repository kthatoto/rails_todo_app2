<template lang="pug">
  .button(@click="proc") {{ label }}
</template>
<script>
export default {
  props: ['label', 'proc']
}
</script>
<style lang="scss" scoped>
.button {
  width: 100px;
  height: 40px;
  border: 1px solid black;
}
</style>
