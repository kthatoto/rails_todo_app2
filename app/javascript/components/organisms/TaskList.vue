<template lang="pug">
.taskList
  h2.taskList__header {{ header }}
  ul.taskList__list
    li(v-for="task in tasks" :key="task.id") {{ task.content }}
</template>
<script>
export default {
  props: ['header', 'tasks']
}
</script>
<style lang="scss" scoped>
.taskList {
}
</style>
