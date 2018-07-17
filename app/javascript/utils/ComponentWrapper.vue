<template>
  <component :is="data.component" v-bind="data.props"/>
</template>
<script>
import TasksDashboard from '../pages/TasksDashboard'
export default {
  components: { TasksDashboard },
  data () {
    return {
      data: {}
    }
  },
  created() {
    this.data = JSON.parse(this.$attrs.data)
  }
}
</script>
<style>
* {
  margin: 0;
  padding: 0;
  list-style: none;
}
</style>

