<template>
  <div>
    <div v-for="article in articles" :key="article.id" class="article-item">
      <div class="touch-mask">
        <nuxt-link :to="{ path: '/article/' + article.id }" class="touch-link"
          >{{ article.title }}
        </nuxt-link>
      </div>
      <h2 class="article-head text-bold">
        <nuxt-link :to="{ path: '/article/' + article.id }"
          >{{ article.title }}
        </nuxt-link>
      </h2>
      <p class="article-date">
        <span class="icon-folder"></span>
        {{ article.category | formatCategory }}
      </p>
      <p class="article-date">
        <span class="icon-eye"></span> {{ article.hits }}
      </p>
      <!-- <p class="article-date">
        <span class="icon-bubble2"> {{ article.commentCount }} </span>
      </p> -->
      <p class="article-date">
        {{ article.createTime | time('yyyy-MM-dd hh:mm') }}
      </p>
      <div class="article-tags">
        <label
          v-for="tag in $util.stringToTags(article.tags)"
          :key="tag"
          class="article-tag"
        >
          <nuxt-link :to="{ path: '/tag/' + tag }">#{{ tag }}</nuxt-link>
        </label>
      </div>
      <div
        v-highlight
        class="article-summary markdown-body"
        v-html="$options.filters.ellipIndexContent(article.content)"
      ></div>
      <nuxt-link
        class="article-more text-primary"
        :to="{ path: '/article/' + article.id }"
        >阅读全文
      </nuxt-link>
    </div>
    <div class="front-page">
      <div v-if="currentPage > 1" class="pre text-primary">
        <nuxt-link :to="{ path: '', query: { page: currentPage - 1 } }"
          >← 上一页
        </nuxt-link>
      </div>
      <div v-if="currentPage < totalPage" class="next text-primary">
        <nuxt-link :to="{ path: '', query: { page: currentPage + 1 } }"
          >下一页 →
        </nuxt-link>
      </div>
    </div>
  </div>
</template>

<script type="text/ecmascript-6">
export default {
  watchQuery: ['page'],
  key: (to) => to.fullPath,
  transition (to, from) {
    return 'move'
  },
  data(){
    return{
      currentYear:new Date().getFullYear()
    }
  },
  head () {
    return { title: `博客` }
  },
  computed: {
    articles () {
      return this.$store.state.article.list.data
    },
    totalPage () {
      return this.$store.state.article.list.totalPage
    },
    currentPage () {
      return this.$store.state.article.list.currentPage
    }
  },
  fetch ({ store, query }) {
    return store.dispatch('getArticles', query.page)
  }
}
</script>

<style>
.article-item .markdown-body img {
  max-width: 100%;
  margin: 0.5rem auto;
  display: block;
  text-align: center;
  border-radius: 4px;
  opacity: 0.9;
  -webkit-line-clamp: 1;
  text-overflow: ellipsis;
}
</style>

<style scoped>
.article-item {
  padding: 1.2em 0 1.2em;
  border-bottom: 1px solid #ddd;
  overflow: hidden;
  position: relative;
}

.article-item:first-child {
  margin-top: 10px;
}

.article-head {
  line-height: 1.2;
  font-size: 1.2rem;
  margin: 0;
}

.touch-mask {
  display: inline-block;
  position: absolute;
  height: 100%;
  width: 100%;
  top: 0;
  left: 0;
  opacity: 0;
  /* background-color: #999; */
}

.touch-link {
  display: block;
  height: 100%;
  width: 100%;
}

.article-head > a {
  color: #404040;
  text-decoration: none;
  position: relative;
  overflow: hidden;
}

.article-head > a:before {
  content: '';
  position: absolute;
  z-index: -1;
  height: 2px;
  bottom: 0;
  left: 51%;
  right: 51%;
  background: #04ceff;
  transition-duration: 0.2s;
}

.article-head > a:hover:before {
  left: 0;
  right: 0;
}

.article-item .article-date {
  display: inline-block;
  color: #969696;
  margin: 5px 5px;
  font-size: 0.9em;
}

.article-item .article-tags {
  font-weight: bold;
}

.article-item .article-tags .article-tag {
  margin: 0 0.2em;
  text-decoration: none;
}

.article-item .article-tags .article-tag a {
  color: unset;
  text-decoration: none;
  transition: all 0.3s;
}

.article-item .article-tags .article-tag a:hover {
  color: #999;
}

.article-item .article-tags .article-tag:nth-child(1n) {
  color: #6fa3ef;
}

.article-item .article-tags .article-tag:nth-child(2n) {
  color: #ff9800;
}

.article-item .article-tags .article-tag:nth-child(3n) {
  color: #46c47c;
}

.article-item .article-tags .article-tag:nth-child(4n) {
  color: #f9bb3c;
}

.article-item .article-tags .article-tag:nth-child(5n) {
  color: #bc99c4;
}

.article-item .article-summary {
  margin-top: 1em;
  font-size: 0.9rem;
  color: #999;
}

.article-item .article-more {
  color: #c0c2c8;
  font-weight: bold;
  font-size: 12px;
  text-decoration: none;
  display: inline-block;
  transition: all 0.3s;
  float: right;
}

.article-item .article-more:hover {
  color: #626675;
  transform: translateX(-10px);
}

.front-page {
  margin: 4em 3em;
  font-size: 15px;
}

.front-page a {
  font-weight: bold;
  color: #c0c2c8;
  text-decoration: none;
}

.front-page a:hover {
  color: #626675;
}

.front-page .pre {
  float: left;
  transition-duration: 0.3s;
}

.front-page .next {
  float: right;
  transition-duration: 0.3s;
}

.front-page .pre:hover {
  transform: translateX(-10px);
}

.front-page .next:hover {
  transform: translateX(10px);
}
</style>
