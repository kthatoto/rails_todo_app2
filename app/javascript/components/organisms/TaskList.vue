<template lang="pug">
.taskList
  h2.taskList__header
    icon.icon.-left.-large(:name="icon[type]")
    | {{ header[type] }}
    span.taskList__count {{ tasks.length }}
  ul.taskList__list
    li.taskList__item(v-for="task in tasks" :key="task.id")
      task-item(:task="task" :editTask="editTask")
      edit-task-form(v-if="task.status === 'todo' && task.id === editingTaskId" :task="task")
</template>
<script>
import TaskItem from '@/components/molecules/TaskItem'
import EditTaskForm from '@/components/organisms/taskForms/EditTaskForm'
export default {
  components: { TaskItem, EditTaskForm },
  props: ['type', 'tasks'],
  data () {
    return {
      header: {
        todo: 'TODO',
        done: 'DONE'
      },
      icon: {
        todo: 'sticky-note',
        done: 'check-square'
      },
      editingTaskId: 0
    }
  },
  methods: {
    editTask (taskId) {
      return () => {
        this.editingTaskId = taskId
      }
    }
  }
}
</script>
<style lang="scss" scoped>
.taskList {
  &__header {
    color: #eee;
    background-color: #444;
    padding: 10px 15px;
    .icon {
      vertical-align: -2px;
    }
  }
  &__list {
    background-color: #bbb;
    border: 1px solid #333;
    border-top: none;
    padding: 10px;
  }
  &__item {
    margin-bottom: 10px;
  }
  &__count {
    font-size: 1.2rem;
    margin-left: 10px;
    background-color: #ddd;
    color: #555;
    padding: 3px 5px;
    border-radius: 10px;
    vertical-align: 2px;
  }
}
</style>
