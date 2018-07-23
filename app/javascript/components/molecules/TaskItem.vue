<template lang="pug">
.taskItem
  .taskItem__content
    | {{ task.content }}
    span.taskItem__id {{ `(#${task.id})` }}
  task-item-row(type="Assignees", :tags="task.assignees")
  task-item-row(type="Labels", :tags="task.labels")
  last-updated.taskItem__updated(:updated="task.timestamps.updated_at")
</template>
<script>
import TaskItemRow from '@/components/molecules/TaskItemRow'
import LastUpdated from '@/components/atoms/LastUpdated'
export default {
  components: { TaskItemRow, LastUpdated },
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
    font-size: 1.6rem;
  }
  &__id {
    display: inline-block;
    margin-left: 5px;
    color: #999;
    font-size: 1.2rem;
  }
}
</style>
