<template lang="pug">
tr
  th Assignees
  td
    input(type=text v-model="assigneeName" list="assigneeList" @keydown="addAssignee")
    datalist(id="assigneeList")
      option(v-for="user in users" :key="user.id" :value="user.name")
    ul
      li(v-for="assignee in assignees" :key="assignee.id") {{ assignee.name }}
</template>
<script>
import store from '@/vuex/store'
export default {
  data () {
    return {
      users: [],
      assignees: [],
      assigneeName: ''
    }
  },
  created () {
    this.users = store.getters.getUsers
  },
  methods: {
    addAssignee (e) {
      if (!(e.keyCode === 13) || this.assigneeName.length === 0) {
        return
      }
      const targetUser = this.users.filter(user => user.name === this.assigneeName)[0]
      if (!targetUser) {
        alert('User not found')
        return
      }
      if (this.assignees.filter(assignee => assignee.id === targetUser.id).length > 0) {
        alert('Already added')
        return
      }
      this.assignees.push(targetUser)
      this.assigneeName = ''
    }
  },
  watch: {
    assignees () {
      this.$emit('update', this.assignees.map(assignee => assignee.id))
    }
  }
}
</script>
<style lang="scss">
</style>
