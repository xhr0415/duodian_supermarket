import Vue from 'vue';
import Router from 'vue-router';

Vue.use(Router);

export default new Router({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    {
      path: '/',
      redirect: '/login'
    },
    {
      path:'/login',
      name:'login',
      meta:{
        title:'登录'
      },
      component: ()=>import('@/views/Login/Login.vue')
    },
    {
      path:'/home',
      name:'home',
      meta:{
        title:'首页'
      },
      component: ()=>import('@/views/Home/Home.vue'),
      children:[
        {
          path:'addbanner',
          name:'addbanner',
          meta:{
            title:'添加banner'
          },
          component: ()=>import('@/views/AddBanner/AddBanner.vue')
        },
        {
          path:'shoplist',
          name:'shoplist',
          meta:{
            title:'商品列表'
          },
          component: ()=>import('@/views/ShopList/ShopList.vue')
        },
        {
          path:'addshop',
          name:'addshop',
          meta:{
            title:'添加商品'
          },
          component: ()=>import('@/views/AddShop/AddShop.vue')
        },
        {
          path:'details',
          name:'details',
          component: ()=>import('@/views/Details/Details.vue')
        }
      ]
    }
  ],
});
