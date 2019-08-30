<template>
    <div :class="className" @click="clk_list">
        <div class="left">
            <img v-lazy="item.cover" alt="">
        </div>
        <div class="right">
            <p class="names">{{item.name}}</p>
            <p class="count">累计：{{item.volume}}份 / 已拼{{item.stock}}份</p>
            <p style="color:rgba(254,54,20,1);margin:2px 0;fontSize:10px;">自营</p>
            <p class="price"> ￥<span>{{item.price}}</span></p>
            <span class="shopcar" @click.stop="clk_addShopCar(item)">
                <img src="@/public/img/svg/购物车 1.svg" alt="">
            </span>
        </div>
    </div>
</template>
<script>
import api from '@/api/index'
import {mapActions} from 'vuex'
export default {
    props:{
        className:{
            type:String
        },
        item:{
            type:Object
        }
    },
    components:{

    },
    data(){
        return {

        }
    },
    computed:{

    },
    methods:{
        ...mapActions('shopCar',['getShopCar','clk_addShopCar']),
        //点击进入详情
        clk_list(){
            this.$router.push({
                name:'details',
                params:{
                    item: this.item
                }
            })
        }
    },
    created(){
       
    },
    mounted(){

    }
}
</script>
<style scoped lang="scss">
    .list{
        width: 100%;
        height: 150px;
        padding: 15px;
        border:.5px solid rgba(226,226,226,1);
        display: flex;

        .left{
            width: 120px;
            height: 120px;

            img{
                width: 100%;
                height: 100%;
            }
        }

        .right{
            flex: 1;
            width: 100%;
            height: 100%;
            padding-left: 10px;
            overflow: hidden;
            display: flex;
            flex-direction: column;
            position: relative;

            .names{
                font-size:16px;
                color:rgba(17,17,17,1);
            }

            .count{
                margin: 5px 0;
                font-size:12px;
                color:rgba(153,153,153,1);
            }

            .price{
                flex: 1;
                display: flex;
                align-items: flex-end;
                color:rgba(254,49,19,1);
                font-weight: bold;

                span{
                    font-size: 20px;
                }
            }

            .shopcar{
                width: 32px;
                height: 32px;
                background:rgba(254,49,19,1);
                border-radius: 50%;
                text-align: center;
                line-height: 35px;
                position: absolute;
                right: 0;
                bottom: 0;

                img{
                    width: 15px;
                    height: 15px;
                }
            }
        }
    }

    .smlist{
        width: 100%;
        height: 117px;
        padding: 11px;
        border:.5px solid rgba(226,226,226,1);
        display: flex;

        .left{
            width: 93px;
            height: 93px;

            img{
                width: 100%;
                height: 100%;
            }
        }

        .right{
            flex: 1;
            min-width:30px;
            padding-left: 10px;
            display: flex;
            flex-direction: column;
            position: relative;
            overflow: hidden;

            .names{
                width: 100%;
                height: 30px;
                overflow: hidden;
                white-space: nowrap;
                text-overflow: ellipsis;
                font-size:14px;
                color:rgba(17,17,17,1);
            }

            .count{
                margin: 2px 0;
                font-size:9px;
                color:rgba(153,153,153,1);
            }

            .price{
                flex: 1;
                display: flex;
                align-items: flex-end;
                color:rgba(254,49,19,1);
                font-weight: bold;

                span{
                    font-size: 18px;
                }
            }

            .shopcar{
                width: 22px;
                height: 22px;
                background:rgba(254,49,19,1);
                border-radius: 50%;
                text-align: center;
                line-height: 22px;
                position: absolute;
                right: 0;
                bottom: 0;

                img{
                    width: 12px;
                    height: 12px;
                }
            }
        }
    }

    
</style>