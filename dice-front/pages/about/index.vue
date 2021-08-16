<template>
  <div class="aboutme">
    <div class="profile">
      <transition name="fade">
        <img
          v-if="profileflag"
          src="/profile.webp"
          width="120px"
          height="120px"
        />
      </transition>
    </div>
    <div>
      <p class="myname">靳兆孟</p>
      <p class="mytitle">&nbsp;前端开发者 热爱垃圾食品 狮子座&nbsp;</p>
    </div>
  </div>
</template>

<script>
export default {
  head() {
    return { title: `关于` }
  },
  data() {
    return {
      profileflag: false
    }
  },
  mounted() {
    this.profileflag = true
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

.slide-fade-enter-active {
  transition: all 0.3s ease;
}
.slide-fade-leave-active {
  transition: all 0.3s cubic-bezier(1, 0.5, 0.8, 1);
}
.slide-fade-enter,
.slide-fade-leave-to
/* .slide-fade-leave-active for below version 2.1.8 */ {
  transform: translateX(10px);
  opacity: 0;
}

.profile img {
  border-radius: 50%;
  background-color: #e6e6fa;
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

blockquote {
  border: none;
  font: 1.2em/1.6em Georgia, 'Times New Roman', Times, serif;
  margin-bottom: -30px;
  quotes: '\201C''\201D''\2018''\2019';
}

.mytitle:before {
  content: open-quote;
  font-weight: bold;
  font-size: 20px;
}

.mytitle:after {
  content: close-quote;
  font-weight: bold;
  font-size: 20px;
}

@keyframes circle {
  0% {
    transform: scale(0);
  }

  40% {
    transform: scale(1.2);
  }

  100% {
    transform: scale(1);
  }
}

.fade-enter-active {
  animation: circle 0.5s;
}

.fade-leave-active {
  animation: circle 0.5s reverse;
}
</style>
