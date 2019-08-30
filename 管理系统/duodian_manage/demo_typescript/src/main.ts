import Vue from 'vue';
import App from './App.vue';
import router from './router/router';
import store from './store/store';
import '@/public/scss/_mixin.scss'
import '@/public/scss/common.scss'
import '@/public/elementui.js'
// 引入 vue富文本
import  VueQuillEditor from 'vue-quill-editor'
import 'quill/dist/quill.core.css'
import 'quill/dist/quill.snow.css'
import 'quill/dist/quill.bubble.css'
Vue.use(VueQuillEditor)

//加载全局组件
// import Com from './utils/loadCom'
// Vue.use(Com);

Vue.config.productionTip = false;

new Vue({
  router,
  store,
  render: (h) => h(App),
}).$mount('#app');
