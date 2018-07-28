<template lang="pug">
task-form.editTaskForm
  h2 Edit Task
  icon.icon.hideButton(name="times" @click.native="hideForm")
  table
    content-row(@update="newContent => content = newContent")
    assignees-row(@update="newIds => assigneeIds = newIds")
    labels-row(@update="newLabels => labels = newLabels")
  .buttons
    Button(:proc="updateTask()" body="Update")
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
    updateTask () {
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
          method: 'PUT',
          url: '/api/tasks',
          data: {
            content: this.content,
            assigneeIds: this.assigneeIds,
            labels: this.labels
          }
        }).then(response => {
        })
      }
    },
    hideForm () {
      this.$parent.editingTaskId = 0
    }
  }
}
</script>
<style lang="scss" scoped>
.editTaskForm {
  position: relative;
  width: 100%;
  .hideButton {
    width: 20px;
    height: 20px;
    position: absolute;
    top: 10px;
    right: 10px;
    cursor: pointer;
  }
}
</style>
