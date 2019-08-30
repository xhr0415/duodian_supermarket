/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : duodian

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2019-08-19 14:45:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `uid` int(100) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `authorityid` int(100) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', 'admin', '1');

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '图片地址',
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '活动地址',
  `start_time` datetime DEFAULT NULL COMMENT '活动开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '活动结束时间',
  `user_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建人',
  `active_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '活动名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of banner
-- ----------------------------
INSERT INTO `banner` VALUES ('5x1jxui1rdg0000', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1565866459897&di=02533bde79f05f7875163dbdab676524&imgtype=0&src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F01b0595711fd566ac725134316ff68.jpg', 'https://eggjs.org/zh-cn/basics/controller.html#获取上传的文件', '2019-08-15 16:07:00', '2019-09-20 16:07:00', '1', '买车了');
INSERT INTO `banner` VALUES ('96l7sarnhkc0000', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1565866459445&di=c3eb3714d31585372a3fac777497e7f7&imgtype=0&src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F01f0305541db6800000115417f56ae.jpg%401280w_1l_2o_100sh.jpg', 'https://www.cnblogs.com/noper/p/6246993.html', '2019-08-15 16:07:00', '2019-09-20 16:07:00', '1', '团购拉');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '分类ID',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '分类名称',
  `parent_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '父级类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('2xe4he1vu9k00002xe4he1vu9k0000', '辣条', '2xe4he1vu9k00002xe4he1vu9');
INSERT INTO `category` VALUES ('2xvk98c1r4s00002xvk98c1r4s0000', '肉干', '2xe4he1vu9k00002xe4he1vu9');
INSERT INTO `category` VALUES ('2yd03purf3s00002yd03purf3s0000', '蜜饯干果', '2xe4he1vu9k00002xe4he1vu9');
INSERT INTO `category` VALUES ('2yufy78ud1a00002yufy78ud1a0000', '蔬菜', '1a00002yufy78ud1a');
INSERT INTO `category` VALUES ('2yufy78ud1a00002yufy78ud1a0001', '酒水', '78ud1a00002yufy78ud1a0');
INSERT INTO `category` VALUES ('32q1mjfm6a0000032q1mjfm6a00000', '被子', 'mjfm6a0000032q1mjf');
INSERT INTO `category` VALUES ('337hedf89ku0000337hedf89ku0000', '杯子', 'mjfm6a0000032q1mjf');
INSERT INTO `category` VALUES ('5v01jfq56eo0000', '薯片', '2xe4he1vu9k00002xe4he1vu9');

-- ----------------------------
-- Table structure for shopcar
-- ----------------------------
DROP TABLE IF EXISTS `shopcar`;
CREATE TABLE `shopcar` (
  `userid` varchar(100) DEFAULT NULL COMMENT '用户id',
  `shopid` varchar(100) DEFAULT NULL COMMENT '商品id',
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `count` int(255) DEFAULT NULL COMMENT '商品件数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of shopcar
-- ----------------------------
INSERT INTO `shopcar` VALUES ('2', '24', '1', '3');
INSERT INTO `shopcar` VALUES ('2', '23', '4', '1');

-- ----------------------------
-- Table structure for typeparent
-- ----------------------------
DROP TABLE IF EXISTS `typeparent`;
CREATE TABLE `typeparent` (
  `id` varchar(100) NOT NULL COMMENT '主键id',
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of typeparent
-- ----------------------------
INSERT INTO `typeparent` VALUES ('2xe4he1vu9k00002xe4he1vu9', '零食');
INSERT INTO `typeparent` VALUES ('1a00002yufy78ud1a', '蔬菜水果');
INSERT INTO `typeparent` VALUES ('78ud1a00002yufy78ud1a0', '酒饮');
INSERT INTO `typeparent` VALUES ('mjfm6a0000032q1mjf', '家居用品');
INSERT INTO `typeparent` VALUES ('6402sc5kink0000', '乳品雪糕');
INSERT INTO `typeparent` VALUES ('63syejf8gno0000', '休闲娱乐');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(100) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '密码',
  `avatar` varchar(255) CHARACTER SET latin1 DEFAULT NULL COMMENT '用户头像',
  `nickname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户昵称',
  `sex` enum('0','1') CHARACTER SET latin1 DEFAULT NULL COMMENT '性别',
  `age` int(3) DEFAULT NULL COMMENT '年龄',
  `phone` varchar(11) CHARACTER SET latin1 DEFAULT NULL COMMENT '手机号',
  `wechat` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '微信号',
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '12121212', '/public/images/pic.jpg', 'yihang', '0', '18', '18701553442', '18701553442', '2019-08-13 15:42:59', '2019-08-13 15:42:39');
INSERT INTO `user` VALUES ('2', 'abc123456', '/public/images/pic.jpg', '高兴', '1', '20', '13412341234', '13412341234', '2019-08-13 15:44:34', '2019-08-13 15:44:28');
INSERT INTO `user` VALUES ('3', 'abc123', '/public/images/pic.jpg', '小花', '1', '20', '13412341235', '13412341235', null, '2019-08-15 09:45:00');
INSERT INTO `user` VALUES ('5', 'abc123', '/public/images/pic.jpg', '小花', '1', '20', '13412341236', '13412341236', null, '2019-08-15 09:52:22');

-- ----------------------------
-- Table structure for wares
-- ----------------------------
DROP TABLE IF EXISTS `wares`;
CREATE TABLE `wares` (
  `id` int(100) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '商品名称',
  `cover` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '封面',
  `pictures` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '照片',
  `detail` text COLLATE utf8_unicode_ci COMMENT '详情',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `old_price` decimal(10,2) DEFAULT NULL COMMENT '原价',
  `stock` int(10) unsigned DEFAULT NULL COMMENT '库存',
  `volume` int(10) unsigned DEFAULT NULL COMMENT '销量',
  `specs` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '规格',
  `category_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '分类ID',
  `label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '标签',
  `status` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '商品状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `type_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '父级类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of wares
-- ----------------------------
INSERT INTO `wares` VALUES ('7', '油麦菜【袋】 约400g', 'https://img.dmallcdn.com/20180627/a89a25f8-22ee-4053-a662-f00f49e16573_800x800L', '[\"https://img.dmallcdn.com/20180627/a89a25f8-22ee-4053-a662-f00f49e16573_800x800L\",\"https://img.dmallcdn.com/20180627/64bb21be-9c77-4d03-b82f-65dadc55d7dc_800x800L\"]', '<p><img src=\"https://img.dmallcdn.com/20190428/0d0dbff9-ed47-4e6a-9964-b4822bf1ea1c\" alt=\"\" /><br /></p><p><img src=\"https://img.dmallcdn.com//20180408/38fb0f09-bd05-4302-9519-331d4dcf7752_m640\" alt=\"\" /></p>', '100.00', null, '10', '100', '[{\"key\":\"包装\",\"value\":\"袋装\"},{\"key\":\"重量\",\"value\":\"100/g\"},{\"key\":\"味道\",\"value\":\"无色无味\"}]', '2yufy78ud1a00002yufy78ud1a0000', null, '0', null, null, '1a00002yufy78ud1a');
INSERT INTO `wares` VALUES ('8', '福佳小瓶白啤 330mL', 'https://img.dmallcdn.com/20161112/c0cad37e-e61f-4393-88e8-713f54145714_800x800L', '[\"https://img.dmallcdn.com/20161112/c0cad37e-e61f-4393-88e8-713f54145714_800x800L\"]', '<p><img src=\"https://img.dmallcdn.com/20160922/49bcb752-7eb9-4ddc-a140-ed94e239cf43_m640\" alt=\"\" /><img src=\"https://img.dmallcdn.com/20160922/9dba43df-d355-4526-942a-369ee530aef4_m640\" alt=\"\" /><img src=\"https://img.dmallcdn.com/20160922/63339b48-72de-4862-9c9c-1099625f7483_m640\" alt=\"\" /><img src=\"https://img.dmallcdn.com/20160922/a3644d17-4c06-4c9d-b728-2fa525248e45_m640\" alt=\"\" /><img src=\"https://img.dmallcdn.com/20160922/3b188b31-2b54-4e3b-874d-8c79b7ad77c8_m640\" alt=\"\" /><br /></p><p><img src=\"https://img.dmallcdn.com//20180408/38fb0f09-bd05-4302-9519-331d4dcf7752_m640\" alt=\"\" /></p>', '100.00', null, '1000', '1000', '[{\"value\":\"其它\",\"key\":\"类别\"},{\"value\":\"0-499ml\",\"key\":\"净含量\"},{\"value\":\"瓶装\",\"key\":\"包装\"},{\"value\":\"比利时\",\"key\":\"国别\"}]', '2yufy78ud1a00002yufy78ud1a0001', null, '0', null, null, '78ud1a00002yufy78ud1a0');
INSERT INTO `wares` VALUES ('9', '可米小子盐焗腰果 96g', 'https://img.dmallcdn.com/20181226/c758c130-3035-4722-b837-073e5ab901c5_800x800L', '[\"https://img.dmallcdn.com/20181226/c758c130-3035-4722-b837-073e5ab901c5_800x800L\",\"https://img.dmallcdn.com/20181226/72b756b8-16f6-4f8b-8a1c-4969fd32d73d_800x800L\",\"https://img.dmallcdn.com/20181226/ffcf5c0b-57a3-429c-839c-02c44a631e02_800x800L\",\"https://img.dmallcdn.com/20181226/9d6982cd-2cb8-402b-a1a1-114a3b29469b_800x800L\"]', '<p><img src=\"https://img.dmallcdn.com/20181226/df056183-adcd-46a1-99d2-b2122a54f3c7_m640\" alt=\"\" /><br /></p><p><img src=\"https://img.dmallcdn.com//20180408/38fb0f09-bd05-4302-9519-331d4dcf7752_m640\" alt=\"\" /></p>', '299.00', null, '20', '20', '[{\"key\":\"包装\",\"value\":\"盒装\"}]', '2yd03purf3s00002yd03purf3s0000', null, '0', null, null, '2xe4he1vu9k00002xe4he1vu9');
INSERT INTO `wares` VALUES ('10', '可米小子加州西梅 198g', 'https://img.dmallcdn.com/20181226/f080f656-e752-4392-a807-0faefeb33d93_800x800L', '[\"https://img.dmallcdn.com/20181226/f080f656-e752-4392-a807-0faefeb33d93_800x800L\",\"https://img.dmallcdn.com/20181226/8c20e7fc-b919-4a20-8118-8ce0a503f52f_800x800L\",\"https://img.dmallcdn.com/20181226/1294f48a-5cdc-45e4-8e56-6923c9b5c465_800x800L\",\"https://img.dmallcdn.com/20181226/ab8990e9-821f-4e65-a790-f321ebb8b42f_800x800L\"]', '<p><img src=\"https://img.dmallcdn.com/20181226/a3338e88-22c6-47b3-bb4d-7c6ac7d20512_m640\" alt=\"\" /><br /></p><p><img src=\"https://img.dmallcdn.com//20180408/38fb0f09-bd05-4302-9519-331d4dcf7752_m640\" alt=\"\" /></p>', '20.00', null, '19', '10000', '[{\"key\":\"包装\",\"value\":\"盒装\"}]', '2yd03purf3s00002yd03purf3s0000', null, '0', null, null, '2xe4he1vu9k00002xe4he1vu9');
INSERT INTO `wares` VALUES ('11', '一品巷子魔芋爽 180g', 'https://img.dmallcdn.com/20190328/77cb681f-d909-4bd7-a272-5080a4d99a04_800x800L', '[\"https://img.dmallcdn.com/20190328/77cb681f-d909-4bd7-a272-5080a4d99a04_800x800L\",\"https://img.dmallcdn.com/20190328/8c09aac2-365a-4c85-bc1a-6e876b267830_800x800L\",\"https://img.dmallcdn.com/20190328/8ed350bf-1792-4338-b2f8-76bc62460df6_800x800L\",\"https://img.dmallcdn.com/20190328/d7eed658-eb2d-46c6-a316-f6ee98e0ee1b_800x800L\",\"https://img.dmallcdn.com/20190328/c775f515-61fa-41e6-9583-14a2c241439a_800x800L\",\"https://img.dmallcdn.com/20190328/389496f9-7048-4cb1-91cc-221409053c79_800x800L\"]', '<p><img src=\"https://img.dmallcdn.com/20190329/dc92850e-4013-4128-9972-c4300aae9188\" alt=\"\" /><img src=\"https://img.dmallcdn.com/20190329/5b258881-0345-426f-b498-d3ca6a98a88b\" alt=\"\" /><img src=\"https://img.dmallcdn.com/20190329/0ba109d9-c763-41a9-bdb0-2394b5a90118\" alt=\"\" /><img src=\"https://img.dmallcdn.com/20190329/45d8c410-f5e8-4b69-ade2-63b077abfe8d\" alt=\"\" /><img src=\"https://img.dmallcdn.com/20190329/5e5c9cd7-6b59-40bc-93f2-f963ad8afb0e\" alt=\"\" /><img src=\"https://img.dmallcdn.com/20190329/4ebd092e-593e-49e1-8114-0769989f67c6\" alt=\"\" /><img src=\"https://img.dmallcdn.com/20190329/6fe3381e-fd93-4ab2-8845-48b2c8761cdd\" alt=\"\" /><img src=\"https://img.dmallcdn.com/20190329/38c116b9-c070-45c8-a891-7c889a106f89\" alt=\"\" /><img src=\"https://img.dmallcdn.com/20190329/395662d8-f626-4dad-9d9c-c17b255476b4\" alt=\"\" /><img src=\"https://img.dmallcdn.com/20190329/3a771e7e-0602-4afc-8d5f-1bb6be29fce1\" alt=\"\" /><br /></p><p><img src=\"https://img.dmallcdn.com//20180408/38fb0f09-bd05-4302-9519-331d4dcf7752_m640\" alt=\"\" /></p>', '90.00', null, '3999', '300', '[{\"key\":\"包装\",\"value\":\"袋装\"}]', '2xe4he1vu9k00002xe4he1vu9k0000', null, '0', null, null, '2xe4he1vu9k00002xe4he1vu9');
INSERT INTO `wares` VALUES ('12', '果园老农西梅 170g', 'https://img.dmallcdn.com/20151210/1371f3b6-f008-4dc7-ba5d-7b5a31217904_800x800L', '[\"https://img.dmallcdn.com/20151210/1371f3b6-f008-4dc7-ba5d-7b5a31217904_800x800L\"]', '<p><img src=\"https://img.dmallcdn.com/20161125/7287732a-fbc8-4047-93c7-886ed7a1bb53_m640\" alt=\"\" /><img src=\"https://img.dmallcdn.com/20161125/4a91489d-37f1-41ad-a96a-4fc2ec9c8ad6_m640\" alt=\"\" /><img src=\"https://img.dmallcdn.com/20161125/da948544-532d-4b31-9102-3fef6505222f_m640\" alt=\"\" /><img src=\"https://img.dmallcdn.com/20161125/5496eebf-8570-483d-8d1d-ecddcfce6d51_m640\" alt=\"\" /><img src=\"https://img.dmallcdn.com/20161125/a4b0cca1-60d9-4814-9e5a-b40f18ee8b09_m640\" alt=\"\" /><img src=\"https://img.dmallcdn.com/20161125/6dc3114c-1783-4601-b3c7-3888e9dd1bb8_m640\" alt=\"\" /><img src=\"https://img.dmallcdn.com/20161125/5b8eb48d-f248-4033-bb35-088479681e6a_m640\" alt=\"\" /><img src=\"https://img.dmallcdn.com/20161125/e0941ee3-122e-4312-ad50-976bcdde02b4_m640\" alt=\"\" /><img src=\"https://img.dmallcdn.com/20161125/90dc1970-ee5d-4ca2-ac2b-41bc15780389_m640\" alt=\"\" /><img src=\"https://img.dmallcdn.com/20161125/cf8a2873-9f4a-4eac-93b8-41180c2751c2_m640\" alt=\"\" /><img src=\"https://img.dmallcdn.com/20161125/0b4d0ff7-294a-4063-8bca-28f67e46390a_m640\" alt=\"\" /><br /></p><p><img src=\"https://img.dmallcdn.com//20180408/38fb0f09-bd05-4302-9519-331d4dcf7752_m640\" alt=\"\" /></p>', '100.00', null, '22', '901', '[{\"value\":\"梅/莓\",\"key\":\"类型\"},{\"value\":\"果脯类\",\"key\":\"加工工艺\"},{\"value\":\"袋装\",\"key\":\"包装\"},{\"value\":\"国产\",\"key\":\"产地\"}]', '2yd03purf3s00002yd03purf3s0000', null, '0', null, null, '2xe4he1vu9k00002xe4he1vu9');
INSERT INTO `wares` VALUES ('13', '卫龙大面筋 106g', 'https://img.dmallcdn.com/20181126/ecee94e8-4568-4703-b4f5-65772c7649f4_800x800L', '[\"https://img.dmallcdn.com/20181126/ecee94e8-4568-4703-b4f5-65772c7649f4_800x800L\",\"https://img.dmallcdn.com/20181126/77c17ad3-ef78-4b43-bb0a-4a49908a19db_800x800L\",\"https://img.dmallcdn.com/20181126/2681acb1-66fa-4c81-b2fe-af2116a53c43_800x800L\",\"https://img.dmallcdn.com/20181126/101bedcc-4993-4974-868b-b696e3723acf_800x800L\"]', '<p><img src=\"https://img.dmallcdn.com/20170707/360488f0-6060-425a-bd4b-520e4563e25f_m640\" alt=\"\" /><img src=\"https://img.dmallcdn.com/20170707/6d9e6585-eee7-4f13-93b5-c038c425e092_m640\" alt=\"\" /><img src=\"https://img.dmallcdn.com/20170707/964f1c75-6e50-437d-9bce-2d91d82cc1c5_m640\" alt=\"\" /><img src=\"https://img.dmallcdn.com/20170707/3f42946c-6262-46a0-894b-e767eca3201d_m640\" alt=\"\" /><img src=\"https://img.dmallcdn.com/20170707/aa6962f3-bdce-4a40-afc6-77e470ee549a_m640\" alt=\"\" /><img src=\"https://img.dmallcdn.com/20170707/caa2d83e-bcb9-4192-ad86-0c22a2cf570c_m640\" alt=\"\" /><br /></p><p><img src=\"https://img.dmallcdn.com//20180408/38fb0f09-bd05-4302-9519-331d4dcf7752_m640\" alt=\"\" /></p>', '80.20', null, '1000', '800', '[{\"value\":\"其它\",\"key\":\"口味\"},{\"value\":\"普通\",\"key\":\"特性\"},{\"value\":\"袋装\",\"key\":\"包装\"},{\"value\":\"国产\",\"key\":\"产地\"}]', '2xe4he1vu9k00002xe4he1vu9k0000', null, '0', null, null, '2xe4he1vu9k00002xe4he1vu9');
INSERT INTO `wares` VALUES ('14', '好巴食豆腐干混合装 400g', 'https://img.dmallcdn.com/20181122/92e2715a-f0f7-4419-80a0-6dccf416ea8e_800x800L', '[\"https://img.dmallcdn.com/20181122/92e2715a-f0f7-4419-80a0-6dccf416ea8e_800x800L\",\"https://img.dmallcdn.com/20181122/9f17c561-a589-4fbc-b22d-c7e75b35b19e_800x800L\",\"https://img.dmallcdn.com/20181122/6d97b943-0d5f-4915-a3b1-a60b798480b6_800x800L\"]', '<p><img src=\"https://img.dmallcdn.com/20170307/a0a925c7-e40a-4e24-b1f4-a188ac37e113_m640\" alt=\"\" /><br /></p><p><img src=\"https://img.dmallcdn.com//20180408/38fb0f09-bd05-4302-9519-331d4dcf7752_m640\" alt=\"\" /></p>', '12.00', null, '200', '281', '[{\"value\":\"其它\",\"key\":\"口味\"},{\"value\":\"无添加\",\"key\":\"特性\"},{\"value\":\"袋装\",\"key\":\"包装\"},{\"value\":\"国产\",\"key\":\"产地\"}]', '2xe4he1vu9k00002xe4he1vu9k0000', null, '0', null, null, '2xe4he1vu9k00002xe4he1vu9');
INSERT INTO `wares` VALUES ('15', '源氏老式大辣片 200g', 'https://img.dmallcdn.com/20181010/b6eb57e8-d051-443d-b760-8c716a32d30d_800x800L', '[\"https://img.dmallcdn.com/20181010/b6eb57e8-d051-443d-b760-8c716a32d30d_800x800L\",\"https://img.dmallcdn.com/20181010/1002ee99-e188-4655-9595-19cb53ddbcd6_800x800L\",\"https://img.dmallcdn.com/20181010/a5b58ea8-b8f1-4015-b181-2647299441d0_800x800L\",\"https://img.dmallcdn.com/20181010/42cf58c2-c7dd-40a9-b559-a6c911fa6d03_800x800L\",\"https://img.dmallcdn.com/20181010/5ff66133-4b8c-4d52-b85c-163c24a98731_800x800L\",\"https://img.dmallcdn.com/20181010/2c9adcad-4d68-470f-9f63-b180594edb5b_800x800L\"]', '<p><img src=\"https://img.dmallcdn.com/20180913/cb5d54ec-67d7-48ae-af04-9a9b67c9df05_m640\" alt=\"\" /><img src=\"https://img.dmallcdn.com/20180913/902cb6d4-8aad-4186-ac6d-e9d0b14ffb7c_m640\" alt=\"\" /><img src=\"https://img.dmallcdn.com/20180913/7c375787-6762-4b2f-ac94-9f0ac4d8cc70_m640\" alt=\"\" /><img src=\"https://img.dmallcdn.com/20180913/29b4bbb8-4fae-4c20-b1db-7fde809a4375_m640\" alt=\"\" /><img src=\"https://img.dmallcdn.com/20180913/7caf507a-1bd8-4741-9127-de4978b707aa_m640\" alt=\"\" /><img src=\"https://img.dmallcdn.com/20180913/8d494764-a384-49dd-bd71-da61b1cdea93_m640\" alt=\"\" /><img src=\"https://img.dmallcdn.com/20180913/a355c862-3334-43d4-9073-ce4a52ac5f77_m640\" alt=\"\" /><img src=\"https://img.dmallcdn.com/20180913/3a98b72d-73a1-43bf-8cbf-cd0ccb36d6da_m640\" alt=\"\" /><img src=\"https://img.dmallcdn.com/20180913/fb82f709-27ca-45ce-a9a8-f81973d9415f_m640\" alt=\"\" /><br /></p><p><img src=\"https://img.dmallcdn.com//20180408/38fb0f09-bd05-4302-9519-331d4dcf7752_m640\" alt=\"\" /></p>', '23.00', null, '100', '319', '[{\"value\":\"香辣味\",\"key\":\"口味\"},{\"value\":\"其它\",\"key\":\"特性\"},{\"value\":\"袋装\",\"key\":\"包装\"},{\"value\":\"国产\",\"key\":\"产地\"}]', '2xe4he1vu9k00002xe4he1vu9k0000', null, '0', null, null, '2xe4he1vu9k00002xe4he1vu9');
INSERT INTO `wares` VALUES ('16', '卫龙川香麻辣味亲嘴豆皮 60g', 'https://img.dmallcdn.com/20180913/331ce9bd-b43a-41fd-8b9d-ca09ef43e6c8_800x800L', '[\"https://img.dmallcdn.com/20180913/331ce9bd-b43a-41fd-8b9d-ca09ef43e6c8_800x800L\",\"https://img.dmallcdn.com/20180913/397b154c-ae47-4370-b90e-c4475785a5a2_800x800L\",\"https://img.dmallcdn.com/20180913/ff21469f-55c7-45bc-9f02-4261b845173a_800x800L\",\"https://img.dmallcdn.com/20180913/784d1357-fe52-4976-b624-5a9baa218a79_800x800L\",\"https://img.dmallcdn.com/20180913/63a3de91-03a7-430d-aeb2-81e9ab1ec996_800x800L\"]', '<p><img src=\"https://img.dmallcdn.com/20170802/ee031a53-76ad-40be-972c-9806c382c97a_m640\" alt=\"\" /><img src=\"https://img.dmallcdn.com/20170802/5ef30cd4-aba4-42a2-b49c-94e06059253c_m640\" alt=\"\" /><img src=\"https://img.dmallcdn.com/20170802/be46134a-17c6-47d8-9292-8115e10cd423_m640\" alt=\"\" /><img src=\"https://img.dmallcdn.com/20170802/c28a4df3-9ed3-424a-a161-e43eec109bf5_m640\" alt=\"\" /><img src=\"https://img.dmallcdn.com/20170802/ee8b67a3-9b9c-4c02-8522-3307975a0779_m640\" alt=\"\" /><img src=\"https://img.dmallcdn.com/20170802/5940c7b2-a001-4cb6-924a-87c93a188707_m640\" alt=\"\" /><br /></p><p><img src=\"https://img.dmallcdn.com//20180408/38fb0f09-bd05-4302-9519-331d4dcf7752_m640\" alt=\"\" /></p>', '20.00', null, '29', '201', '[{\"value\":\"麻辣味\",\"key\":\"口味\"},{\"value\":\"普通\",\"key\":\"特性\"},{\"value\":\"袋装\",\"key\":\"包装\"},{\"value\":\"国产\",\"key\":\"产地\"}]', '2xe4he1vu9k00002xe4he1vu9k0000', null, '0', null, null, '2xe4he1vu9k00002xe4he1vu9');
INSERT INTO `wares` VALUES ('17', '果园老农西梅 320g', 'https://img.dmallcdn.com/20170807/e5975349-0df7-4538-8fd0-8804ca2a6587_800x800L', '[\"https://img.dmallcdn.com/20170807/e5975349-0df7-4538-8fd0-8804ca2a6587_800x800L\"]', '<p><img src=\"https://img.dmallcdn.com/20160107/54cc3a3e-a588-4160-8e36-460529e8f451_m640\" alt=\"\" /><img src=\"https://img.dmallcdn.com/20160107/c588f255-9116-491a-b14b-111581f79af8_m640\" alt=\"\" /><img src=\"https://img.dmallcdn.com/20160107/ade1c026-9f49-434d-ac9d-758b02957494_m640\" alt=\"\" /><img src=\"https://img.dmallcdn.com/20160107/de91212d-4825-4a27-9f17-7f779b6577d9_m640\" alt=\"\" /><img src=\"https://img.dmallcdn.com/20160107/0b0bcc7b-8bad-4609-b2cf-f97f380ab660_m640\" alt=\"\" /><img src=\"https://img.dmallcdn.com/20160107/1cd46f34-5f5c-4431-83cd-a12e3720ad0e_m640\" alt=\"\" /><img src=\"https://img.dmallcdn.com/20160107/0837bc26-90f5-4b82-a6e1-7d9ab12e3c4f_m640\" alt=\"\" /><img src=\"https://img.dmallcdn.com/20160107/2c4928a6-ef1f-4334-bb12-d91189f21ef0_m640\" alt=\"\" /><br /></p><p><img src=\"https://img.dmallcdn.com//20180408/38fb0f09-bd05-4302-9519-331d4dcf7752_m640\" alt=\"\" /></p>', '29.00', null, '23', '500', '[{\"value\":\"梅/莓\",\"key\":\"类型\"},{\"value\":\"果脯类\",\"key\":\"加工工艺\"},{\"value\":\"袋装\",\"key\":\"包装\"},{\"value\":\"国产\",\"key\":\"产地\"}]', '2yd03purf3s00002yd03purf3s0000', null, '0', null, null, '2xe4he1vu9k00002xe4he1vu9');
INSERT INTO `wares` VALUES ('18', '良食记香辣牛肉干 138g', 'https://img.dmallcdn.com/20181203/f0d10acd-f507-465a-90e2-fbde1f524c3b_800x800L', '[\"https://img.dmallcdn.com/20181203/f0d10acd-f507-465a-90e2-fbde1f524c3b_800x800L\",\"https://img.dmallcdn.com/20190314/a01eca2c-67ea-49cf-9a6e-3dbb22b417cb_800x800L\",\"https://img.dmallcdn.com/20181203/563e2563-4826-482e-94da-260bb36a649e_800x800L\"]', '<p><img src=\"https://img.dmallcdn.com//20180408/38fb0f09-bd05-4302-9519-331d4dcf7752_m640\" alt=\"\" /></p>', '80.00', null, '3', '700', '[{\"key\":\"味道\",\"value\":\"毒药味\"}]', '2xvk98c1r4s00002xvk98c1r4s0000', null, '0', null, null, '2xe4he1vu9k00002xe4he1vu9');
INSERT INTO `wares` VALUES ('19', '鸿昌口杯 颜色随机', 'https://img.dmallcdn.com/20161112/eff77828-1348-4901-b31f-22ba914d43be_800x800L', '[\"https://img.dmallcdn.com/20161112/eff77828-1348-4901-b31f-22ba914d43be_800x800L\",\"https://img.dmallcdn.com/20150612/52573dcd-c204-4af5-a389-cd2c5c57bd27_800x800L\",\"https://img.dmallcdn.com/20150612/09480def-30a5-464d-8232-84e30f20be6d_800x800L\",\"https://img.dmallcdn.com/20150612/4f45d807-50b1-473f-aa02-743303c0fe7c_800x800L\",\"https://img.dmallcdn.com/20150612/de7a72ee-afd7-4618-996e-7d7f8039b901_800x800L\",\"https://img.dmallcdn.com/20150612/aee3a63c-f6c0-485d-9932-c0a4b87d3bf5_800x800L\"]', '<p><img src=\"https://img.dmallcdn.com/20171213/d570a146-4923-403d-9ae2-e097c11a0696_m640\" alt=\"\" /><br /></p><p><img src=\"https://img.dmallcdn.com//20180408/38fb0f09-bd05-4302-9519-331d4dcf7752_m640\" alt=\"\" /></p>', '5.00', null, '100', '803', '[{\"key\":\"包装\",\"value\":\"没有\"}]', '337hedf89ku0000337hedf89ku0000', null, '0', null, null, 'mjfm6a0000032q1mjf');
INSERT INTO `wares` VALUES ('20', '茶花润巧运动杯促销装3818P', 'https://img.dmallcdn.com/20150425/a99c9696-ca64-486a-8cac-eab218655fc7_800x800L', '[\"https://img.dmallcdn.com/20150425/a99c9696-ca64-486a-8cac-eab218655fc7_800x800L\",\"https://img.dmallcdn.com/20150425/e62c8cce-aa8e-49c6-914b-f5ddf438ba66_800x800L\"]', '<p><img src=\"https://img.dmallcdn.com//20180408/38fb0f09-bd05-4302-9519-331d4dcf7752_m640\" alt=\"\" /></p>', '20.00', null, '70', '803', '[{\"key\":\"包装\",\"value\":\"一个盒子\"}]', '337hedf89ku0000337hedf89ku0000', null, '0', null, null, 'mjfm6a0000032q1mjf');
INSERT INTO `wares` VALUES ('21', '美地牛奶杯118', 'https://img.dmallcdn.com/20170316/12fad64d-c8a6-4f27-a359-c4b7212a7e53_800x800L', '[\"https://img.dmallcdn.com/20170316/12fad64d-c8a6-4f27-a359-c4b7212a7e53_800x800L\",\"https://img.dmallcdn.com/20150710/40da3f0f-7995-4a73-b94a-e02fa4237616_800x800L\",\"https://img.dmallcdn.com/20150710/6a2c9b62-3c2c-40ec-8aa1-787aea8daff4_800x800L\"]', '<p><img src=\"https://img.dmallcdn.com//20180408/38fb0f09-bd05-4302-9519-331d4dcf7752_m640\" alt=\"\" /></p>', '70.00', null, '1000', '100021', '[{\"value\":\"201-300ml\",\"key\":\"规格\"},{\"value\":\"塑料\",\"key\":\"材质\"}]', '337hedf89ku0000337hedf89ku0000', null, '0', null, null, 'mjfm6a0000032q1mjf');
INSERT INTO `wares` VALUES ('22', '物生物型格双层水晶玻璃杯WCB1009-260', 'https://img.dmallcdn.com/20190614/c997649f-f006-42bb-925f-841210150c7f_800x800L', '[\"https://img.dmallcdn.com/20190614/c997649f-f006-42bb-925f-841210150c7f_800x800L\"]', '<p><img src=\"https://img.dmallcdn.com//20180408/38fb0f09-bd05-4302-9519-331d4dcf7752_m640\" alt=\"\" /></p>', '89.00', null, '100', '100212', '[{\"key\":\"味道\",\"value\":\"塑料味道\"}]', '337hedf89ku0000337hedf89ku0000', null, '0', null, null, 'mjfm6a0000032q1mjf');
INSERT INTO `wares` VALUES ('23', '思侬家纺茶韵冰丝御藤枕 1个', 'https://img.dmallcdn.com/20190510/be809eef-8dc1-446a-9549-2294edc36cb5_800x800L', '[\"https://img.dmallcdn.com/20190510/be809eef-8dc1-446a-9549-2294edc36cb5_800x800L\",\"https://img.dmallcdn.com/20190510/a12d58d3-404f-4286-b8bc-0f30e8c5bba3_800x800L\",\"https://img.dmallcdn.com/20190510/1eb29233-8c02-4046-b3e4-720ccb272993_800x800L\",\"https://img.dmallcdn.com/20190510/0d542e40-a829-4c10-86be-14e8ebd85f77_800x800L\",\"https://img.dmallcdn.com/20190510/e3dc744d-7c23-4dd7-bb51-b0299aacfacb_800x800L\"]', '<p><img src=\"https://img.dmallcdn.com//20180408/38fb0f09-bd05-4302-9519-331d4dcf7752_m640\" alt=\"\" /></p>', '80.00', null, '100', '1212', '[{\"value\":\"单人枕头\",\"key\":\"枕头长度\"},{\"value\":\"3.1~4斤\",\"key\":\"枕头重量\"},{\"value\":\"长方形\",\"key\":\"枕头形状\"},{\"value\":\"其它\",\"key\":\"填充物类别\"}]', '32q1mjfm6a0000032q1mjfm6a00000', null, '0', null, null, 'mjfm6a0000032q1mjf');
INSERT INTO `wares` VALUES ('24', '迎时冰丝席三件套150*195cm', 'https://img.dmallcdn.com/20190428/3305c73c-a76c-42ac-a783-77a8dcb324c3_800x800L', '[\"https://img.dmallcdn.com/20190428/3305c73c-a76c-42ac-a783-77a8dcb324c3_800x800L\",\"https://img.dmallcdn.com/20190428/e91cd1a8-b000-49c3-a279-0bc780084779_800x800L\",\"https://img.dmallcdn.com/20190428/4b84c703-fafd-4977-9fc3-b32ed5d7fc7c_800x800L\",\"https://img.dmallcdn.com/20190428/27ac50fc-9616-4d6a-b3aa-0ecfcd05ea6f_800x800L\",\"https://img.dmallcdn.com/20190428/13f7dd98-732e-43f9-9b64-0b254e481cf7_800x800L\"]', '<p><img src=\"https://img.dmallcdn.com/20190428/ef098b4c-4b38-4fde-a917-464fa758b512\" alt=\"\" /><img src=\"https://img.dmallcdn.com/20190428/db7002ec-1a49-4f19-aef7-2d94ed7f30cf\" alt=\"\" /><img src=\"https://img.dmallcdn.com/20190428/425b92da-555d-426a-a5bb-2da41c560780\" alt=\"\" /><img src=\"https://img.dmallcdn.com/20190428/d72f56a8-0325-4a4f-9798-285486bf7d7c\" alt=\"\" /><img src=\"https://img.dmallcdn.com/20190428/b998c6b2-8846-42d7-a1c1-6094c5116524\" alt=\"\" /><img src=\"https://img.dmallcdn.com/20190428/8115d398-a1d8-4cf8-a461-0413777b7e8a\" alt=\"\" /><img src=\"https://img.dmallcdn.com/20190428/8079e1ac-e703-45cb-84ce-5ac6bf9928aa\" alt=\"\" /><img src=\"https://img.dmallcdn.com/20190428/b08e20d6-ab72-4079-bb00-290af8b03d49\" alt=\"\" /><img src=\"https://img.dmallcdn.com/20190428/fd89ed8e-421b-4a2b-b92a-11a6232845b8\" alt=\"\" /><img src=\"https://img.dmallcdn.com/20190428/001b92a8-7259-4ff4-a149-4f5d407b1632\" alt=\"\" /><img src=\"https://img.dmallcdn.com/20190428/eee47625-e8f4-4f80-8522-0f8429069e9d\" alt=\"\" /><img src=\"https://img.dmallcdn.com/20190428/730b109f-ffcd-4d67-96b4-ec51a8650f1b\" alt=\"\" /><img src=\"https://img.dmallcdn.com/20190428/010f34a0-c4ec-4d46-8740-eb279cac4a3b\" alt=\"\" /><img src=\"https://img.dmallcdn.com/20190428/15d88b64-f683-434e-ab59-ef510b7f69e3\" alt=\"\" /><img src=\"https://img.dmallcdn.com/20190428/76e85ee2-6c34-47a7-8e16-2dd7e41a29c7\" alt=\"\" /><img src=\"https://img.dmallcdn.com/20190428/c88e28c7-e428-4009-8485-758e6ee917d4\" alt=\"\" /><img src=\"https://img.dmallcdn.com/20190428/4a8f6dd4-e2a3-4185-b395-d33020c768c7\" alt=\"\" /><br /></p><p><img src=\"https://img.dmallcdn.com//20180408/38fb0f09-bd05-4302-9519-331d4dcf7752_m640\" alt=\"\" /></p>', '190.00', null, '10', '12212', '[{\"key\":\"包装\",\"value\":\"三界套\"}]', '32q1mjfm6a0000032q1mjfm6a00000', null, '0', null, null, 'mjfm6a0000032q1mjf');
