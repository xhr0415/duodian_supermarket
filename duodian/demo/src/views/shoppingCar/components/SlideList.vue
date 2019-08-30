<template>
    <div class="slide-list" ref="slideList">
        <slot></slot>
        <div class="remove" @click="clk_del">删除</div>
    </div>
</template>
<script>
import {mapActions} from 'vuex'
export default {
    props:{
        item:Object
    },
    components:{

    },
    data(){
        return {
            touchStartX:0,  //开始滑动距离
            touchStartY:0,  //开始滑动距离
            touchMoveX:0,   //滑动距离
            touchMoveY:0,   //滑动距离
            touchEndX:0,    //结束滑动距离
            touchEndY:0,    //结束滑动距离
            moveX:0,        //滑动距离
        }
    },
    computed:{

    },
    methods:{
        ...mapActions('shopCar',['clk_remove']),
        //点击删除
        clk_del(){
            this.moveX = 0;
            this.clk_remove(this.item);
            this.$emit('remove_slideList')
        }
    },
    created(){
           
    },
    mounted(){
        let slideList = this.$refs.slideList;
        // 开始滑动
        slideList.addEventListener('touchstart',(e)=>{
            this.touchStartX = e.touches[0].clientX;
            this.touchStartY = e.touches[0].clientY;
        })
        // 滑动中
        slideList.addEventListener('touchmove',(e)=>{
            this.touchMoveX = e.touches[0].clientX;
            this.touchMoveY = e.touches[0].clientY;

            if(this.touchMoveY - this.touchStartY > 10){
                return;
            }

            //左滑
            if(this.touchStartX - this.touchMoveX > 20){
                this.moveX = this.touchMoveX - this.touchStartX;
                slideList.style.transform = `translate(${this.moveX}px,0px)`;
                
                if(this.moveX <= 0){
                    slideList.style.transform = `translate(-70px,0px)`;
                    return;
                }
            }
            else{
                this.moveX = this.touchMoveX - this.touchStartX;
                slideList.style.transform = `translate(${this.moveX}px,0px)`;
                
                if(this.moveX >= -1){
                    slideList.style.transform = `translate(0px,0px)`;
                    return;
                }
            }
        })
        // 滑动结束
        slideList.addEventListener('touchend',(e)=>{
            if(this.touchStartX - this.touchMoveX > 20){
                
            }
        })
    }
}
</script>
<style scoped lang="scss">
    .slide-list{
        width: 100%;
        position: relative;
        transition: all 0.5s linear;

        .remove{
            width: 70px;
            height: 100%;
            position: absolute;
            right: -70px;
            top: 0;
            background: red;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
        }
    }
</style>