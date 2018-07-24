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
  [mutationTypes.SET_TASKS] (state, todos, dones) {
    state.todos = todos
    state.dones = dones
  }
}

export default new Vuex.Store({ state, mutations, getters, actions })
