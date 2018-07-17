import Vue from 'vue/dist/vue.esm'
import ComponentWrapper from './ComponentWrapper'
document.addEventListener('DOMContentLoaded', () => {
  new Vue({
    components: { ComponentWrapper }
  }).$mount('#app')
})
