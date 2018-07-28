<template lang="pug">
tr
  th Labels
  td
    input(type=text v-model="labelName" list="labelList" @keydown="addLabel")
    datalist(id="labelList")
      option(v-for="label in labels" :key="label.id" :value="label.name")
    ul
      li(v-for="(label, i) in addingLabels" :key="label" class="labels__item")
        | {{ label }}
        icon.icon(name="times" @click.native="removeLabel(i)")
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
    },
    removeLabel (i) {
      this.addingLabels.splice(i, 1)
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
.labels {
  &__item {
    display: inline-block;
    padding: 0 5px;
    background-color: #555;
    color: white;
    border-radius: 3px;
    margin: 0 3px 3px 0;
  }
}
.icon {
  cursor: pointer;
  border-left: 1px solid white;
  margin-left: 3px;
  padding-left: 5px;
}
</style>
