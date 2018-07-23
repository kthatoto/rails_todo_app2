<template lang="pug">
.tasksDashboard
  .taskLists
    task-list.taskList(type="todo" :tasks="props.todos")
    task-list.taskList(type="done" :tasks="props.dones")
</template>

<script>
import TaskList from '@/components/organisms/TaskList'
export default {
  components: { TaskList },
  props: ['props']
}
</script>

<style lang="scss" scoped>
.tasksDashboard {
}
.taskLists {
  margin: auto;
  max-width: 900px;
  min-width: 650px;
  display: flex;
}
.taskList {
  width: 50%;
  padding: 0 10px;
}
</style>
