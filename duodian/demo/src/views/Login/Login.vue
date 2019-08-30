<template>
    <div class="login">
        <h1>手机号登录</h1>

        <p class="tel_title">手机号</p>
        <div class="phone">
            <input class="ipt" v-model="tel_val" type="text" @input="ipt_change" autofocus="autofocus">
        </div>

        <button :class="{button_active:flag}" @click="clk_btn">获取验证码</button>

        <Dialog v-if="isShow" :tel="tel_val" @hide_dialog="hide_dialog"></Dialog>
    </div>
</template>
<script>
import api from '@/api/index';
import Dialog from './components/Dialog'
export default {
    props:{

    },
    components:{
        Dialog
    },
    data(){
        return {
            flag: false,
            tel_val:'',
            isShow: false,      //是否显示弹框
        }
    },
    computed:{

    },
    methods:{
        //取消弹出框
        hide_dialog(){
            this.isShow = false;
        },
        //输入手机号
        ipt_change(){
            if(this.tel_val.length == 11){
                this.flag = true;
            }
            else{
                this.flag = false;
            }
        },
        //点击登录
        clk_btn(){
            if(this.tel_val.trim() == ''){
                this.$toast('你还没输入呢！')
                return;
            }
            api.checkCode({
                phone: this.tel_val
            }).then(res=>{
                this.$toast(res.data.message);
                this.isShow = true;
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
    .login{
        width: 100%;
        height: 100%;
        padding: 20px;
        
        .tel_title{
            width: 100%;
            font-size:12px;
            font-family:PingFangSC-Regular;
            font-weight:400;
            color:rgba(121,121,121,1);
            margin-top: 50px;
        }

        .phone{
            width: 100%;
            border-bottom:1px solid rgba(224,224,224,1);

            .ipt{
                width: 100%;
                height: 40px;
            }
        }

        button{
            width:100%;
            height:38px;
            outline: none;
            border: 0;
            background:rgba(238,238,238,1);
            border-radius:100px;
            margin: 50px 0;

            font-size:12px;
            font-weight:400;
            color:rgba(169,169,169,1);
        }
        .button_active{
            background:linear-gradient(135deg,rgba(253,88,48,1) 0%,rgba(254,71,35,1) 100%);
            box-shadow:0px 1px 2px 0px rgba(252,36,33,0.21);
            border-radius:50px;

            color: white;
        }

        h1{
            font-size: 35px;
        }
    }
</style>