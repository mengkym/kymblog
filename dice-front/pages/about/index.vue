<template>
  <div class="aboutme">
    <div class="profile">
      <transition name="fade">
        <img src="/logo.png" width="120px" height="120px" />
      </transition>
    </div>
    <div>
      <p class="myname">靳兆孟</p>
      <p class="mytitle">前端开发者</p>
    </div>
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

<style scoped>
.aboutme {
  text-align: center;
}

.profile {
  width: 100%;
  height: 120px;
  padding: 1.2em 0 1.2em;
  animation: scale;
}

.fade-enter {
  opacity: 0;
  transform: translateY(50px);
}
.fade-leave-to {
  opacity: 0;
  transform: translateY(100px);
}
.fade-enter-active {
  transition: all 0.5s;
}
.fade-leave-active {
  transition: all 0.8s cubic-bezier(, 0.5, 0.8, 1);
}

.myname {
  display: inline-block;
  font-size: 1.5em;
  font-weight: 400;
  line-height: 1.5em;
  margin: 1em 0;
}

.mytitle {
  font-size: 1em;
  line-height: 1em;
  margin: 0;
}
</style>
