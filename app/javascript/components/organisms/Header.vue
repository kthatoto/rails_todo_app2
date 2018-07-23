<template lang="pug">
.header.-weight
  .header__logo
  .header__links
    a.header__link(href="/") Dashboard
    a.header__link(href="/users" v-if="signedIn") User List
  .header__user
    div(v-if="signedIn")
      p.header__userLabel(@click="showingDropdown = !showingDropdown")
        | {{ userName }}
        icon.icon.-right(name="angle-down")
      .dropdown(v-show="showingDropdown")
        ul
          li.dropdown__item
            a(href="/signout", data-method="delete") Sign out
    div(v-else)
      a.header__signin(href="/signin")
        | Sign in
        icon.icon.-right(name="user")
</template>
<script>
export default {
  data () {
    return {
      user: {},
      signedIn: false,
      userName: '',
      showingDropdown: false
    }
  },
  created () {
    const props = JSON.parse(this.$attrs.data)
    this.user = props.user
    if (this.user) {
      this.signedIn = true
      this.userName = this.user.name
    }
  }
}
</script>
<style lang="scss">
$headerHeight: 60px;
.header {
  width: 100%;
  background-color: #333;
  height: $headerHeight;
  &__logo {
    float: left;
    width: $headerHeight;
    height: $headerHeight;
  }
  &__links {
    float: left;
    height: 100%;
  }
  &__link {
    height: 100%;
    padding: 0 15px;
    color: white;
    display: inline-block;
    line-height: $headerHeight;
    &:hover {
      color: #ddd;
      background-color: #444;
    }
  }
  &__user {
    float: right;
    margin: 15px 0;
    margin-right: 30px;
    height: 30px;
    line-height: 30px;
    vertical-align: middle;
    position: relative;
    background-color: #555;
    &Label {
      padding: 0 20px;
      color: white;
      cursor: pointer;
      &:hover {
        background-color: #777;
      }
    }
  }
  &__signin {
    display: inline-block;
    color: white;
    padding: 0 20px;
    height: 30px;
    line-height: 30px;
    &:hover {
      background-color: #777;
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
  &__item {
    color: black;
    a {
      display: block;
      padding: 5px 10px;
      &:hover {
        background-color: #eee;
      }
    }
  }
}
</style>
