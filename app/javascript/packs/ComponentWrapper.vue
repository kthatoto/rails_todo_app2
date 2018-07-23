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
<style lang="scss">
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
  width: 1.4rem;
  height: 1.4rem;

  &.-left {
    margin-right: 5px;
  }
  &.-right {
    margin-left: 5px;
  }

  &.-small {
    width: 1rem;
    height: 1rem;
    vertical-align: unset;
  }
  &.-large {
    width: 2rem;
    height: 2rem;
  }
}
</style>
