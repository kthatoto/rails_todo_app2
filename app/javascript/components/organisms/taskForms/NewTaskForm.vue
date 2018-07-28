<template lang="pug">
task-form.newTaskForm
  h2 New Task
  table
    content-row(@update="newContent => content = newContent")
    assignees-row(@update="newIds => assigneeIds = newIds")
</template>
<script>
import TaskForm from '@/components/molecules/Form'
import ContentRow from '@/components/molecules/taskFormRows/Content'
import AssigneesRow from '@/components/molecules/taskFormRows/Assignees'
export default {
  components: { TaskForm, ContentRow, AssigneesRow },
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
