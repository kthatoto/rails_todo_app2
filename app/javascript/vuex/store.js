import Vue from 'vue'
import Vuex from 'vuex'
import getters from './getters'
import actions from './actions'
import * as mutationTypes from './mutations'

Vue.use(Vuex)
const state = {
  todos: [],
  dones: []
}
const mutations = {
  [mutationTypes.SET_TASKS] (state, tasks) {
    state.todos = tasks.todos
    state.dones = tasks.dones
  }
}

export default new Vuex.Store({ state, mutations, getters, actions })
