<template lang="pug">
component(:is="data.component" :props="data.props")
</template>
<script>
import TasksDashboard from '@/pages/TasksDashboard'
import UserList from '@/pages/UserList'
export default {
  components: { TasksDashboard, UserList },
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
  box-sizing: border-box;
}
a {
  color: inherit;
  text-decoration: none;
}
.icon {
  vertical-align: text-bottom;
  margin: 0 5px;
}
</style>
