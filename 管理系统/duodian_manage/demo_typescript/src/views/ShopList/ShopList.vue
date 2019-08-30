<template>
    <div class="shop_list">
        <div class="shop_list_header">
            <span>商品列表</span>
            <el-button type="primary" icon="el-icon-plus" @click="$router.push({
                name:'addshop'
            })">添加商品</el-button>
        </div>
        
        <!-- 内容 -->
        <div class="shop_list_main">
            <!-- 搜索盒子 -->
            <div class="search_box">
                <div class="shopName">
                    商品名称： <el-input v-model="shopName" placeholder="请输入" @input="change_val"></el-input>
                </div>
                <div class="state">
                    状态：  
                    <el-select v-model="state_val" placeholder="请选择">
                        <el-option
                        v-for="item in []"
                        :key="item.value"
                        :label="item.label"
                        :value="item.value">
                        </el-option>
                    </el-select>
                </div>
                <div class="buttonBox">
                    <el-button type="primary" @click="clk_search">查询</el-button>
                </div>
            </div>

            <!-- 表格 -->
            <el-table
            :data="data"
            style="width: 100%"
            @row-click="clk_row"
            fit>
            <el-table-column
                width="350"
                label="商品信息"
                header-align="center"
                >
                <template slot-scope="scope">
                    <div class="left">
                        <img :src="scope.row.cover" alt="">
                    </div>
                    <div class="right">
                        <p class="names">{{scope.row.name}}</p>
                        <p class="title">HPP超高压技术 · 锁住水果新鲜滋味</p>
                    </div>
                </template>
            </el-table-column>
            <el-table-column
                label="价格"
                width="110">
                <template slot-scope="scope">
                    ￥{{scope.row.price}}
                </template>
            </el-table-column>
            <el-table-column
                prop="volume"
                label="销量"
                width="110">
            </el-table-column>
            <el-table-column
                prop="stock"
                label="库存"
                width="110">
            </el-table-column>
            <el-table-column
                prop="status"
                label="状态"
                width="110">
            </el-table-column>
            <el-table-column
                label="更新时间"
                width="120">
                <template slot-scope="scope">
                    {{new Date().toLocaleDateString()}}
                </template>
            </el-table-column>
            <el-table-column
                label="操作">
                <template slot-scope="scope">
                    <p :style="{
                        'color':'rgba(24,144,255,1)',
                        'cursor': 'pointer'
                    }">
                        <span :style="{
                            'margin-right':'10px',
                        }">上架</span>
                        <span @click.stop="clk_edit(scope.row)">编辑</span>
                    </p>
                </template>
            </el-table-column>
            </el-table>
        </div>

        <!-- 分页 -->
        <div class="pagination">
            <el-pagination
                background
                layout="prev, pager, next"
                :total="list_length"
                :pageSize=pageSize
                @current-change="change_page"
                >
            </el-pagination>
        </div>
    </div>
</template>
<script lang="ts">
import { Component, Vue } from 'vue-property-decorator';
import api from '@/api/api';

@Component
export default class extends Vue {
    shopName = '';      //商品名称
    state_val = '';     //状态
    data = [];          //所有商品
    list = [];          //所有商品
    pageSize = 5;       //每页条数
    list_length = 0;    //数据长度

    //点击搜索
    clk_search(){
        this.data = this.list.filter(item=>item.name.includes(this.shopName))
        this.list_length = this.data.length;
    }
    //改变触发搜索框
    change_val(){
        if(this.shopName == ''){
            this.list_length = this.list.length;
            this.data = this.list.slice(0,this.pageSize)
        }
    }
    //改变页数
    change_page(val){
        this.data = this.list.slice((val-1)*this.pageSize,val*this.pageSize)
    }
    //点击表格行
    clk_row(item,event,column){
        this.$router.push({
            name:'details',
            query:{
                id:item.id
            }
        });
    }
    //点击编辑
    clk_edit(item){
        this.$router.push({
            name:'details',
            query:{
                id:item.id
            }
        })
    }

    created(){
        api.allShop().then(res=>{
            this.list = res.data;
            this.list_length = this.list.length;
            this.data = res.data.slice(0,this.pageSize);
        })
    }
}
</script>
<style lang="scss">
    .shop_list{
        width: 100%;
        height: 100%;
        display: flex;
        flex-direction: column;

        .shop_list_header{
            width: 100%;
            height: 50px;
            border-bottom: 2px solid rgba(233,233,233,1);
            line-height: 50px;
            margin-bottom: 12px;

            span{
                font-size: 20px;
                font-weight:500;
            }

            .el-button{
                width:119px;
                height:39px;
                float: right;

                span{
                    font-size: 15px;
                }
            }
        }

        .shop_list_main{
            flex: 1;
            overflow: auto;

            .search_box{
                width:100%;
                height:110px;
                background:rgba(240,242,245,1);
                padding: 0 50px;
                display: flex;

                .buttonBox{
                    height: 100%;
                    display: flex;
                    align-items: center;
                }

                .el-button{
                    width:65px;
                    height:32px;

                    span{
                        width: 100%;
                        height: 100%;
                        display: flex;
                        align-items: center;
                    }
                }
            }

            .shopName,.state{
                width: 350px;
                height: 100%;
                display: flex;
                align-items: center;

                .el-input{
                    width:255px;
                    height:32px;

                    input{
                        width: 100%;
                        height: 100%;
                    }
                }
            }

            .cell{
                height: 70px;
                display: flex;

                .left{
                    width: 80px;
                    height: 70px;

                    img{
                        width: 100%;
                        height: 100%;
                    }
                }
            }

            .right{
                padding-left: 10px;
                display: flex;
                flex-direction: column;

                >p{
                    flex: 1;
                }

                >p:nth-child(1){
                    font-size: 14px; 
                    font-weight: bold;
                }

                >p:nth-child(2){
                    font-size: 10px; 
                }
            }

            .has-gutter{
                .cell{
                    height: 40px;
                    font-size: 17px;
                    font-weight: bolder;
                    display: flex;
                    align-items: center;
                }
            }
        }

        .pagination{
            width: 100%;
            padding-bottom: 20px;
            padding-right: 20px;
            display: flex;
            justify-content: flex-end;
        }
    }
</style>