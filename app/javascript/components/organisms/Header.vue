<template lang="pug">
.header
  p {{ userName }}
  div(v-if="signedIn")
    a(href="/users/sign_out", data-method="delete") Sign out
  div(v-else)
    a(href="/users/sign_in") Sign in
</template>
<script>
export default {
  props: ['user'],
  data () {
    return {
      signedIn: false,
      userName: ''
    }
  },
  created () {
    if (this.user) {
      this.signedIn = true
      this.userName = this.user.name
    }
  }
}
</script>
<style lang="scss">
.header {
  width: 100%;
  background-color: #333;
  height: 60px;
  a {
    color: white;
  }
}
</style>
