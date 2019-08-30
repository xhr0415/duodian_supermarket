<template>
    <div class="banner">
       <swiper :options="swiperOption">
            <swiper-slide v-for="item in data" :key="item.id">
                <a :href="item.url">
                    <img :src="item">
                </a>
            </swiper-slide>
        </swiper>
    </div>
</template>
<script>
import api from '@/api/index'
export default {
    props:{
        data:Array
    },
    components:{

    },
    data(){
        return {
            swiperOption: {//swiper3
                autoplay: 2000,
                speed: 1000,
                // loop:true,
            }
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
    .banner,.swiper-container{
        width: 100%;
        height: 100%;

        img{
            width: 100%;
            height: 100%;
        }
    }
</style>