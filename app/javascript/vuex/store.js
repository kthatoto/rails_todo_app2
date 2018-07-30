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
  },
  [mutationTypes.CREATE_TASK] (state, task) {
    state.todos = [
      task,
      ...state.todos
    ]
  },
  [mutationTypes.UPDATE_TASK] (state, task) {
    if (task.status === 'todo') {
      state.todos = state.todos.map(todo => {
        return (todo.id === task.id) ? task : todo
      })
    } else if (task.status === 'dones') {
    }
  },
  [mutationTypes.TOGGLE_TASK_STATUS] (state, taskInfo) {
    if (taskInfo.from === 'todo' && taskInfo.to === 'done') {
      const task = taskInfo.task
      state.todos = state.todos.filter(todo => todo.id !== task.id)
      state.dones = [
        task,
        ...state.dones
      ]
    } else if (taskInfo.from === 'done' && taskInfo.to === 'todo') {
      const task = taskInfo.task
      state.dones = state.dones.filter(done => done.id !== task.id)
      state.todos = [
        task,
        ...state.todos
      ]
    }
  },
  [mutationTypes.DELETE_TASK] (state, taskInfo) {
    if (taskInfo.type === 'todo') {
      state.todos = state.todos.filter(todo => todo.id !== taskInfo.id)
    } else if ( taskInfo.type === 'dones') {
    }
  }
}
const store = new Vuex.Store({ state, mutations, getters, actions })
export default store
