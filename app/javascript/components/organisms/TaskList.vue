<template lang="pug">
.taskList
  h2.taskList__header
    icon.icon.-left.-large(:name="icon[type]")
    | {{ header[type] }}
  ul.taskList__list
    li(v-for="task in tasks" :key="task.id")
      task-item(:task="task")
</template>
<script>
import TaskItem from '@/components/molecules/TaskItem'
export default {
  components: { TaskItem },
  props: ['type', 'tasks'],
  data () {
    return {
      header: {
        todo: 'TODO',
        done: 'DONE'
      },
      icon: {
        todo: 'sticky-note',
        done: 'check-square'
      }
    }
  }
}
</script>
<style lang="scss" scoped>
.taskList {
  &__header {
    color: #eee;
    background-color: #444;
    padding: 10px 15px;
  }
  &__list {
    background-color: #bbb;
    border: 1px solid #333;
    border-top: none;
    padding: 10px;
  }
}
</style>
