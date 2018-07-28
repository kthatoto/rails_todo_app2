import * as mutationTypes from './mutations'
export default {
  setAll ({ commit }, data) {
    commit(mutationTypes.SET_ALL, data)
  },
  createTask ({ commit }, task) {
    commit(mutationTypes.CREATE_TASK, task)
  }
}
