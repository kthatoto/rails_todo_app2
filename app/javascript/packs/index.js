import Vue from 'vue/dist/vue.esm'
import store from '@/vuex/store'
import ComponentWrapper from './ComponentWrapper'
import VueHeader from '@/components/organisms/Header'
import 'vue-awesome/icons'
import Icon from 'vue-awesome/components/Icon'
Vue.component('icon', Icon)

document.addEventListener('DOMContentLoaded', () => {
  new Vue({
    components: { ComponentWrapper, VueHeader },
    store
  }).$mount('#app')
})
