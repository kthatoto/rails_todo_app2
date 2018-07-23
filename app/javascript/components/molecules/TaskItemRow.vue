<template lang="pug">
.taskItemRow
  .taskItemRow__label {{ type }}:
  .taskItemRow__tags
    Tag(v-for="tag in tags" :body="tag.name")
</template>
<script>
import Tag from '@/components/atoms/Tag'
export default {
  components: { Tag },
  props: ['type', 'tags']
}
</script>
<style lang="scss">
.taskItemRow {
  $infoLabelWidth: 75px;
  font-size: 1.2rem;
  margin-bottom: 5px;
  overflow: hidden;
  &__label {
    width: $infoLabelWidth;
    float: left;
    font-size: inherit;
    text-align: right;
    padding-right: 5px;
  }
  &__tags {
    font-size: inherit;
    float: left;
    width: calc(100% - #{$infoLabelWidth});
  }
}
</style>
