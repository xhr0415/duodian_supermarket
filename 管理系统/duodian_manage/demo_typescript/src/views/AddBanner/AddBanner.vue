<template>
  <div class="wrap">
    <div class="top">
      <div class="left">首页Banner</div>
      <div class="right">
        <el-button type="primary" @click="addBannergFn">+添加banner</el-button>
      </div>
    </div>
    <div class="con">
      <MaskBox v-show="open" @close="closeFn" @addClose="addCloseFn"/>

      <div class="con-item" v-for="(item,index) in bannerArr" :key="index">
        <div class="con_active" v-if="item.pastDue">
          活动已经结束
        </div>

        <div class="img-box">
          <img :src="item.image" alt>
        </div>
        <div class="con-item-text">
          <h2>{{item.active_name}}</h2>
          <p>长江标题</p>
        </div>
        <div class="con-item-bottom">
          <i v-for="(val,ind) in iconArr" :key="ind" :class="val" @click="removeBtn(item)"></i>
          <p class="remove-btn" v-show="item.removeFlag" @click="removeBanner(item)">删除</p>
        </div>
      </div>
    </div>
  </div>
</template>
<script lang="ts">
import { Component, Vue } from "vue-property-decorator";
import MaskBox from "../../components/mask/index";
import api from "@/api/api";
@Component({
  components: {
    MaskBox
  }
})
export default class AddBanner extends Vue {
  open = false;
  bannerArr = [];
  iconArr = [
    "el-icon-download",
    "el-icon-edit",
    "el-icon-share",
    "el-icon-more"
  ];
  closeFn() {
    this.open = false;
  }
  addCloseFn(obj) {
    this.open = false;
    this.bannerArr.push(obj);
    this.$message({
      message: "banner添加成功",
      type: "success"
    });
  }
  addBannergFn() {
    this.open = true;
  }
  removeBtn(item) {
      item.removeFlag = !item.removeFlag;
  }
  removeBanner(item){
    this.bannerArr = this.bannerArr.filter(val=>val !== item)
  }
  created() {
    // 请求banner数据
    api.homeBanner().then(res => {
      let { code, data } = res;
      if (code) {
        this.bannerArr = data.map(item => {
          item.removeFlag = false;

          if(new Date(item.end_time).getTime() < new Date().getTime()){     //判断是否过期
            item.pastDue = true;
          }
          else{
            item.pastDue = false;
          }
          return item;
        });
      }
    });
  }
}
</script>
<style lang="scss">
.wrap {
  width: 100%;
  height: 100%;
  display: flex;
  flex-direction: column;
  .top {
    width: 100%;
    height: 60px;
    border-bottom: 1px solid #eee;
    display: flex;
    .left {
      flex: 5;
      height: 100%;
      display: flex;
      align-items: center;
      padding-left: 40px;
    }
    .right {
      flex: 5;
      height: 100%;
      display: flex;
      align-items: center;
      justify-content: flex-end;
      padding-right: 40px;
    }
  }
  .con {
    flex: 1;
    overflow: auto;
    display: flex;
    flex-wrap: wrap;
    position: relative;
    .con-item {
      width: 20%;
      margin: 2%;
      height: 265px;
      border: 1px solid #ccc;
      position: relative;
      .img-box {
        width: 100%;
        height: 150px;
        img {
          width: 100%;
          height: 100%;
        }
      }
      .con-item-text {
        width: 100%;
        height: 75px;
        h2 {
          width: 100%;
          height: 45px;
          line-height: 55px;
          padding-left: 10px;
        }
        p {
          width: 100%;
          height: 30px;
          font-size: 15px;
          padding-left: 10px;
          color: #999;
        }
      }
      .con-item-bottom {
        width: 100%;
        height: 40px;
        background: #eee;
        display: flex;
        position: relative;
        i {
          flex: 1;
          display: flex;
          justify-content: center;
          align-items: center;
          color: #999;
        }

        .remove-btn {
          position: absolute;
          right: 0;
          top: 40px;
          background: #ccc;
          width: 60px;
          height: 40px;
          text-align: center;
          line-height: 40px;
          color: #fff;
        }
      }
    }
  }

  .con_active{
    width: 100%;
    height: 100%;
    position: absolute;
    left: 0;
    top: 0;
    background: rgba(0,0,0,.5);
    z-index: 88;
    display: flex;
    align-items: center;
    justify-content: center;
    color: white;
  }
}
</style>