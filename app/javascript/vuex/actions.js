import * as mutationTypes from './mutations'
export default {
  setAll ({ commit }, data) {
    commit(mutationTypes.SET_ALL, data)
  }
}
