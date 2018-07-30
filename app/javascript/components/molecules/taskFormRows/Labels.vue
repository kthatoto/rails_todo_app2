<template lang="pug">
tr
  th Labels
  td
    input(type=text v-model="labelName" list="labelList" @keydown="addLabel")
    datalist(id="labelList")
      option(v-for="label in labels" :key="label.id" :value="label.name")
    ul
      li.labels__item(v-for="(label, i) in addingLabels" :key="label")
        | {{ label }}
        icon.icon(name="times" @click.native="removeLabel(i)")
</template>
<script>
import store from '@/vuex/store'
export default {
  props: ['propLabels'],
  data () {
    return {
      labelName: '',
      labels: [],
      addingLabels: []
    }
  },
  created () {
    this.labels = store.getters.getLabels
    if (this.propLabels) {
      this.initLabels()
    }
  },
  methods: {
    initLabels () {
      this.addingLabels = this.propLabels
    },
    addLabel (e) {
      if (!(e.keyCode === 13) || this.labelName.length === 0) {
        return
      }
      if (this.addingLabels.filter(label => label === this.labelName).length > 0) {
        alert('Already added')
        return
      }
      this.addingLabels.push(this.labelName)
      this.labelName = ''
    },
    removeLabel (i) {
      this.addingLabels.splice(i, 1)
    },
    emit () {
      this.$emit('update', this.addingLabels)
    }
  },
  watch: {
    propLabels () {
      this.initLabels()
    }
  }
}
</script>
<style lang="scss" scoped>
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
