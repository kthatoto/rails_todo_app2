<template lang="pug">
tr
  th Assignees
  td
    input(type=text v-model="assigneeName" list="assigneeList" @keydown="addAssignee")
    datalist(id="assigneeList")
      option(v-for="user in users" :key="user.id" :value="user.name")
    ul
      li(v-for="(assignee, i) in assignees" :key="assignee.id" class="assignees__item")
        | {{ assignee.name }}
        icon.icon(name="times" @click.native="removeAssignee(i)")
</template>
<script>
import store from '@/vuex/store'
export default {
  data () {
    return {
      assigneeName: '',
      users: [],
      assignees: []
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
    },
    removeAssignee (i) {
      this.assignees.splice(i, 1)
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
.assignees {
  &__item {
    display: inline-block;
    padding: 0 5px;
    background-color: #555;
    color: white;
    border-radius: 3px;
    margin: 0 3px 3px 0;
  }
}
.icon {
  cursor: pointer;
  border-left: 1px solid white;
  margin-left: 3px;
  padding-left: 5px;
}
</style>
