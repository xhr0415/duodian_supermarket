<template>
    <div class="shopList">
        <div class="left">
            <van-checkbox v-model="item.flag" checked-color="#FE3113" @click="clk_checked(index)"></van-checkbox>
        </div>
        <div class="center">
            <img :src="item.shopdata.cover" alt="">
        </div>
        <div class="right">
            <h2>{{item.shopdata.name}}</h2>
            <p class="guige"><span v-for="(item,index) in JSON.parse(item.shopdata.specs)" :key="index">{{item.key}}: {{item.value}}</span></p>
            <div class="price-count">
                <div class="price">
                    ￥<span>{{item.shopdata.price}}</span>
                </div>
                <div class="count">
                    <button @click="clk_min(item)">-</button>
                    <span class="num">{{item.count}}</span>
                    <button @click="clk_add(item)">+</button>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
import {mapState,mapMutations, mapActions} from 'vuex'
import api from '@/api/index'
export default {
    props:{
        item:Object,
        index:Number,
      
    },
    components:{

    },
    data(){
        return {
            checked:false,
        }
    },
    computed:{
        
    },
    methods:{
       ...mapActions('shopCar',['clk_add','clk_min']),
       ...mapMutations('shopCar',['clk_checked'])
    },
    created(){
        
    },
    mounted(){

    }
}
</script>
<style scoped lang="scss">
    .shopList{
        width: 100%;
        height: 133px;
        padding: 18px 0;
        display: flex;

        .left{
            width: 40px;
            height: 100%;
            display: flex;
            align-items: center;
            justify-content: flex-end;
        }

        .center{
            width: 80px;
            height: 100%;
            margin-left: 10px;
            margin-right: 12px;
            display: flex;
            align-items: center;

            img{
                width: 100%;
                height: 80px;
            }
        }

        .right{
            flex: 1;
            overflow: hidden;
            display: flex;
            flex-direction: column;

            h2{
                width: 100%;
                padding: 0 5px;
                overflow: hidden;
                text-overflow: ellipsis;
                white-space: nowrap;
                font-size:16px;
                color:rgba(17,17,17,1);
            }

            .guige{
                width: 100%;
                padding: 0 15px;
                overflow: hidden;
                text-overflow: ellipsis;
                white-space: nowrap;
                font-size: 12px;
                color:rgba(153,153,153,1);
                margin: 6px 0;
                padding-left: 5px;

                span{
                    margin: 0 5px;
                }
            }

            .self{
                font-size: 8px;
                padding-left: 5px;
                color:rgba(254,70,43,1);
            }

            .price-count{
                flex: 1;
                padding-right: 10px;
                display: flex;

                .price{
                    font-size: 19px;
                    color:rgba(254,49,19,1);
                    flex: 1;
                    display: flex;
                    align-items: center;
                }

                .count{
                    display: flex;
                    align-items: center;
                }
            }

            button{
                width: 28px;
                height: 28px;
                border-radius: 50%;
                border: 1px solid #ccc;
                color: #565656;
                margin: 0 5px;
                background: white;
                font-size: 22px;
            }

            .num{
                margin: 3px;
            }
        }
    }
</style>