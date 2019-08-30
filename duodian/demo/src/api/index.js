import {axios} from '@/utils/http.js'

export default {
    //获取验证码
    checkCode: (data)=>axios.post('/api/user/checkCode',data),
    //登录
    login: (data)=>axios.post('/api/user/login',data),
    //获取用户信息
    get_userInfo: ()=>axios.get('/api/user/getUserInfo'),
    
    //获取首页轮播
    banner: ()=>axios.get('/api/home/banner'),
    //获取首页商品
    home_shop: (data)=>axios.get('/api/home/shop',{
        params:data
    }),

    //获取分类页面分类
    shopType: ()=>axios.get('/api/shop/shopType'),
    //获取分类页面商品
    shopList: (data)=>axios.get('/api/shop/selectType',{
        params:data
    }),

    //获取购物车商品
    getShopCar: (data)=>axios.get('/api/car/getCar',{
        params:data
    }),
    //添加购物车
    add_shopCar: (data)=>axios.post('/api/car/addCar',data),
    //减少件数
    remove_shopCarList: (data)=>axios.post('/api/car/removeCar',data),
    //删除购物车商品
    remove_shopCar: (data)=>axios.post('/api/car/removeShop',data),
}