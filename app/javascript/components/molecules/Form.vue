<template lang="pug">
.form
  slot
</template>
<script>
export default {
}
</script>
<style lang="scss">
.form {
  overflow: hidden;
  background-color: #ddd;
  border-radius: 5px;
  padding: 10px;
  width: 400px;
  th {
    width: 90px;
    text-align: right;
    padding-right: 5px;
    padding-top: 5px;
    vertical-align: top;
  }
  input {
    padding: 5px;
    font-size: 1.4rem;
    border: 1px solid #ccc;
    outline: none;
    border-radius: 5px;
    &:focus {
      border: 1px solid #5cb3fd;
    }
  }
  .buttons {
    float: right;
  }
}
</style>
