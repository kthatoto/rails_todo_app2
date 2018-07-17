<template lang="pug">
div
  Header(:user="data.props.user")
  component(:is="data.component" :props="data.props")
</template>
<script>
import TasksDashboard from '@/pages/TasksDashboard'
import UserList from '@/pages/UserList'
import Header from '@/components/organisms/Header'
export default {
  components: { TasksDashboard, UserList, Header },
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
  text-decoration: none;
}
a, a:visited {
  color: inherit;
}
</style>
