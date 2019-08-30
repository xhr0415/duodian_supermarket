<template>
  <div class="classify">
    <div class="mask" v-if="flag">
      <div class="dialog">
        <h2>您确定要创建么？</h2>
        <div>
          <span @click="submitForm('ruleForm')">确定</span>
          <span @click="cancel">取消</span>
        </div>
      </div>
    </div>
    <div class="route">
      <p>
        首页 / 商品管理 /
        <span>商品列表</span>
      </p>
    </div>
    <h3>商品列表</h3>
    <div class="hr"></div>
    <h6>基本信息</h6>
    <div class="hr"></div>
    <div class="ipts">
      <el-form
        :model="ruleForm"
        :rules="rules"
        ref="ruleForm"
        label-width="140px"
        class="demo-ruleForm"
      >
        <el-form-item label="商品名称" prop="name">
          <el-input v-model="ruleForm.name"></el-input>
        </el-form-item>
        <el-form-item label="商品标签" prop="specs">
          <div class="specs">
            <p v-for="(item,i) in specsArr" :key="i">{{item}}</p>
            <div class="add">
              <input type="text" v-model="specsItem" @keyup="addKeySpecsFn($event)">
              <span @click="addSpecsFn">+</span>
            </div>
          </div>
          <p></p>
        </el-form-item>
        <el-form-item label="商品分类" prop="region">
          <el-select v-model="ruleForm.type_id" placeholder="请选择分类" @change="shopTypeFn">
            <el-option v-for="(item,i) in shopType" :key="i" :label="item.title" :value="item.id"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="库存" props="stock">
          <el-input-number
            class="num"
            style="width:98px"
            v-model="ruleForm.stock"
            controls-position="right"
            :min="1"
            :max="1000"
            @change="handleChange"
          ></el-input-number>
        </el-form-item>
        <el-form-item label="商品子类型" prop="region2" v-if="shopType[typeNum]">
          <el-select v-model="ruleForm.category_id" placeholder="请选择子分类">
            <el-option
              v-for="(item,i) in shopType[typeNum].children"
              :key="i"
              :label="item.name"
              :value="item.id"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="价格(元)" prop="price">
          <el-input-number
            class="num"
            style="width:98px"
            v-model="ruleForm.price"
            controls-position="right"
            :min="10"
            :max="1000"
            @change="handleChange"
          ></el-input-number>
        </el-form-item>
        <el-form-item label="原价(元)" prop="old_price">
          <el-input-number
            class="num"
            style="width:98px"
            v-model="ruleForm.old_price"
            controls-position="right"
            :min="10"
            :max="1000"
            @change="handleChange"
          ></el-input-number>
        </el-form-item>
        <el-form-item label="销量" prop="volume">
          <el-input-number
            class="num"
            v-model="ruleForm.volume"
            controls-position="right"
            :min="500"
            :max="99999"
            @change="handleChange"
          ></el-input-number>
        </el-form-item>
        <el-form-item label="商品展示" prop="cover">
          <el-upload
            class="avatar-uploader"
            action="/api/upimage"
            :show-file-list="false"
            :on-success="pushCoverSuccess"
            :before-upload="beforeAvatarUpload"
          >
            <img v-if="ruleForm.cover" :src="ruleForm.cover" class="avatar">
            <i v-else class="el-icon-plus avatar-uploader-icon"></i>
          </el-upload>
        </el-form-item>
        <el-form-item label="商品背景" prop="pictures">
          <el-upload
            action="/api/upimage"
            list-type="picture-card"
            :on-success="handlePictureCardPreview"
            :on-remove="handleRemove"
          >
            <i class="el-icon-plus"></i>
          </el-upload>
          <el-dialog :visible.sync="dialogVisible" size="tiny">
            <img width="100%" :src="dialogImageUrl" alt="">
          </el-dialog>
        </el-form-item>
        <el-form-item label="商品详情" prop="detail">
          <el-input type="textarea" v-model="ruleForm.detail"></el-input>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="open">立即创建</el-button>
          <el-button @click="resetForm('ruleForm')">重置</el-button>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>
