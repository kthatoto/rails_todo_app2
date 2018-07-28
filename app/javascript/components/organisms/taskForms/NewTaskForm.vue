<template lang="pug">
task-form.newTaskForm
  h2 New Task
  table
    content-row(@update="newContent => content = newContent")
</template>
<script>
import TaskForm from '@/components/molecules/Form'
import ContentRow from '@/components/molecules/taskFormRows/Content'
export default {
  components: { TaskForm, ContentRow },
  data () {
    return {
      content: '',
      assigneeIds: [],
      labels: []
    }
  },
  methods: {
    createTask () {
    }
  }
}
</script>
<style lang="scss">
.newTaskForm {
}
</style>
