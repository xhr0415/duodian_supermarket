<template>
    <div class="shoppingCar">
        <div class="wrap">
            <div v-if="!islogin"><router-link to="/login" style="color:blue">去登录</router-link></div>
            <div class="wrapper" v-else>
                <!-- 列表 -->
                <div class="content" ref="slideContent">
                    <SlideList v-for="(item,index) in shopCarList" :key="index" :item="item" @remove_slideList="refresh_slideList">
                        <ShopList :item="item" :index="index"></ShopList>
                    </SlideList>
                </div>

                <!-- 底部 -->
                <div class="sum_footer">
                    <div class="left">
                        <van-checkbox v-model="checked" checked-color="#07c160" @click="clk_all">全选</van-checkbox>
                    </div>
                    <div class="center">
                        合计：<span>￥ {{sum_price}}</span>
                    </div>
                    <div class="right">
                        去结算
                    </div>
                </div>
            </div>
        </div>

        <Footer></Footer>
    </div>
</template>
<script>
import {mapState,mapGetters,mapMutations,mapActions} from 'vuex';
import api from '@/api/index'
import ShopList from './components/ShopList'
import SlideList from './components/SlideList'
export default {
    name:'shopCar',
    props:{

    },
    components:{
        ShopList,
        SlideList
    },
    data(){
        return {
            checked:false
        }
    },
    computed:{
        ...mapState('user',['islogin']),
        ...mapGetters('shopCar',['sum_price']),
        ...mapState('shopCar',['shopCarList','all_checked'])
    },
    methods:{
        ...mapMutations('user',['isloginFn']),
        ...mapMutations('shopCar',['clk_all_checked','clk_checked']),
        ...mapActions('shopCar',['getShopCar']),
        //点击全部按钮
        clk_all(){
            this.clk_all_checked();
            this.checked = this.all_checked;
        },
        //删除之后更新 移动的距离
        refresh_slideList(){
            Array.from(this.$refs.slideContent.children).forEach(item=>{
                item.style.transform = `translate(0,0)`;
            }) 
        }
    },
    activated(){
        this.isloginFn();
        
        if(this.islogin){
            this.getShopCar();          //获取购物车数据
        }

        // this.$nextTick(()=>{
        //     console.log(this.$refs.slideContent.children)
        // })
    },
    mounted(){
       

    },
    watch:{
        all_checked(val){
            this.checked = val;
        }
    }
}
</script>
<style scoped lang="scss">
    .wrapper{
        width: 100%;
        height: 100%;
        display: flex;
        flex-direction: column;

        .content{
            flex: 1;
            overflow-y: auto;
        overflow-x: hidden;

        }

        .sum_footer{
            width: 100%;
            height: 49px;
            background:rgba(255,255,255,1);
            border-radius:0px 0px 6px 6px;
            border:1px solid rgba(237,237,237,1);
            display: flex;

            >div{
                flex: 1;
                display: flex;
                align-items: center;
            }

            .left{
                font-size:13px;

                .van-checkbox{
                    margin-left: 10px;
                }
            }
            
            .center{
                font-size: 14px;
                font-weight:500;
                justify-content: center;
                color:rgba(17,17,17,1);

                span{
                    font-size: 18px;
                    color:rgba(254,49,19,1);
                }
            }

            .right{
                font-size: 16px;
                color: white;
                justify-content: center;
                background:rgba(255,64,54,1);
                box-shadow:0px 1px 1px 0px rgba(255,64,54,0.2);
            }
        }
    }
</style>