<script lang="ts">
import { Component, Vue } from "vue-property-decorator";
import api from "@/api/api";
@Component
export default class AddShop extends Vue {
  flag=false;
  shopType = [];
  typeNum = "";
  specsArr = [];
  specsItem = "";
  picturesList = [];
  dialogVisible = false;
  dialogImageUrl = "";
  arr = [];
  ruleForm = {
    name: "", //商品名称
    type_id: "", //	商品分类
    category_id: "", //商品子分类
    price: "", //价格
    detail: "", //商品详情
    specs: "", //商品标签数组字符串
    cover: "", //商品主图 图片地址字符串
    pictures: "", //商品图片 图片地址数组字符串
    stock: "", //库存
    volume: "", //销量
    old_price: "" //原价
  };
  rules = {
    name: [{ required: true, message: "请输入商品名称", trigger: "blur" }],
    price: [{ required: true, message: "请输入商品价格", trigger: "blur" }],
    stock: [{ required: true, message: "请输入商品库存量", trigger: "blur" }],
    volume: [{ required: true, message: "请输入商品销量", trigger: "blur" }],
    region: [{ required: true, message: "请选择商品类型", trigger: "blur" }],
    region2: [{ required: true, message: "请选择商品子类型", trigger: "blur" }],
    detail: [{ required: true, message: "请填写商品详情", trigger: "blur" }],
    pictures: [{ required: true, message: "商品背景图片", trigger: "blur" }],
    old_price:[{ required: true, message: "请输入商品原价格", trigger: "change" }],
    specs:[{ required: true, message: "请输入商品标签", trigger: "blur" }],
    cover:[{ required: true, message: "商品主图片", trigger: "blur" }]
  };
  handleRemove(file, fileList) {
    console.log(file, fileList);
  }
  handlePictureCardPreview(res) {
    this.dialogImageUrl = "http://169.254.226.143:7001" + res.data.filename;
    this.arr.push(this.dialogImageUrl);
    console.log(this.arr);
    this.ruleForm.pictures = JSON.stringify(this.arr);
    this.dialogVisible = true;
  }
  addSpecsFn() {
    if (this.specsItem) {
      this.specsArr.push(this.specsItem);
      this.ruleForm.specs = this.specsArr.join("");
      this.specsItem = "";
    }
  }
  handleChange(value) {}
  addKeySpecsFn(e) {
    if (e.key === "Enter") {
      this.addSpecsFn();
    }
  }
  shopTypeFn() {
    this.typeNum = this.shopType.findIndex(
      item => item.id === this.ruleForm.type_id
    );
    this.ruleForm.category_id = "";
  }
  open(){
    this.flag=true
  }
  cancel(){
    this.flag=false
  }
  submitForm(formName) {
    api.addShop(this.ruleForm).then(res=>{
      this.$message({
        message:'添加成功',
        type:'success'
      })
      if(res.code){
        this.flag=false
        this.$refs[formName].resetFields()
        this.$router.push({
          name:'shoplist'
        })
      }
    })
    
  }
  resetForm(formName) {
    this.$refs[formName].resetFields();
  }
  beforeAvatarUpload(file) {
    const isJPG = ["image/png", "image/jpg", "image/jpeg"].includes(file.type);
    const isLt6M = file.size / 1024 / 1024 < 6;
    if (!isJPG) {
      this.$message.error("上传图片格式不正确!");
    }
    if (!isLt6M) {
      this.$message.error("上传头像图片大小不能超过 6MB!");
    }
    return isJPG && isLt6M;
  }
  pushCoverSuccess(res) {
    this.ruleForm.cover = "http://169.254.226.143:7001" + res.data.filename;
  }
  created() {
    api.getShopType().then(res => {
      this.shopType = res.data;
    });
  }
}
</script>
<style lang="scss">
.classify {
  width: 100%;
  min-height: 100%;
  > .route {
    width: 100%;
    height: 30px;
    margin-bottom: 15px;
    overflow: hidden;
    > p {
      line-height: 30px;
      font-size: 14px;
      color: #999;
      > span {
        color: #555;
      }
    }
  }
  > h3 {
    text-indent: 20px;
    font-size: 18px;
    font-weight: 600;
  }
  > .hr {
    border-bottom: 1px solid #ccc;
    margin: 20px 0;
    display: inline-block;
    width: 100%;
  }
  > h6 {
    text-indent: 20px;
    margin-top: 15px;
    border: 1px solid transparent;
    font-size: 14px;
    font-weight: 600;
  }
  .ipts {
    .el-input,
    .el-textarea {
      width: 400px;
    }
    .el-form-item {
      margin-top: 20px;
      .el-input-number {
        width: 98px;
      }
      .specs {
        width: 100%;
        display: flex;
        align-items: center;
        align-content: flex-start;
        > p {
          margin-left: 10px;
          height: 20px;
          padding: 3px 8px;
          border-radius: 3px;
          background: #00ff99;
          color: white;
          line-height: 20px;
          font-size: 12px;
        }
        > .add {
          margin-left: 15px;
          border: 1px solid #333;
          width: 100px;
          display: flex;
          align-items: center;
          > span {
            width: 20px;
            padding: 0 5px;
            cursor: pointer;
          }
          input {
            display: inline-block;
            width: 80px;
            box-sizing: border-box;
            padding-left: 5px;
          }
        }
      }
      .avatar-uploader {
        width: 400px;
        height: 300px;
        border: 1px solid #999;
        text-align: center;
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 5px 0;
        .el-upload {
          border: 1px dashed #d9d9d9;
          border-radius: 6px;
          cursor: pointer;
          overflow: hidden;
        }
        .el-upload:hover {
          border-color: #409eff;
        }
        .avatar-uploader-icon {
          font-size: 28px;
          color: #8c939d;
          width: 178px;
          height: 178px;
          line-height: 178px;
          text-align: center;
        }
        .avatar {
          height: 300px;
          display: block;
        }
      }
    }
  }
  .num {
    input {
      width: 100px;
    }
  }
  .mask {
    width: 100%;
    height: 100%;
    left:0;
    top:0;
    position: fixed;
    background: rgba(0,0,0,.5);
    z-index: 998;
    .dialog {
      width: 300px;
      height: 80px;
      position: absolute;
      left: 50%;
      top: 50%;
      transform: translate(-50%, -50%);
      background: #fff;
      z-index: 999;
      h2 {
        width: 100%;
        height: 40px;
        text-align: center;
        line-height: 40px;
      }
      > div {
        width: 100%;
        height: 40px;
        display: flex;
        span {
          flex: 1;
          display: flex;
          justify-content: center;
          align-items: center;
          cursor: pointer;
        }
      }
    }
  }
}
</style>