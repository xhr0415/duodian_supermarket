
## 多点超市
### 项目介绍：
    此项目是客户在手机上用于购物的平台，登录之后可以方便的在平台上进行选购。
    还有一个对于内部人员的一个后台管理系统。
 
### 技术栈：
    前端：
      html5 + css、
      vue框架、
      axios、
      vuex 仓库、
      vant ui库、
      vueg 转场动画、
      谷歌定位插件、

    后端：
      egg 框架、
      mysql 数据库

### 目录结构：
    src/
      api           //所有接口
      components    //全局组件
      config        //配置
      public        //公用插件
      router        //路由
      store         //vuex仓库
      utils         //公用方法
      views         //视图组件
      App.vue       //根组件
      main.js       //入口文件
      
### 指令：
 启动客户端(demo里)：
 
    npm run serve
 启动后台(duodian-server里)： 
 
    npm run dev 
 启动后台接收验证码(duodian-server里)：
 
    npm run checkServer
     
 启动后端管理系统(demo_typescript里)： 
 
    npm run serve
