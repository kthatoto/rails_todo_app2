<template lang="pug">
.tag {{ body }}
</template>
<script>
export default {
  props: ['body']
}
</script>
<style lang="scss" scoped>
.tag {
  display: inline-block;
  padding: 0 5px;
  background-color: #555;
  color: white;
  border-radius: 3px;
  cursor: pointer;
  margin: 0 5px 5px 0;
}
</style>
