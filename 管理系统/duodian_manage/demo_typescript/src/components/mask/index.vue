<template>
  <div class="mask-box">
    <div class="box">
      <el-upload
        class="avatar-uploader"
        action="/api/upimage"
        :show-file-list="false"
        :on-success="handleAvatarSuccess"
        :before-upload="beforeAvatarUpload"
      >
        <img v-if="opts.imageUrl" :src="opts.imageUrl" class="avatar">
        <i v-else class="el-icon-plus avatar-uploader-icon">添加图片</i>
      </el-upload>
      <p>
        <label>活动标题</label>
        <el-input v-model="opts.titleVal" placeholder="给标题起个名字"></el-input>
      </p>
      <p>
        <label>起止时间</label>
        <el-date-picker
          v-model="opts.dateVal"
          type="daterange"
          start-placeholder="开始日期"
          end-placeholder="结束日期"
          default-value="2019-8-22"
        ></el-date-picker>
      </p>
      <p>
        <label>活动链接</label>
        <el-input v-model="opts.addressVal" placeholder="请输入活动地址"></el-input>
      </p>
      <p>
        <el-button type="primary" @click="addImgFn">确定添加</el-button>
      </p>
      <b @click.stop="closeFn" class="el-icon-close"></b>
    </div>
  </div>
</template>
<script lang="ts">
import { Component, Vue } from "vue-property-decorator";
import api from "../../api/api";
@Component
class MaskBox extends Vue {
  opts = {
    imageUrl: "",
    dateVal: [],
    titleVal: "",
    addressVal: ""
  };
  addImgFn() {
    if (
      this.opts.imageUrl !== "" &&
      this.opts.dateVal.length !== 0 &&
      this.opts.titleVal !== "" &&
      this.opts.addressVal !== ""
    ) {
      let obj = {
        image: this.opts.imageUrl,
        start_time: this.opts.dateVal[0].toISOString(),
        end_time: this.opts.dateVal[1].toISOString(),
        active_name: this.opts.titleVal,
        url: this.opts.addressVal
      };
      api.addBanner(obj).then(res => {
          this.opts.imageUrl = "";
          this.opts.dateVal = "";
          this.opts.titleVal = "";
          this.opts.addressVal = "";
          this.$emit("addClose", obj);
      });
    } else {
      this.$message(`不能为空!`);
    }
  }
  closeFn() {
    this.$emit("close");
  }
  handleAvatarSuccess(res) {
    console.log(res)
    this.opts.imageUrl = "http://169.254.226.143:7001" + res.data.filename;
  }
  beforeAvatarUpload(file) {
    const isJPG = [
      "image/jpeg",
      "image/jpg",
      "image/png",
      "image/gif"
    ].includes(file.type);
    const isLt2M = file.size / 1024 / 1024 < 2;

    if (!isJPG) {
      this.$message.error("上传头像图片可以是 JPG,JIF,PNG,JPEG 格式!");
    }
    if (!isLt2M) {
      this.$message.error("上传头像图片大小不能超过 2MB!");
    }
    return isJPG && isLt2M;
  }
}
export default MaskBox;
</script>
<style scoped lang="scss">
.mask-box {
  position: fixed;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.2);
  z-index: 99;
  .box {
    width: 500px;
    background: #fff;
    border-radius: 10px;
    position: absolute;
    left: 32%;
    top: 10%;
    p {
      width: 96%;
      height: 40px;
      display: flex;
      margin: 10px 2%;
      font-size: 14px;
      justify-content: center;
      align-items: center;
      label {
        flex: 2;
        height: 100%;
        display: flex;
        justify-content: center;
        align-items: center;
      }
      .el-input {
        flex: 8;
        height: 100%;
      }
      .el-range-editor {
        flex: 8;
        height: 100%;
        border: 1px solid #dcdfe6;
      }
      &:last-child {
        height: 80px;
      }
    }
    b {
      position: absolute;
      right: 10px;
      top: 10px;
      font-size: 23px;
      color: #999;
    }
  }
}
.avatar-uploader {
  width: 86%;
  margin: 7%;
  overflow: hidden;
  border: 2px dashed #dcdfe6;
  border-radius: 10px;
}
.avatar-uploader .el-upload:hover {
  border-color: #409eff;
}
.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  width: 450px;
  height: 178px;
  line-height: 178px;
  text-align: center;
  font-size: 18px;
}
.avatar {
  width: 430px;
  height: 178px;
}

.el-icon-close:hover{
  background: #ddd;
  border-radius: 50%;
}
</style>