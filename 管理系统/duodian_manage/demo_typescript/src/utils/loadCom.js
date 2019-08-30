import components from '@/components/index'

export default {
    //组件
    install(Vue){
        Object.keys(components).forEach(item=>{
            Vue.component(item,components[item]);
        })
    }
}