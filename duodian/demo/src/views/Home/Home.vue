<template>
    <div class="home" >
        <div class="wrap">
            <!--       (上拉加载 better-scroll)     -->
            <!-- <Bscroll @scroll="upload"> -->
                <!-- <div ref="wrapper"> -->

                    <!-- 原生上拉加载 -->
                    <ProtoPullLoading @scroll="upload">
                        <!-- 定位 -->
                        <div class="location">
                            <div class="left" @click="clk_map">
                                <img src="@/public/img/svg/图标(1).svg" alt="">
                                <span>{{site}}</span>
                            </div>
                            <div class="right">
                                <img src="@/public/img/svg/搜索.svg" alt="">
                            </div>
                        </div>

                        <!-- 轮播图 -->
                        <Banner></Banner>
                        
                        <!-- 大字 -->
                        <ListBox></ListBox>
                        
                        <!-- 今日必购 -->
                        <TodayBuy></TodayBuy>

                        <List v-for="(item,index) in data" :key="index" :item="item" className="list"></List>
                    </ProtoPullLoading>

                <!-- </div> -->
            <!-- </Bscroll> -->
        </div>

        <Footer></Footer>
    </div>
</template>
<script>
import api from '@/api/index'
import Banner from './components/Banner'
import ListBox from './components/ListBox'
import TodayBuy from './components/TodayBuy'
export default {
    name:'home',
    props:{

    },
    components:{
        Banner,
        ListBox,
        TodayBuy
    },
    data(){
        return {
            data:[],
            page:0,     //页数
            limit:10,   //个数
            site:'',    //地址
            scrollTop:0,//子组件里的scrollTop
            isload: true,
        }
    },
    computed:{

    },
    //进入
    activated(){
        if(this.$route.params.item){
            let obj = JSON.parse(this.$route.params.item);
            this.site = obj.name;
        }  
        //缓存上一次的位置
        this.$children[0].$refs.scrollDom.scrollTop = this.scrollTop;
    },
    //离开
    deactivated(){
        
    },
    methods:{
        //请求数据
        getData(){
            if(!this.isload){
                return;
            }
            api.home_shop({
                pageid: this.page,
                limit: this.limit
            }).then(res=>{
                if(res.data.length == 0){       //如果没有数据，开关关掉
                    this.isload = false;
                }
                this.data = this.data.concat(res.data);
            })
        },

        //上拉加载
        upload(){
            this.page++;
            this.getData();
        },
        //点击跳转地图
        clk_map(){
            this.$router.push('/map')
        }
    },
    created(){
        this.getData();

        //根据token 获取用户信息
        sessionStorage.getItem('token') && api.get_userInfo().then(res=>{
            sessionStorage.setItem('userinfo',JSON.stringify(res.data));
        })

        this.$nextTick(()=>{
            
        })
     },
    mounted(){
        let map = new AMap.Map('');
        AMap.plugin(['AMap.Geolocation'],()=>{
            let Map = new AMap.Geolocation({
                enableHighAccuracy: true,
                timeout: 10000,  
             
            });
             map.addControl(Map);
            Map.getCurrentPosition();
            AMap.event.addListener(Map, 'complete', (res)=>{
                this.site = res.formattedAddress;
            });//返回定位信息
            AMap.event.addListener(Map, 'error', (err)=>{
                console.log(err)
            });      //返回定位出错信息
        })
    }
}
</script>
<style scoped lang="scss">
    .home{
        width: 100%;
        height: 100%;

        .location{
            width: 100%;
            height: 49px;
            display: flex;

            .left{
                flex: 1;
                display: flex;
                align-items: center;
                padding-left: 5px;

                img{
                    width: 30px;
                    height: 30px;
                }
            }

            .right{
                width: 30px;
                height: 100%;
                overflow: hidden;

                img{
                    width: 100%;
                    height: 100%;
                }
            }
        }
    }
</style>