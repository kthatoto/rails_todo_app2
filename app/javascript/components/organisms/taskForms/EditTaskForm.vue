<template lang="pug">
task-form.editTaskForm
  h2
    | Edit Task
    span.editTaskForm__id {{ `(#${task.id})` }}
  icon.icon.hideButton(name="times" @click.native="hideForm")
  table
    content-row(@update="newContent => content = newContent" :propContent="content")
    assignees-row(@update="newIds => assigneeIds = newIds" :propAssigneeIds="assigneeIds")
    labels-row(@update="newLabels => labels = newLabels" :propLabels="labels")
  .buttons
    Button.button(:proc="deleteTask()" body="Delete")
    Button.button(:proc="updateTask()" body="Update")
</template>
<script>
import store from '@/vuex/store'
import { UPDATE_TASK, DELETE_TASK } from '@/vuex/mutations'

import TaskForm from '@/components/molecules/Form'
import ContentRow from '@/components/molecules/taskFormRows/Content'
import AssigneesRow from '@/components/molecules/taskFormRows/Assignees'
import LabelsRow from '@/components/molecules/taskFormRows/Labels'
import Button from '@/components/atoms/Button'

import axios from 'axios'
export default {
  components: { TaskForm, ContentRow, AssigneesRow, LabelsRow, Button },
  props: ['task'],
  data () {
    return {
      content: '',
      assigneeIds: [],
      labels: []
    }
  },
  created () {
    const task = this.task
    this.content = task.content
    this.assigneeIds = task.assignees.map(assignee => assignee.id)
    this.labels = task.labels.map(label => label.name)
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
          url: '/api/tasks/' + this.task.id,
          data: {
            content: this.content,
            assigneeIds: this.assigneeIds,
            labels: this.labels
          }
        }).then(response => {
          store.dispatch(UPDATE_TASK, response.data.task)
          this.hideForm()
        })
      }
    },
    deleteTask () {
      return () => {
        if (window.confirm('Do you really want to DELETE this task?')) {
          axios({
            method: 'DELETE',
            url: '/api/tasks/' + this.task.id
          }).then(response => {
            store.dispatch(DELETE_TASK, {
              id: this.task.id,
              type: this.task.status
            })
          })
        }
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
  h2 {
    font-size: 1.4rem;
  }
  .hideButton {
    width: 20px;
    height: 20px;
    position: absolute;
    top: 10px;
    right: 10px;
    cursor: pointer;
  }
  &__id {
    display: inline-block;
    margin-left: 5px;
    color: #999;
    font-size: 1.1rem;
    font-weight: normal;
  }
}
.buttons {
  .button {
    margin: 0 3px;
  }
}
</style>
