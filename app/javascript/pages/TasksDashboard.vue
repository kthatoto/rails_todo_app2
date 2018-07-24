<template lang="pug">
.tasksDashboard
  .taskConsole
    .taskConsole__buttons
      Button.button(:proc="showNewTaskForm()")
        icon.icon.-left(name="plus")
        | Create New Task
      Button.button
        icon.icon.-left(name="search")
        | Filter Tasks
    new-task-form.newTaskForm(v-show="showing.newTaskForm")
  .taskLists
    task-list.taskList(type="todo" :tasks="props.todos")
    task-list.taskList(type="done" :tasks="props.dones")
</template>

<script>
import store from '@/vuex/store'
import { SET_TASKS } from '@/vuex/mutations'

import NewTaskForm from '@/components/organisms/taskForm/NewTaskForm'
import TaskList from '@/components/organisms/TaskList'
import Button from '@/components/atoms/Button'
export default {
  components: { NewTaskForm, TaskList, Button },
  props: ['props'],
  data () {
    return {
      showing: {
        newTaskForm: true
      }
    }
  },
  created () {
    store.dispatch(SET_TASKS, {
      todos: this.props.todos,
      dones: this.props.dones
    })
  },
  methods: {
    showNewTaskForm () {
      return () => {
        this.showing.newTaskForm = true
      }
    }
  }
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
  margin-bottom: 20px;
  &__buttons {
    margin-bottom: 10px;
    .button:nth-child(2) {
      margin-left: 5px;
    }
  }
}
.taskLists {
  display: flex;
}
.taskList {
  width: 50%;
  padding: 0 10px;
}
</style>
