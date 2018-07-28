<template lang="pug">
tr
  th Assignees
  td
    input(type=text v-model="assigneeName" list="assigneeList")
    datalist(id="assigneeList")
      option(value="JavaScript")
      option(value="Java")
      option(value="PHP")
      option(value="Python")
    ul
      li(v-for="assignee in assignees" :key="assignee.id")
</template>
<script>
export default {
  data () {
    return {
      assignees: [],
      assigneeName: ''
    }
  }
}
</script>
<style lang="scss">
</style>
