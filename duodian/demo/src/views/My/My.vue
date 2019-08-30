<template>
    <div class="my">
        <div class="wrap">
            <!-- 用户信息 -->
            <div class="user">
                <div class="left">
                    <h2 v-if="islogin" @click="clk_cutUser">{{userinfo.nickname}}</h2>
                    <h2 v-else>
                        <router-link style="color:blue;text-decoration: underline;" to="/login">未登录</router-link>
                    </h2>
                    <p>开启美好的一天...</p>
                </div>
                <div class="right" v-if="islogin">
                    <img :src="'http://127.0.0.1:7001'+userinfo.avatar" alt=" " />
                </div>
            </div>

            <!-- 我的订单 -->
            <div class="order">
                <div class="order_header">
                    <div class="left">
                        我的订单
                    </div>
                    <div class="right">查看全部 > </div>
                </div>

                <div class="order_bottom">
                    <div class="content">
                        <span></span>
                    </div>
                    <div class="content">
                        <span></span>
                    </div>
                    <div class="content">
                        <span></span>
                    </div>
                    <div class="content">
                        <span></span>
                    </div>
                </div>
            </div>

            <!-- 列表 -->
            <div class="my-list">
                <div class="content">
                    <div class="left">
                        <span></span>我的优惠券
                    </div>
                    <div class="right" style="color:rgba(254,49,19,1);fontSize:12px;">8张未使用</div>
                </div>
                <div class="content">
                    <div class="left">
                        <span></span>资质规则
                    </div>
                    <div class="right" style="color:rgba(254,49,19,1);fontSize:12px;"></div>
                </div>
                <div class="content">
                    <div class="left">
                        <span></span>联系客服
                    </div>
                    <div class="right" style="color:rgba(153,153,153,1);fontSize:12px;">400-123-123</div>
                </div>
            </div>
        </div>

        <Footer></Footer>
    </div>
</template>
<script>
import {mapState,mapMutations} from 'vuex'
export default {
    props:{

    },
    components:{

    },
    data(){
        return {
            userinfo:''
        }
    },
    computed:{
        ...mapState('user',['islogin']),
    },
    methods:{
        ...mapMutations('user',['isloginFn']),
        
        //点击切换用户
        clk_cutUser(){
            this.$dialog.confirm({
                message: '确认要切换用户吗？'
            }).then(() => {
                // on confirm
                this.$router.push('/login');
            }).catch(() => {
                // on cancel
            });
        }
    },
    created(){
        this.isloginFn();
        let userinfo = JSON.parse(sessionStorage.getItem('userinfo'));
        if(userinfo){
            this.userinfo = userinfo;
        }
    },
    mounted(){

    }
}
</script>
<style scoped lang="scss">
    .my{
        width: 100%;
        height: 100%;
        background:rgba(248,248,248,1);

        .user{
            width: 100%;
            height: 132px;
            background:rgba(254,49,19,1);
            box-shadow:0px 1px 1px 0px rgba(255,64,54,0.2);
            padding-bottom: 25px;
            display: flex;

            .left{
                flex: 1;
                padding: 0 19px;

                h2{
                    width:80px;
                    height:28px;
                    margin-top: 29px;
                    font-size:25px;
                    color:rgba(255,255,255,1);
                    font-weight:500;
                    line-height:28px;
                    margin-bottom: 5px;
                    // -webkit-text-stroke:1px rgba(255,255,255,1);
                }

                p{
                    font-size: 12px;
                    color:rgba(255,255,255,1);
                }
            }

            .right{
                width:60px;
                height: 100%;
                display: flex;
                align-items: center;

                img{
                    width: 44px;
                    height: 44px;
                }
            }
        }

        .order{
            width:90%;
            height: 150px;
            background:rgba(255,255,255,1);
            box-shadow:0px 16px 10px -10px rgba(0,0,0,0.11),0px 0px 8px -1px rgba(0,0,0,0.06);
            border-radius:6px;
            margin-left: 19px;
            margin-top: -25px;
            margin-bottom: 25px;
            border:1px solid rgba(240,240,240,1);
            padding: 0 15px;
            display: flex;
            flex-direction: column;

            .order_header{
                width: 100%;
                height: 50px;
                display: flex;

                >div{
                    display: flex;
                    align-items: center;
                }

                .left{
                    flex: 1;
                    font-size: 16px;
                }

                .right{
                    flex: 1;
                    font-size: 12px;
                    color:rgba(153,153,153,1);
                    justify-content: flex-end;
                }
            }

            .order_bottom{
                flex: 1;
                margin-top: 10px;
                padding: 15px 0;
                display: flex;

                .content{
                    flex: 1;
                    display: flex;
                    justify-content: center;
                    align-items: center;

                    span{
                        display: inline-block;  
                        width: 55px;
                        height: 52px;
                    }

                    span{
                        background: url('../../public/img/icon.png') no-repeat 5px -318px;
                    }
                }

                .content:nth-child(2){
                    span{
                        background: url('../../public/img/icon.png') no-repeat -78px -318px;
                    }
                }

                .content:nth-child(3){
                    span{
                        background: url('../../public/img/icon.png') no-repeat -157px -318px;
                    }
                }

                .content:nth-child(4){
                    span{
                        background: url('../../public/img/icon.png') no-repeat -245px -318px;
                    }
                }
            }
        }

        .my-list{
            width: 90%;
            height: 171px;
            background:rgba(255,255,255,1);
            box-shadow:0px 0px 8px -1px rgba(0,0,0,0.06);
            margin-left: 19px;
            border-radius:6px;
            border:1px solid rgba(240,240,240,1);
            padding: 0 16px;
            display: flex;
            flex-direction: column;

            .content{
                flex: 1;
                display: flex;

                >div{
                    flex: 1;
                    display: flex;
                    align-items: center;
                }

                .left{
                    font-size: 14px;
                }
                
                .left span{
                    display: inline-block;
                    width: 35px;
                    height: 35px;
                    background: url('../../public/img/icon.png') no-repeat -20px 8px;
                }

                .right{
                    justify-content: flex-end;
                }
            }

            .content:nth-child(2){
                .left span{
                    background: url('../../public/img/icon.png') no-repeat -88px 8px;
                }
            }

            .content:nth-child(3){
                .left span{
                    background: url('../../public/img/icon.png') no-repeat -156px 8px;
                }
            }
        }
    }
</style>