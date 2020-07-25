<template>
  <div class="aboutMe">
    <h1>关于我自己</h1>
  </div>
</template>

<script>
export default {
  head() {
    return { title: `关于` }
  },
  computed: {
    archives() {
      return this.$store.state.archive.data
    }
  },
  fetch({ store }) {
    return store.dispatch('getArchive')
  }
}
</script>

<style scoped></style>
