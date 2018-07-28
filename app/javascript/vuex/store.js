import Vue from 'vue'
import Vuex from 'vuex'
import getters from './getters'
import actions from './actions'
import * as mutationTypes from './mutations'

Vue.use(Vuex)
const state = {
  todos: [],
  dones: [],
  users: [],
  labels: []
}
const mutations = {
  [mutationTypes.SET_ALL] (state, data) {
    state.todos = data.todos
    state.dones = data.dones
    state.users = data.users
    state.labels = data.labels
  }
}
const store = new Vuex.Store({ state, mutations, getters, actions })
export default store
