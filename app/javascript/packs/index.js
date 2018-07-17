import Vue from 'vue/dist/vue.esm'
import ComponentWrapper from './ComponentWrapper'
import 'vue-awesome/icons'
import Icon from 'vue-awesome/components/Icon'
Vue.component('icon', Icon)
document.addEventListener('DOMContentLoaded', () => {
  new Vue({
    components: { ComponentWrapper }
  }).$mount('#app')
})
