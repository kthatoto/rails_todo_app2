<template lang="pug">
task-form.newTaskForm
  h2 New Task
  icon.icon.hideButton(name="times" @click.native="hideForm")
  table
    content-row(@update="newContent => content = newContent" :propContent="content")
    assignees-row(@update="newIds => assigneeIds = newIds" :propAssigneeIds="assigneeIds")
    labels-row(@update="newLabels => labels = newLabels" :propLabels="labels")
  .buttons
    Button(:proc="createTask()" body="Create")
</template>
<script>
import store from '@/vuex/store'
import { CREATE_TASK } from '@/vuex/mutations'

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
          this.initForm()
          store.dispatch(CREATE_TASK, response.data.task)
        })
      }
    },
    initForm () {
      this.content = ''
      this.assigneeIds = []
      this.labels = []
    },
    hideForm () {
      this.$parent.showing.newTaskForm = false
    }
  }
}
</script>
<style lang="scss" scoped>
.newTaskForm {
  position: relative;
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
