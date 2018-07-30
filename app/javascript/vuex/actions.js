import * as mutationTypes from './mutations'
export default {
  setAll ({ commit }, data) {
    commit(mutationTypes.SET_ALL, data)
  },
  createTask ({ commit }, task) {
    commit(mutationTypes.CREATE_TASK, task)
  },
  updateTask ({ commit }, task) {
    commit(mutationTypes.UPDATE_TASK, task)
  },
  toggleTaskStatus ({ commit }, taskInfo) {
    commit(mutationTypes.TOGGLE_TASK_STATUS, taskInfo)
  },
  deleteTask ({ commit }, taskInfo) {
    commit(mutationTypes.DELETE_TASK, taskInfo)
  }
}
