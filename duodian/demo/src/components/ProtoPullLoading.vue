<template>
    <div class="protoPull" ref="scrollDom">
        <div ref="scrollContent">
            <slot></slot>
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
            scrollTop:0
        }
    },
    computed:{

    },
    methods:{
        // 防抖
        debounce(func, wait) {
            let timeout;
            return function () {
                let context = this;
                let args = arguments;

                if (timeout) clearTimeout(timeout);
                
                timeout = setTimeout(() => {
                    func.apply(context, args)
                }, wait);
            }
        }
    },
    created(){
        this.$nextTick(()=>{
            let that = this;
            this.$refs.scrollDom.onscroll = this.debounce(function(){
                that.scrollTop = this.scrollTop; 
                let BoxHegiht = that.$refs.scrollDom.offsetHeight;           //大盒子的高度
                let contentHeight = that.$refs.scrollContent.offsetHeight;   //总共内容高度
                
                //给父组件里的scrollTop赋值
                that.$parent.scrollTop = this.scrollTop;    
                
                if(this.scrollTop >= contentHeight-BoxHegiht){
                    that.$emit('scroll')
                }
            },500)
        })
    },
    mounted(){

    }
}
</script>
<style scoped lang="scss">
    .protoPull{
        width: 100%;
        height: 100%;
        overflow: auto;
    }
</style>