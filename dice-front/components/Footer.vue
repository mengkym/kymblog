<template>
  <div class="footer">
    <p class="copyright">
      Copyright © 2021 | J2M |
      <a href="http://beian.miit.gov.cn/">鲁ICP备19033329号</a>
    </p>
    <div v-highlight v-html="options.blog_footer" class="markdown-body"></div>
  </div>
</template>

<script type="text/ecmascript-6">
export default {
  computed: {
    options() {
      return this.$store.state.option.data
    }
  }
}
</script>

<style scoped>
.footer {
  padding: 1em 0;
  margin: 0 auto;
  max-width: 850px;
  border-top: 1px solid #e5e5e5;
  text-align: center;
  font-size: 0.8em;
  color: #c8c8c8;
}

a {
  color: #5764c6;
  text-decoration: none;
  color: #c8c8c8;
}
a:hover {
  color: #626675;
}
</style>
