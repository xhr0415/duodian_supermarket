<template>
  <div class="home">
    <el-header style="text-align: right; font-size: 12px">
      <div class="logo">
        <img src="../../public/img/logo.png" alt="">
      </div>
    </el-header>
    <el-container style=" border: 1px solid #eee">
      <!-- 右边 -->
      <el-container>
        <!-- 侧边栏 -->
        <el-aside width="200px" style="">
          <el-menu>
            <el-submenu index="1">
              <template slot="title">
                <i class="el-icon-message"></i>商品管理
              </template>
              <el-menu-item-group>
                <el-menu-item :index="'1'+'-'+index+1" v-for="(item,index) in asideArr" :key="index" @click="clk_aslide(item.path)">{{item.title}}</el-menu-item>
              </el-menu-item-group>
            </el-submenu>
          </el-menu>
        </el-aside>

        <!-- 内容 -->
        <el-main>
          <router-view></router-view>
        </el-main>

      </el-container>
    </el-container>
  </div>
</template>

<script lang="ts">
import { Component, Vue } from 'vue-property-decorator';

@Component
export default class Home extends Vue {
    asideArr=[
          {
            title:'商品列表',
            path:'shoplist'
          },
          {
            title:'添加banner',
            path:'addbanner'
          },
          {
            title:'添加商品',
            path:'addshop'
          }
      ];
    // 点击跳转路由
    clk_aslide(path){
      this.$router.push({
        name:path
      })
    }

}
</script>

<style lang="scss">
  .home {
  width: 100%;
  height: 100%;
  display: flex;
  flex-direction: column;

  .el-header{
    width: 100%;
    height: 32px;
    z-index: 10;
    background:rgba(255,255,255,1);
    box-shadow:0px 1px 11px 0px rgba(0,0,0,0.12);

    .logo{
      width: 180px;
      height: 100%;
      display: flex;
      align-items: center;
      justify-content: center;
    }
  }

  .el-container {
    flex: 1;
    width: 100%;
    height: 100%;
    display: flex;

    .el-aside {
      width: 87px;
      height: 100%;
      background: #eeeeee;
    }

    .el-main{
      width: 100%;
      height: 100%;
      padding: 20px;
      overflow: auto;
    }
  }
}
</style>

