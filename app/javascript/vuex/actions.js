import * as mutationTypes from './mutations'
export default {
  setTasks ({ commit }, todos, dones) {
    commit(mutationTypes.SET_TASKS, todos, dones)
  }
}
