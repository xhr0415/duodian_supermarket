export default {
    namespaced:true,           //命名空间
    state: {
        islogin:false,
    },
    getters:{

    },
    mutations: {
        isloginFn(state){
            let islogin = sessionStorage.getItem('userinfo');
            if(islogin){
                state.islogin = true;
            }
            else{
                state.islogin = false;
            }
        }
    },
    actions: {
  
    }
}