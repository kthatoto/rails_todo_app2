<template lang="pug">
task-form.newTaskForm
  h2 New Task
  table
    content-row(@update="newContent => content = newContent")
    assignees-row(@update="newIds => assigneeIds = newIds")
    labels-row(@update="newLabels => labels = newLabels")
  .buttons
    Button(:proc="createTask()" body="Create")
</template>
<script>
import TaskForm from '@/components/molecules/Form'
import ContentRow from '@/components/molecules/taskFormRows/Content'
import AssigneesRow from '@/components/molecules/taskFormRows/Assignees'
import LabelsRow from '@/components/molecules/taskFormRows/Labels'
import Button from '@/components/atoms/Button'

import axios from 'axios'
export default {
  components: { TaskForm, ContentRow, AssigneesRow, LabelsRow, Button },
  data () {
    return {
      content: '',
      assigneeIds: [],
      labels: []
    }
  },
  methods: {
    createTask () {
      return () => {
        if (this.content.length === 0) {
          alert('Content is empty')
          return
        }
        if (this.assigneeIds.length === 0) {
          alert('Assignees are empty')
          return
        }
        axios({
          method: 'POST',
          url: '/api/tasks',
          data: {
            content: this.content,
            assigneeIds: this.assigneeIds,
            labels: this.labels
          }
        }).then(response => {
        })
      }
    }
  }
}
</script>
<style lang="scss">
.newTaskForm {
}
</style>
