<template>
    <div class="dialog">
        <div class="mask" @click="clk_mask"></div>
        <div class="content">
            <h2>请输入验证码</h2>
            <p class="title"><span>6</span>位短信验证码已发送至 <span>{{tel}}</span></p>

            <div class="yzm">
                <input type="text" autofocus="autofocus" class="ipt" v-model="val" @keyup="keyupFn">
                <div class="li" v-for="(item,index) in num" :key="item">{{arr[index]}}</div>
            </div>
            
            <p class="send-again"><span>{{times}}</span> 秒后重新发送</p>

            <button @click="clk_btn">登录</button>
        </div>
    </div>
</template>
<script>
import api from '@/api/index'
export default {
    props:{
        tel:String
    },
    components:{

    },
    data(){
        return {
            arr:[],
            val:'',
            num: 6,
            times: 60,  //倒计时
        }
    },
    computed:{

    },
    methods:{
        //点击遮罩
        clk_mask(){
            this.$emit('hide_dialog');
        },
        //键盘事件
        keyupFn(e){
            //判断是否是数字
            if(!isNaN(e.key*1)){
                if(this.arr.length < this.num && e.keyCode !== 8){
                    this.arr.push(this.val.slice(this.val.length-1));
                }
                if(this.arr.length == 6){
                    this.clk_btn();
                }
            }
            else if(e.keyCode === 8){
                this.arr.pop();
            }
            else{
                this.$toast('请输入正确的验证码');
            }
        },
        //点击登录
        clk_btn(){
            if(this.arr.length < 6){
                this.$toast('请输入完整的验证码！');
                return;
            }

            api.login({
                phone: this.tel,
                checkcode: this.arr.join('')
            }).then(res=>{
                this.$toast('验证成功！')
                sessionStorage.setItem('token',res.data.token);
                this.$router.push('/home');
            }).catch(res=>{
                this.$toast(res.response.data.msg);
            })
        },
        
    },
    created(){
        // 倒计时
        this._setInterval = setInterval(()=>{
            if(this.times <= 0){
                this.clk_mask();
            }
            this.times -= 1;
        },1000)
    },
    mounted(){

    },
    beforeDestroy() {
        clearInterval(this._setInterval);
    },
}
</script>
<style scoped lang="scss">
    .dialog{
        width: 100%;
        height: 100%;
        position: absolute;
        left: 0;
        top: 0;

        .mask{
            width: 100%;
            height: 100%;
            background: rgba(0,0,0,.3);
        }

        .content{
            width: 281px;
            height: 233px;
            background: white;
            box-shadow:0px 2px 26px 0px rgba(0,0,0,0.23);
            border-radius:10px;
            padding: 20px;
            position: absolute;
            left: 50%;
            top: 50%;
            transform: translate(-50%,-70%);

            h2{
                font-size:20px;
                font-weight:600;
                color:rgba(0,0,0,1);
                line-height:25px;
            }

            .title{
                font-size:9px;
                color:rgba(0,0,0,1);
                margin: 10px 0;

                span{
                    font-weight:bolder;
                }
            }

            button{
                width: 100%;
                height: 36px;
                margin-top: 7px;
                font-size: 12px;
                color:rgba(255,255,255,1);
                border: 0;
                outline: none;
                background:linear-gradient(135deg,rgba(253,88,48,1) 0%,rgba(254,71,35,1) 100%);
                box-shadow:0px 1px 2px 0px rgba(252,36,33,0.21);
                border-radius:50px;
            }

            .yzm{
                width: 100%;
                margin-top: 20px;
                display: flex;
                position: relative;

                input{
                    width: 100%;
                    height: 100%;
                    opacity: 0;
                    position: absolute;
                    left: 0;
                    top: 0;
                }

                .li{
                    width: 36px;
                    height: 36px;
                    background:rgba(255,255,255,1);
                    box-shadow:0px 1px 5px 0px rgba(0,0,0,0.23);
                    border-radius:2px;
                    border:1px solid rgba(151,151,151,1);
                    margin: 2px;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                }
            }

            .send-again{
                font-size: 9px;
                color:rgba(153,153,153,1);
                margin: 10px 0;
            }
        }
    }
</style>