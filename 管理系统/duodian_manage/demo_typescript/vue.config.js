module.exports = {
    devServer: {
        open: true,
        // host: '169.254.226.143',
        proxy: {
            "/api": {
                target: 'http://127.0.0.1:7001',
                pathRewrite: {
                    "^/api": ""
                }
            }
        }
    },
    lintOnSave: true,
    css: {
        loaderOptions: {
            postcss: {
                plugins: [
                    require('postcss-pxtorem')({
                        rootValue: 16, // 换算的基数
                        // 忽略转换正则匹配项。插件会转化所有的样式的px。比如引入了三方UI，也会被转化。目前我使用 selectorBlackList字段，来过滤
                        //如果个别地方不想转化px。可以简单的使用大写的 PX 或 Px 。
                        selectorBlackList: ['weui', 'mu'],
                        propList: ['*'],
                    }),
                ]
            }
        }
    },
    chainWebpack: config => {
        const oneOfsMap = config.module.rule('scss').oneOfs.store
        oneOfsMap.forEach(item => {
            item
                .use('sass-resources-loader')
                .loader('sass-resources-loader')
                .options({
                    // Provide path to the file with resources
                    resources: './path/to/resources.scss',

                    // Or array of paths
                    resources: ['./src/public/scss/_mixin.scss', './src/public/scss/common.scss']
                })
                .end()
        })
    }
}