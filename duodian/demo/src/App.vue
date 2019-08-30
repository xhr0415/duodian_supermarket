<template>
  <div class="box">
      <Header :title="$route.meta.title"></Header>
    
      <div class="main">
          <keep-alive include="home,type,shopCar">
            <router-view></router-view>
          </keep-alive>
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

    }
  },
  computed:{

  },
  methods:{

  },
  created(){
    // console.log(this.$route)
  },
  mounted(){

  }
}
</script>
<style lang="scss">
  .box{
    width: 100%;
    height: 100%;
    display: flex;
    flex-direction: column;

    >.main{
      float: 1;
      width: 100%;
      height: 100%;
      overflow: hidden;
      position: relative;

      .home,.type,.shoppingCar,.my,.map,.details{
        width: 100%;
        height: 100%;
        display: flex;
        flex-direction: column;

        .wrap{
            flex: 1;
            overflow: auto;
        }
      }
    }
  }
</style>