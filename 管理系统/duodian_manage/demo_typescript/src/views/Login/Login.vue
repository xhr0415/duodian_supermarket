<template>
  <div class="login">
    <div class="login_wrapper">
      <el-form ref="loginForm">
        <el-form-item label="" prop="user_name">
          <el-input
            type="text"
            autocomplete="off"
            v-model="user_name"
            placeholder="请输入用户名"
          ></el-input>
        </el-form-item>
        <el-form-item label="">
          <el-input
            type="password"
            autocomplete="off"
            v-model="user_pwd"
            placeholder="请输入密码"
          ></el-input>
        </el-form-item>
        <el-button type="button" @click="login">登录</el-button>
      </el-form>
    </div>
  </div>
</template>
<script lang="ts">
import { Component, Vue } from 'vue-property-decorator';
import api from '@/api/api.js'

@Component({
    
})

export default class extends Vue {
    user_name = "";
    user_pwd = "";
       //点击登录
    login() {
        if(this.user_name.trim() !== '' && this.user_pwd.trim() !== ''){
            api.login({
                username: this.user_name,
                password: this.user_pwd
            }).then(res=>{
              sessionStorage.setItem('Authorization',res.data.token);
              sessionStorage.setItem('user',res.data.username);
               this.$message({
                  message: '登录成功！',
                  type: 'success'
                });
                this.$router.push({
                  path:'/home'
                })
            })
        }
    }
}
</script>
<style scoped lang="scss">
.login {
  width: 100%;
  height: 100%;
  background: url("../../public/img/background.png") no-repeat 100% 100%;
  background-size: 100% 100%;

  .login_wrapper {
    width: 400px;
    padding: 40px 20px;
    border: 1px solid #ccc;
    border-radius: 3px;
    background: #fff;
    position: absolute;
    right: 15%;
    top: 25%;
    box-sizing: border-box;
  }
  .el-input {
    margin-bottom: 25px;
  }

  button {
    width: 100%;
    height: 40px;
    padding: 0 40px !important;
    border-radius: 4px !important;
    border: 0 !important;
    font-size: 14px !important;
    color: #fff !important;
    background: linear-gradient(-90deg, #4e75ff, #0139fd) !important;
  }
}
</style>