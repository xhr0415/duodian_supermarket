import Vue from 'vue'
import App from './App.vue'
import router from './router/router'
import store from './store/store'
import '@/public/scss/_mixin.scss'
import '@/public/scss/common.scss'
import '@/config/vant.js'
import 'swiper/dist/css/swiper.css'//这里注意具体看使用的版本是否需要引入样式，以及具体位置。

// 加载全局组件
import Com from '@/public/base-ui.js'
Vue.use(Com);

// 轮播图
import VueAwesomeSwiper from 'vue-awesome-swiper'
Vue.use(VueAwesomeSwiper, /* { default global options } */)


import lazyLoad from 'vue-lazyload'
Vue.use(lazyLoad,{
  preLoad:1.3,
  attempt:1,
  loading:'@/public/img/loading.gif'
})

// 转场动画
import Vueg from'vueg';
const Voptions= {
  duration:'.4',
  firstEntryDisable:false,
  falsefirstEntryDuration:'.6',
  forwardAnim:'fadeInRight',
  fedeInLeftsameDepthDisable:false,
  falsetabs: [],
  tabsDisable:false,
  falsedisable:false
}
Vue.use(Vueg,router,Voptions);

Vue.config.productionTip = false;

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
