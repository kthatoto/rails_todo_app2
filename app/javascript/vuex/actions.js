import * as mutationTypes from './mutations'
export default {
  setTasks ({ commit }, tasks) {
    commit(mutationTypes.SET_TASKS, tasks)
  }
}
