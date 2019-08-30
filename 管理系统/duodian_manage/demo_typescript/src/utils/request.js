import axios from 'axios';
import Vue from 'vue';

const request=axios.create();

//请求之前拦截器
request.interceptors.request.use((config)=>{
    return {
        ...config,
        headers:{
            ...config.headers,
            "Authorization":window.sessionStorage.getItem('Authorization')
        }
    }
},(error)=>{
    return Promise.reject(error)
})
//相应之前
request.interceptors.response.use((response)=>{
    let {code,msg}=response.data;
    if(code){
        return response.data;
    }

    return  Promise.reject(response.data)
},(error)=>{
    Vue.prototype.$message(error.response.data.msg);
    return Promise.reject(error)
})  

export {
    request as axios
}
export default {
    install(Vue){
        Object.defineProperty(Vue.prototype,"$http",{
            value:request
        })
    }
}