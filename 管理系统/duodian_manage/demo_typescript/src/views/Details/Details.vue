<template>
    <div class="details">
        <div class="d-HeadBox">
            <div class="d-HeadBoxS">
                <div class="HeadBoxS-l">
                    <dl>
                        <dt>
                            <!-- <img :src="datas.cover" alt=""/> -->
                            <img :src="cover" alt=""/>
                        </dt>
                        <dd>
                            <h5 ref="h5">
                                <input type="text" disabled="disabled" v-model="tit" />
                                <!-- {{datas.name}} -->
                            </h5>
                            <p class="Hname">创建人：
                                <!-- <span>随机数据</span> -->
                                <input type="text" disabled="disabled" v-model="username" />
                            </p>
                            <p class="Hdate">创建日期：<span>{{datas.create_time}}</span></p>
                        </dd>
                    </dl>
                </div>
                <div class="HeadBoxS-z">
                    <p>商品库存：
                        <input type="text" disabled="disabled" v-model="knum" />
                        <!-- <span>{{datas.stock}}</span> -->
                    </p>
                </div>
                <div class="HeadBoxS-r">
                    <div class="S-rS">
                        <span @click="bj()">编辑</span>
                        <span>补货</span>
                        <span>删除</span>
                    </div>
                    <div class="S-rX">销售金额   ￥
                        <input type="text" disabled="disabled" v-model="datas.price" />
                        <!-- <span>{{datas.price}}</span> -->
                    </div>
                </div>
            </div>
            <div class="d-HeadBoxX">
                <div class="Htab">
                    <li class="tabActive">详情</li><li>规则</li>
                </div>
            </div>
        </div>
        <div class="d-Main">
            <div class="Main-set">
                <quill-editor class="editor" v-model="content" ref="myQuillEditor" :options="editorOption" @blur="onEditorBlur($event)" @focus="onEditorFocus($event)" @change="onEditorChange($event)">
                
                </quill-editor>
            </div>
            <div class="Main-jieBox">
                <p>商品介绍</p>
                <div class="jieBoxs">
                    <textarea disabled="disabled" v-model="texts" class="readonly" name="" id="" cols="165" rows="12">
                        <p v-for="(ite,i) in pics" :key="i"></p><img :src="ite" alt="">
                    </textarea>
                </div>
            </div>
            <div class="jlBox">
                <p>销售记录</p>
                <div class="jlBoxs">
                    <el-table
                        :data="tableData"
                        style="width: 100%">
                        <el-table-column
                            prop="date"
                            label="日期"
                            width="180">
                        </el-table-column>
                        <el-table-column
                            prop="name"
                            label="客户"
                            width="180">
                        </el-table-column>
                        <el-table-column
                            prop="address"
                            label="状态">
                        </el-table-column>
                        <el-table-column
                            prop="name"
                            label="反馈">
                        </el-table-column>
                        <el-table-column
                            prop="name"
                            label="耗时">
                        </el-table-column>
                    </el-table>
                </div>
            </div>
        </div>
        <!-- 编辑弹框 -->
        <div class="bjMark" v-if="bjFlag">
            <div class="bjtan">
                <p>商品标题:<input type="text" v-model="tit" /></p>
                <p>创建人:<input type="text" v-model="username" /></p>
                <p>库存:<input type="text" v-model="knum" /></p>
                <p>总价格:<input type="text" v-model="price" /></p>
                <p class="bjSj">商品介绍:<textarea v-model="textx" cols="50" rows="5"></textarea></p>
                <div><button @click="bjQ">取消</button><button class="but2" @click="bjT()">提交</button></div>
            </div>
        </div>
    </div>
</template>
<script lang="ts">
import api from '@/api/api.js';
import { Prop, Component, Vue  } from 'vue-property-decorator';

