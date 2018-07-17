<template lang="pug">
.header
  .header__user
    div(v-if="signedIn")
      p.header__userLabel(@click="showingDropdown = !showingDropdown") {{ userName }}
      .dropdown(v-show="showingDropdown")
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
      userName: '',
      showingDropdown: false
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
  &__user {
    float: right;
    margin: 15px 0;
    margin-right: 30px;
    padding: 0 20px;
    height: 30px;
    line-height: 30px;
    vertical-align: middle;
    position: relative;
    background-color: #555;
    &:hover {
      background-color: #777;
    }
    &Label {
      color: white;
      cursor: pointer;
    }
  }
}
.dropdown {
  position: absolute;
  border: 1px solid #aaa;
  background-color: white;
  width: 150px;
  top: 30px;
  right: 0;
  a {
    color: black;
  }
}
</style>
