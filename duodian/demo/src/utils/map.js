let map = new AMap.Map('container');

export const getPlugin = (pluginname,options)=>{
    return new Promise((resolve,reject)=>{
        AMap.plugin(pluginname,()=>{
            const OPlugins = new AMap[pluginname.split('.')[1]]({
                ...options
            });
            resolve(OPlugins)
        }) 
    })
}