@Component
export default class Details extends Vue {
    bjFlag:boolean=false // 编辑弹框状态
    cover:string='https://img.dmallcdn.com/20180627/a89a25f8-22ee-4053-a662-f00f49e16573_800x800L'
    datas:any={}
    tit:string="油菜花"
    username:string="随机数据"
    knum:number=100
    price:number=523
    pics:any=[]
    texts:string=""
    textx:string=""
    content:any=""
    ids:string="7"
    editorOption:object={}
    tableData= [
        
    ]
    config = {
        // 接口地址
        uploadUrl: '',
        // form 里的 filename
        uploadName: '',
        // 其他参数
        uploadParams: {},
        // 上传成功回调
        uploadCallback: (data:any) => {
            console.log(data)
            return 'blob:https://fiddle.jshell.net/00a0b0b4-d19a-4860-9796-137692aef36f'
        },
        // 上传失败回调, 可选
        uploadFailed: (err:any) => {
            console.log(err)
        }
    }
    onEditorBlur(){
        
    }
    onEditorFocus(){//获得焦点事件
    }
    onEditorChange(){//内容改变事件
    }
    created() {
        
        api.allShop().then(({data})=>{
            // this.datas=data
            data.filter(item=>{
                if(item.id==this.$route.query.id){
                    this.cover=item.cover
                   this.datas=item
                   this.tit=item.name
                   this.knum=item.stock
                   this.price=item.price
                   this.pics=item.pictures
                }
            })
        })
    }
    mounted() {
        
    }
    // 编辑
    bj(){
        // 编辑信息
        // this.$router.push({
        //     name:"addshop",
        //     query:this.datas
        // })
        this.bjFlag=true
    }
    bjQ(){
        this.bjFlag=false
    }
    bjT(){
        this.bjFlag=false
    }
}
</script>
<style lang="scss">
    .details{
        width: 100%;
        height: 100%;
        overflow-x: hidden;
        .d-HeadBox{
            padding: 0 30px;
            height: 242px;
            .d-HeadBoxS{
                width: 100%;
                height: 202px;
                display: flex;
                justify-content: space-between;
                .HeadBoxS-l{
                    width: 34.5%;
                    height: 202px;
                    margin-top: 56px;
                    dl{
                        width: 100%;
                        height: 117px;
                        display: flex;
                        justify-content: space-between;
                        dt{
                            width: 117px;
                            height: 117px;
                            border: solid 1px #ccc;
                            img{
                                padding: 10px;
                                width: 100%;
                                height: 100%;
                            }
                        }
                        dd{
                            margin-left: 20px;
                            width: 298px;
                            height: 117px;
                            h5{
                                width: 100%;
                                height: 50px;
                                font-size: 20px;
                                line-height: 50px;
                                overflow: hidden;
                                text-overflow:ellipsis;
                                white-space: nowrap;
                            }
                            p{
                                height: 30px;
                                line-height: 30px;
                                font-size: 16px;
                                color: #666;
                            }
                        }
                    }
                }
                .HeadBoxS-z{
                    // width: 49%;
                    height: 202px;
                    // line-height: 202px;
                    p{
                        // display: inline-block;
                        margin-top: 105px;
                        padding-left: 20px;
                        height: 30px;
                        line-height: 30px;
                        font-size: 16px;
                        color: #666;
                    }
                    span{
                        color: #1890FF;
                    }
                }
                .HeadBoxS-r{
                    // width: 16.5%;
                    height: 202px;
                    .S-rS{
                        margin-top: 54px;
                        width: 100%;
                        display: flex;
                        justify-content: space-between;
                        span{
                            padding: 5px 12px;
                            border: solid 1px #ccc;
                            border-radius: 3px;
                            background: #eee;
                            color: #666;
                        }
                        span:nth-child(3){
                            background: #1890FF;
                            color: #eee;
                        }
                    }
                    .S-rX{
                        margin-top: 42px;
                        width: 100%;
                        height: 55px;
                        font-size: 22px;
                        line-height: 55px;
                        color: #333;
                    }
                }
            }
            .d-HeadBoxX{
                width: 1234px;
                height: 40px;
                .Htab{
                    width: 100%;
                    height: 39px;
                    display: flex;
                    li{
                        list-style: none;
                        width: 60px;
                        line-height: 39px;
                        font-size: 16px;
                        text-align: center;
                        color: #333;
                    }
                }
            }
        }
        .d-Main{
            padding: 0 30px;
            .Main-set{
                margin-top: 50px;
                width: 100%;
                height: 238px;
                background: #eee;
                .editor{
                    height: 195px;
                    font-size: 14px;
                }
            }
            .Main-jieBox{
                margin-top: 30px;
                width: 100%;
                height: 238px;
                p{
                    height: 30px;
                    line-height: 30px;
                    font-size: 16px;
                    color: #333;
                }
                .jieBoxs{
                    width: 100%;
                    height: 168px;
                    textarea{
                        width: 100%;
                        border: solid 1px #ccc;
                        font-size: 17px;
                        color: #666;
                    }
                }
            }
            .jlBox{
                margin-top: 70px;
                width: 100%;
                p{
                    height: 30px;
                    line-height: 30px;
                    font-size: 16px;
                    color: #333;
                }
                .jlBoxs{
                    width: 100%;
                    background: #ccc;
                }
            }
        }
    }
    .tabActive{
        border-bottom: solid 2px #1890FF;
        color: #1890FF !important;
    }
    .readonly{
        border:none; 
        background-color:inherit
    }
    .bjMark{
        width: 100%;
        height: 100%;
        background: rgba(0,0,0,.7);
        position: fixed;
        left: 0;
        top: 0;
        z-index: 10;
        .bjtan{
            width: 500px;
            height: 500px;
            background: #fff;
            position: absolute;
            left: 50%;
            top: 50%;
            transform: translate(-50%,-50%);
            p{
                margin: 10px auto;
                width: 80%;
                height: 70px;
                font-size: 16px;
                line-height: 30px;
                input{
                    width: 100%;
                    height: 40px;
                    border: solid 1px #ccc;
                    font-size: 18px;
                    text-indent: 8px;
                    color: #333;
                }
                textarea{
                    border: solid 1px #ccc;
                }
            }
            .bjSj{
                height: 105px;
            }
            div{
                margin: 0 auto;
                width: 80%;
                display: flex;
                justify-content: space-around;
                button{
                    padding: 5px 10px;
                    outline: none;
                    border: none;
                    color: #666;
                }
                .but2{
                    background: #0ff;
                }
            }
        }
    }
</style>