<template lang="pug">
.tasksDashboard
  .taskConsole
    .taskConsole__buttons
      Button(body="Create New Task")
      Button(body="Filter Tasks")
  .taskLists
    task-list.taskList(type="todo" :tasks="props.todos")
    task-list.taskList(type="done" :tasks="props.dones")
</template>

<script>
import Button from '@/components/atoms/Button'
import TaskList from '@/components/organisms/TaskList'
export default {
  components: { Button, TaskList },
  props: ['props']
}
</script>

<style lang="scss" scoped>
.tasksDashboard {
  padding-top: 30px;
  margin: auto;
  max-width: 900px;
  min-width: 650px;
}
.taskConsole {
  margin-bottom: 30px;
}
.taskLists {
  display: flex;
}
.taskList {
  width: 50%;
  padding: 0 10px;
}
</style>
