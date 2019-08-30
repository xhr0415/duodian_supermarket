<template>
  <div class="header">
    {{title}}
  </div>
</template>
<script>
export default {
  props:{
    title:String
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

  },
  mounted(){

  }
}
</script>
<style scoped lang="scss">
  .header{
    width: 100%;
    height: 50px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-weight: bold; 
    font-size: 18px;
    background:rgba(248,248,248,1);
  }
</style>