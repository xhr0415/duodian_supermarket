<template>
	<div class="details" v-transition>
		<div class="wrap">
			
			<!-- 图片 -->
			<div class="img">
				<Banner :data="bannerArr"></Banner>
			</div>

			<!-- 价格-名字 -->
			<div class="message">
				<div class="price">
					<h2>
						￥<span>{{obj.price}}</span>
					</h2>
					<p>累计销售 {{obj.volume}} 份</p>
				</div>
				<div class="names">
					<div class="names-top">
						{{obj.name}}
					</div>
					<div class="names-bottom">剩余{{obj.stock}}份</div>
				</div>
			</div>

			<div class="imgs_title" ref="imgs_title"></div>
		</div>

    <!-- 底部 -->
    <div class="details-footer">
      <div class="left" @click="clk_back">
        返回
      </div>
      <div class="right" @click="clk_addShopCar(obj)">
        加入购物车
      </div>
    </div>
	</div>
</template>
<script>
import Banner from "./components/Banner";
import {mapActions} from 'vuex'
export default {
  props: {},
  components: {
    Banner
  },
  data() {
    return {
      obj: "",
      bannerArr: []
    };
  },
  computed: {},
  methods: {
    ...mapActions('shopCar',['clk_addShopCar']),
    // 点击返回
    clk_back(){
      this.$router.go(-1);
    }
  },
  created() {
    let item = this.$route.params.item;
    if (item) {
      this.obj = item;
      this.bannerArr = JSON.parse(item.pictures);
    }

    this.$nextTick(() => {
      this.$refs.imgs_title.innerHTML = this.obj.detail;
    });
    
  },
  mounted() {}
};
</script>
<style lang="scss">
.details {
  background: #f8f8f8;

  .img {
    width: 100%;
    height: 245px;

    img {
      width: 100%;
      height: 100%;
    }
  }

  .message {
    width: 100%;
    background: rgba(255, 255, 255, 1);
    border-radius: 12px;
    overflow: hidden;
    display: flex;
    flex-direction: column;

    .price {
      width: 100%;
      height: 60px;
      padding: 10px 20px;
      color: white;
      background: #fe4d28;

      h2 {
        span {
          font-size: 23px;
          font-weight: 600;
        }
      }
      p {
        font-size: 11px;
      }
    }

    .names {
			padding: 0 15px;
			display: flex;
			flex-direction: column;

			.names-top{
				font-size: 18px;
				padding: 5px 0px;
				padding-top: 15px;
			}

			.names-bottom{
				padding: 10px 0;
				color:rgba(153,153,153,1);
				font-size: 12px;
				display: flex;
				align-items: center;
			}
    }
  }

	.imgs_title{
		width: 100%;

		p{
			width: 100%;
			height: 100%;

				img{
					width: 100%;
				}
		}
	}

  .details-footer{
    width: 100%;
    height: 49px;
    display: flex;

    >div{
      display: flex;
      align-items: center;
      justify-content: center;
      color: white;
      font-size: 16px;
    }

    .left{
      flex: 4;
      background: #ddd;
    }

    .right{
      flex: 6;
      background:rgba(255,186,47,1);
    }
  }
}
</style>