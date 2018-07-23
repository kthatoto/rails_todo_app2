<template lang="pug">
.taskItem
  .taskItem__content
    | {{ task.content }}
    span.taskItem__id {{ `(#${task.id})` }}
  .taskItem__info
    .taskItem__infoLabel Assignees:
    .taskItem__tags
      Tag(v-for="assignee in task.assignees" :body="assignee.name")
  .taskItem__info
    .taskItem__infoLabel Labels:
    .taskItem__tags
      Tag(v-for="label in task.labels" :body="label.name")
</template>
<script>
import Tag from '@/components/atoms/Tag'
export default {
  components: { Tag },
  props: ['task']
}
</script>
<style lang="scss" scoped>
.taskItem {
  background-color: #eee;
  margin-bottom: 10px;
  padding: 10px;
  border-radius: 5px;
  &__content {
    margin-bottom: 5px;
  }
  &__id {
    display: inline-block;
    margin-left: 5px;
    color: #999;
    font-size: small;
  }
  $infoLabelWidth: 75px;
  &__info {
    font-size: small;
    margin-bottom: 5px;
    overflow: hidden;
    &Label {
      width: $infoLabelWidth;
      float: left;
      font-size: inherit;
      text-align: right;
      padding-right: 5px;
    }
  }
  &__tags {
    font-size: inherit;
    float: left;
    width: calc(100% - #{$infoLabelWidth});
  }
}
</style>
