<template lang="pug">
tr
  th Labels
  td
    input(type=text v-model="labelName" list="labelList" @keydown="addLabel")
    datalist(id="labelList")
      option(v-for="label in labels" :key="label.id" :value="label.name")
    ul
      li(v-for="label in addingLabels" :key="label") {{ label }}
</template>
<script>
import store from '@/vuex/store'
export default {
  data () {
    return {
      labelName: '',
      labels: [],
      addingLabels: []
    }
  },
  created () {
    this.labels = store.getters.getLabels
  },
  methods: {
    addLabel (e) {
      if (!(e.keyCode === 13) || this.labelName.length === 0) {
        return
      }
      if (this.addingLabels.filter(label => label === this.labelName).length > 0) {
        alert('Already added')
        return
      }
      this.addingLabels.push(this.labelName)
      console.log(this.addingLabels)
      this.labelName = ''
    }
  },
  watch: {
    addingLabels () {
      this.$emit('update', this.addingLabels)
    }
  }
}
</script>
<style lang="scss">
</style>
