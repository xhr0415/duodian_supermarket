import { axios } from '@/utils/request.js'

export default {
    //登录
    login: (data) => axios.post('/api/admin/login', data),
    getShopType: () => axios.get('/api/shop/shopType'),
    homeBanner: () => axios.get("/api/home/banner"),
    //添加banner
    addBanner: (data)=>axios.post('/api/home/addBanner',data),
    //获取商品分类
    getShopType:()=>axios.get('/api/shop/shopType'),
    //获取所有的商品
    allShop:()=>axios.get('/api/shop/allShop'),
    //添加商品
    addShop:(data)=>axios.post('/api/shop/addShop',data)
}