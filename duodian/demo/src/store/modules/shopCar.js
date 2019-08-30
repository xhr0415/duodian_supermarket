import api from '@/api/index'
import Vue from 'vue'

export default {
    namespaced:true,           //命名空间
    state: {
        shopCarList:[],         //购物车数据 多一个flag 是否选中,
        all_checked:false,      //全部选中
    },
    getters:{
        //计算总价
        sum_price(state){
            let sum = 0;
            sum = state.shopCarList.reduce((prev,next)=>{
                if(next.flag){
                    return prev + next.shopdata.price * next.count
                }
                else{
                    return prev;
                }
            },0)
            return sum;
        }
    },
    mutations: {
        setShopCar(state,data){
            let arr = [];
            // 保留上一次的flag;
            data.forEach((item)=>{
                let index = state.shopCarList.findIndex(val=>val.id == item.id);
                if(index !== -1){
                    arr.push({
                        flag: state.shopCarList[index].flag,
                        ...item
                    })   
                }
                else{
                    arr.push({
                        flag:false,
                        ...item
                    })    
                }
            })
            state.shopCarList = arr;
            if(state.shopCarList.length > 0){
                state.all_checked = state.shopCarList.every(item=>item.flag===true);
            }
            else{
                state.all_checked = false;
            }
        },
        //点击选中按钮
        clk_checked(state,index){
            state.shopCarList[index].flag = !state.shopCarList[index].flag;
            state.all_checked = state.shopCarList.every(item=>item.flag==true);
        },
        //点击全部选中
        clk_all_checked(state){
            state.all_checked = !state.all_checked;
            state.shopCarList.forEach(item=>item.flag = state.all_checked)
        }
    },
    actions: { 
        //获取购物车数据
         getShopCar(context){
            let userinfo = JSON.parse(sessionStorage.getItem('userinfo'));
            api.getShopCar({
                user_id: userinfo.uid
            }).then(res=>{
                context.commit('setShopCar',res.data);
            }).catch((err)=>{
                Vue.prototype.$toast('用户信息过期；请重新登录哦！亲');
                sessionStorage.clear();
                context.rootState.user.islogin = false;     //调用另一个模块
            })
        },
        // 添加到购物车
        clk_addShopCar(context,item){
            let userinfo = sessionStorage.getItem('userinfo');
            
            if(userinfo){
                userinfo = JSON.parse(userinfo);
                api.add_shopCar({
                    user_id: userinfo.uid,
                    shop_id: item.id
                }).then(res=>{
                    Vue.prototype.$toast('添加购物车成功！')
                }) 
            }
            else{
                Vue.prototype.$toast('亲，请登录哦！')
            }
        },
        //添加件数
        clk_add(context,item){
            api.add_shopCar({
                user_id: item.userid,
                shop_id: item.shopid
            }).then(res=>{
                if(res.code){
                    context.dispatch('getShopCar');
                }
            })
        },
        //减少件数
        clk_min(context,item){
            if(item.count <= 1){
                Vue.prototype.$toast('不可以再减了，亲！');
                return;
            }
            api.remove_shopCarList({
                user_id: item.userid,
                shop_id: item.shopid
            }).then(res=>{
                context.dispatch('getShopCar');
            })
        },
        //删除商品
        clk_remove(context,item){
            api.remove_shopCar({
                user_id: item.userid,
                shop_id: item.shopid
            }).then(res=>{
                Vue.prototype.$toast('删除成功！');
                context.dispatch('getShopCar');
            })
        }
    }
}