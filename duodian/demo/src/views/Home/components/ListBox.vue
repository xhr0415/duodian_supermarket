<template>
    <div class="listBox">
        <div class="content" v-for="(item,index) in data" :key="index">
            <img :src="item.img" alt="">
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
                    title:'狂',
                    img:require('@/public/img/10大字/1.png')
                },
                {
                    title:'欢',
                    img:require('@/public/img/10大字/2.png')
                },
                {
                    title:'倒',
                    img:require('@/public/img/10大字/3.png')
                },
                {
                    title:'计',
                    img:require('@/public/img/10大字/4.png')
                },
                {
                    title:'时',
                    img:require('@/public/img/10大字/5.png')
                },
                {
                    title:'超',
                    img:require('@/public/img/10大字/6.png')
                },
                {
                    title:'值',
                    img:require('@/public/img/10大字/7.png')
                },
                {
                    title:'不',
                    img:require('@/public/img/10大字/8.png')
                },
                {
                    title:'停',
                    img:require('@/public/img/10大字/9.png')
                },
                {
                    title:'歇',
                    img:require('@/public/img/10大字/10.png')
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
    .listBox{
        width: 100%;
        height: 156px;
        display: flex;
        flex-wrap: wrap;

        .content{
            width: 20%;
            height: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            
            img{
                width: 75px;
                height: 75px;
            }
        }
    }
</style>