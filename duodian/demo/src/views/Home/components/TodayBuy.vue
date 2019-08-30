<template>
    <div class="todayBuy">
        <h1>每日必购  <span>大家都在卖</span></h1>
        <div class="list">
            <div v-for="(item,index) in data" :key="index">
                <img :src="item.img" />
            </div>
        </div>
    </div>
</template>
<script>
export default {
    props:{

    },
    components:{

    },
    data(){
        return {
            data:[
                {
                   img:require('@/public/img/今日必购/未命名-1.png') 
                },
                {
                   img:require('@/public/img/今日必购/未命名-2.png') 
                },
                {
                   img:require('@/public/img/今日必购/未命名-3.png') 
                }
            ]
        }
    },
    computed:{

    },
    methods:{

    },
    created(){

    },
    mounted(){

    }
}
</script>
<style scoped lang="scss">
    .todayBuy{
        width: 100%;
        height: 192px;
        display: flex;
        flex-direction: column;

        h1{
            width: 100%;
            height: 40px;
            display: flex;
            align-items: center;
            padding-left: 20px;
            font-size: 20px;
            font-weight: bolder;

            span{
                height: 100%;
                font-size: 13px;
                display: flex;
                align-items: flex-end;
                margin-top: -15px;
                margin-left: 10px;
            }
        }
        
        .list{
            width: 100%;
            height: 100%;
            display: flex;
            overflow: hidden;

            >div{
                flex: 1;
                width: 100%;
                height: 100%;

                img{
                    width: 100%;
                    height: 100%;
                }
            }
        }
    }
</style>