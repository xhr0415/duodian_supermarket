<template>
    <div class="map" v-transition>
        <div class="map-header">
            <div class="left"></div>
            <div class="right">
                <Search @change_val="change_val"></Search>
            </div>
        </div>
        <div class="wrap">
            <div class="li" v-for="(item,index) in arr" :key="index" @click="clk_li(item)">
                <p>{{item.name}}</p>
                <p>{{item.district}}</p>
            </div>
            <div id="container"></div>
        </div>
    </div>
</template>
<script>
import Search from '@/views/Type/components/Search'
import {getPlugin} from '@/utils/map'
export default {
    name:'map',
    props:{

    },
    components:{
        Search
    },
    data(){
        return {
            arr:[],
        }
    },
    computed:{

    },
    methods:{
        change_val(val){
            this.search.search(val,(status,result)=>{
                switch(status){
                    case 'no_data':{
                        this.$toast('暂无该地址');
                        break;
                    }
                    case 'complete':{
                        this.arr = result.tips;
                        break;
                    }
                    default :{
                        this.arr = [];
                        break;
                    }
                }
            })
        },
        //点击
        clk_li(item){
            this.$router.push({
                name:'home',
                params:{
                    item:JSON.stringify(item)
                }
            })
        }
    },
    created(){

    },
    async mounted(){
        this.search = await getPlugin('AMap.Autocomplete',{
            // 配置项
        })
    }
}
</script>
<style scoped lang="scss">
    .map{
        width: 100%;
        height: 100%;
        background: white;

        .map-header{
            width: 100%;
            height: 49px;
            display: flex;

            .left{
                width: 65px;
                height: 100%;
            }

            .right{
                flex: 1;
                padding: 8px 12px;
            }
        }

        .li{
            width: 100%;
            height: 80px;
            background: #F6F6F6;
            padding: 7px 20px;
            border-bottom: 1px solid #ddd;
            display: flex;
            flex-direction: column;

            p{
                flex: 1;
                display: flex;
                align-items: center;
            }

            p:nth-child(2){
                font-size: 14px;
                color: #757575;
            }
        }
    }
</style>