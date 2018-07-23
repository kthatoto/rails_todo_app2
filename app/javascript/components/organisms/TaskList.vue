<template lang="pug">
.taskList
  h2.taskList__header {{ type.toUpperCase() }}
  ul.taskList__list
    li(v-for="task in tasks" :key="task.id")
      task-item(:task="task")
</template>
<script>
import TaskItem from '@/components/molecules/TaskItem'
export default {
  components: { TaskItem },
  props: ['type', 'tasks']
}
</script>
<style lang="scss" scoped>
.taskList {
  &__header {
    color: #eee;
    background-color: #444;
    padding: 10px;
  }
  &__list {
    background-color: #bbb;
    border: 1px solid #333;
    border-top: none;
    padding: 10px;
  }
}
</style>
