<template lang="pug">
.taskItem
  .taskItem__content
    | {{ task.content }}
    span.taskItem__id {{ `(#${task.id})` }}
  task-item-row(type="Assignees", :tags="task.assignees")
  task-item-row(type="Labels", :tags="task.labels")
  .taskItem__bottom
    last-updated.taskItem__updated(:updated="task.timestamps.updated_at")
    .buttons
      Button
        icon.icon.-left(:name="buttonIcon[task.status]")
        | {{ button[task.status] }}
      Button
        icon.icon.-left(name="edit")
        | Edit
</template>
<script>
import TaskItemRow from '@/components/molecules/TaskItemRow'
import LastUpdated from '@/components/atoms/LastUpdated'
import Button from '@/components/atoms/Button'
export default {
  components: { TaskItemRow, LastUpdated, Button },
  props: ['task'],
  data () {
    return {
      button: {
        todo: 'DONE',
        done: 'TODO'
      },
      buttonIcon: {
        todo: 'check-square',
        done: 'sticky-note'
      }
    }
  }
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
  &__bottom {
    overflow: hidden;
    position: relative;
  }
  &__updated {
    position: absolute;
    bottom: 0;
    left: 0;
  }
}
.buttons {
  float: right;
  overflow: hidden;
  >>> .button {
    width: 80px;
    margin: 0 3px;
    float: right;
  }
}
</style>
