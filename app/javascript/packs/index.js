import Vue from 'vue'
import Root from '../pages/root.vue'
document.addEventListener('DOMContentLoaded', () => {
  new Vue({
    el: '#app',
    render: h => h(Root)
  })
})
