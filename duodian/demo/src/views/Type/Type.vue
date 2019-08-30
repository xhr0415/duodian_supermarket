<template>
    <div class="type">
        <!-- 搜索 -->
        <div class="searchBox">
            <Search></Search>
        </div>
        <div class="wrap">
            <div class="content">
                <div class="left">
                    <p v-for="(item,index) in typeArr" :key="item.id" :class="{left_active:ind==index}" @click="clk_left(index)">
                        {{item.title}}
                    </p>
                </div>
                <div class="right">
                    <p class="right-header">
                        <span :class="{span_active:Rind==-1}" @click="clk_all">全部</span>
                        <span v-for="(item,index) in rightType" :key="item.id" :class="{span_active:index==Rind}" @click="clk_rightSpan(index)">{{item.name}}</span>
                    </p>

                    <div class="right_content">
                        <ProtoPullLoading @scroll="upload">
                            <List v-for="(item,index) in arr" :key="index" :item="item" className="smlist"></List>
                        </ProtoPullLoading>
                    </div>
                </div>
            </div>
        </div>

        <Footer></Footer>
    </div>
</template>
<script>
import api from '@/api/index'
import Search from './components/Search'
export default {
    name:'type',
    props:{

    },
    components:{
        Search
    },
    data(){
        return {
            ind:0,          //左边的ind
            Rind:-1,        //右边头部类型ind
            typeArr:[],     //所有数据
            rightType:[],   //右边数据
            arr:[],
            limit:5,        //条数
            page:0,         //页数
        }
    },
    computed:{

    },
    methods:{
        //点击左边
        clk_left(index){
            this.ind = index;
            this.rightType = this.typeArr[index].children;
            this.getList();
        },
        //点击右边头部
        clk_rightSpan(index){
            this.Rind = index;
            this.getList();
        },
        //点击全部
        clk_all(){
            this.Rind = -1;
            this.getList();
        },
        //获取商品
        getList(){
            let LActive = this.typeArr[this.ind];
            let RActive = this.rightType[this.Rind];
            let obj = {};

            obj = RActive ? {
                type_id: LActive.id,
                category_id: RActive.id,
                limit: this.limit,
            } : {
                type_id: LActive.id,
                limit: this.limit,
            }
            
            api.shopList(obj).then(res=>{
                this.arr = res.data;
            })
        },
        //上拉加载
        upload(){
            this.page++;
            let LActive = this.typeArr[this.ind];
            let RActive = this.rightType[this.Rind];
            let obj = {};

            obj = RActive ? {
                type_id: LActive.id,
                category_id: RActive.id,
                limit: this.limit,
                pageid: this.page
            } : {
                type_id: LActive.id,
                limit: this.limit,
                pageid: this.page
            }
            api.shopList(obj).then(res=>{
                this.arr = this.arr.concat(res.data);
            })
        }
    },
    created(){
        this.$nextTick(()=>{
            api.shopType().then(res=>{
                this.typeArr = res.data;
                this.rightType = this.typeArr[0].children;
                this.getList();
            })
        })
    },
    mounted(){

    }
}
</script>
<style scoped lang="scss">
    .type{
        width: 100%;
        height: 100%;

        .searchBox{
            width: 100%;
            height: 49px;
            background:rgba(255,255,255,1);
            border-bottom:1px solid rgba(237,237,237,1);
            padding: 8px 15px;
        }

        .content{
            width: 100%;
            height: 100%;
            display: flex;
        }

        .content .left{
            width: 86px;
            height: 100%;
            background:rgba(250,250,250,1);
            overflow: auto;

            p{
                width: 100%;
                height: 50px;
                font-size:12px;
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .left_active{
                color: red;
            }
        }
        .content .right{
            flex: 1;
            display: flex;
            flex-direction: column;
            overflow: hidden;
            
            .right-header{
                width: 100%;
                height: 27px;
                border-bottom: 1px solid #eee;
                font-size:12px;
                display: flex;
                align-items: center;
                overflow-x: auto;
                white-space: nowrap;

                span{
                    padding: 0 10px;
                    color: #999999
                }

                .span_active{
                    color: black;
                    font-size: 13px;
                }
            }

            .right_content{
                flex: 1;
                width: 100%;
                height: 100%;
                overflow: auto;
            }
        }
    }
</style>