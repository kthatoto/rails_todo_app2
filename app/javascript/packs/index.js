import Vue from 'vue/dist/vue.esm'
import Vuex from 'vuex'
import store from '@/vuex/store'
import ComponentWrapper from './ComponentWrapper'
import VueHeader from '@/components/organisms/Header'
import 'vue-awesome/icons'
import Icon from 'vue-awesome/components/Icon'
Vue.component('icon', Icon)
Vue.use(Vuex)

document.addEventListener('DOMContentLoaded', () => {
  new Vue({
    components: { ComponentWrapper, VueHeader },
    store
  }).$mount('#app')
})
