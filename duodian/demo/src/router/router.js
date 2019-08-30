import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)

export default new Router({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    {
      path:'/',
      redirect:'/home'
    },
    {
      path:'/login',
      name:'login',
      meta:{
        title:'校园超市'
      },
      component: ()=>import('@/views/Login/Login.vue')
    },
    {
      path:'/home',
      name:'home',
      meta:{
        title:'首页'
      },
      component: ()=>import('@/views/Home/Home.vue')
    },
    {
      path:'/type',
      name:'type',
      meta:{
        title:'类型'
      },
      component: ()=>import('@/views/Type/Type.vue')
    },
    {
      path:'/shoppingCar',
      name:'shoppingCar',
      meta:{
        title:'购物车'
      },
      component: ()=>import('@/views/shoppingCar/shoppingCar.vue')
    },
    {
      path:'/my',
      name:'my',
      meta:{
        title:'我的'
      },
      component: ()=>import('@/views/My/My.vue')
    },
    {
      path:'/map',
      name:'map',
      meta:{
        title:'选择地址'
      },
      component: ()=>import('@/components/Map.vue')
    },
    {
      path:'/details',
      name:'details',
      meta:{
        title:'商品详情'
      },
      component: ()=>import('@/views/Details/Details.vue')
    }
  ]
})
