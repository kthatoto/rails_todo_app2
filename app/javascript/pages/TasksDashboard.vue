<template lang="pug">
.tasksDashboard
  task-list(header="TODO" :tasks="props.todos")
  task-list(header="DONE" :tasks="props.dones")
</template>

<script>
import TaskList from '@/components/organisms/TaskList'
export default {
  components: { TaskList },
  props: ['props'],
  data () {
    return {
    }
  }
}
</script>

<style lang="scss" scoped>
.tasksDashboard {
}
</style>
