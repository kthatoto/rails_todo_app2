<template lang="pug">
.taskItem
  p.taskItem__content
    | {{ task.content }}
    span.taskItem__id {{ `(#${task.id})` }}
  p.taskItem__info Assignees:
</template>
<script>
export default {
  props: ['task']
}
</script>
<style lang="scss" scoped>
.taskItem {
  background-color: #eee;
  margin-bottom: 10px;
  padding: 10px;
  border-radius: 5px;
  &__id {
    display: inline-block;
    margin-left: 5px;
    color: #999;
    font-size: small;
  }
  &__info {
    font-size: small;
  }
}
</style>
