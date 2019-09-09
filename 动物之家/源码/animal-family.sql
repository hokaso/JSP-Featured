/*
Navicat MySQL Data Transfer

Source Server         : animalfamily
Source Server Version : 50560
Source Host           : 119.23.201.230:3306
Source Database       : animal-family

Target Server Type    : MYSQL
Target Server Version : 50560
File Encoding         : 65001

Date: 2019-06-05 20:50:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for adopt_animal
-- ----------------------------
DROP TABLE IF EXISTS `adopt_animal`;
CREATE TABLE `adopt_animal` (
  `adoa_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '领养信息id',
  `adoa_adress` varchar(255) NOT NULL COMMENT '地址',
  `adoa_kind` varchar(50) NOT NULL COMMENT '种类',
  `adoa_label` varchar(50) DEFAULT NULL COMMENT '标签',
  `adoa_title` varchar(50) NOT NULL COMMENT '标题',
  `adoa_title_img` varchar(100) NOT NULL COMMENT '标题图路径',
  `adoa_describe` text COMMENT '信息',
  `adoa_user` int(11) NOT NULL COMMENT '发布者id',
  `adoa_state` int(11) NOT NULL COMMENT '0未被领养/1被领养/2删除',
  `adoa_publish_time` datetime NOT NULL COMMENT '发布时间',
  PRIMARY KEY (`adoa_id`),
  KEY `FK_adoaUser_uId` (`adoa_user`),
  CONSTRAINT `FK_adoaUser_uId` FOREIGN KEY (`adoa_user`) REFERENCES `af_user` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for adopt_animal_collect
-- ----------------------------
DROP TABLE IF EXISTS `adopt_animal_collect`;
CREATE TABLE `adopt_animal_collect` (
  `aac_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '领养动物信息收藏id唯一标识',
  `aac_user_id` int(11) NOT NULL COMMENT '收藏者id',
  `aac_adoa_id` int(11) NOT NULL COMMENT '领养动物信息的id',
  `aac_time` datetime NOT NULL COMMENT '收藏时间',
  PRIMARY KEY (`aac_id`),
  KEY `FK_aacUserId_uId` (`aac_user_id`),
  KEY `FK_aacAdoaId_adoaId` (`aac_adoa_id`),
  CONSTRAINT `FK_aacAdoaId_adoaId` FOREIGN KEY (`aac_adoa_id`) REFERENCES `adopt_animal` (`adoa_id`),
  CONSTRAINT `FK_aacUserId_uId` FOREIGN KEY (`aac_user_id`) REFERENCES `af_user` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for af_user
-- ----------------------------
DROP TABLE IF EXISTS `af_user`;
CREATE TABLE `af_user` (
  `u_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `u_name` varchar(50) NOT NULL COMMENT '用户名',
  `u_account` varchar(20) NOT NULL COMMENT '用户账号',
  `u_password` varchar(50) NOT NULL COMMENT '密码',
  `u_phone` varchar(15) DEFAULT NULL COMMENT '手机号',
  `u_email` varchar(30) NOT NULL COMMENT '邮箱',
  `u_sex` int(11) NOT NULL COMMENT '性别 0男性/1女性/2保密',
  `u_register_time` datetime NOT NULL COMMENT '注册日期',
  `u_introduce` text COMMENT '自我介绍',
  `u_headimage` varchar(100) NOT NULL COMMENT '头像图片路径',
  `u_state` int(11) NOT NULL COMMENT '状态 0不可用/1正常/2注销',
  `u_login_status` varchar(20) NOT NULL COMMENT '登陆状态offline/hide/online',
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for application
-- ----------------------------
DROP TABLE IF EXISTS `application`;
CREATE TABLE `application` (
  `app_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '审核id',
  `app_user_id` int(11) NOT NULL COMMENT '发起人id',
  `app_type` varchar(10) NOT NULL COMMENT '审核类型医生,商家',
  `app_apply_time` datetime NOT NULL COMMENT '申请时间',
  `app_manager_id` int(11) DEFAULT NULL COMMENT '审核者id',
  `app_check_time` datetime DEFAULT NULL COMMENT '审核时间',
  `app_result` int(11) NOT NULL COMMENT '审核结果 0未审核/1通过/2未通过',
  PRIMARY KEY (`app_id`),
  KEY `FK_appUserId_uId` (`app_user_id`),
  KEY `FK_appManagerId_uId` (`app_manager_id`),
  CONSTRAINT `FK_appManagerId_uId` FOREIGN KEY (`app_manager_id`) REFERENCES `af_user` (`u_id`),
  CONSTRAINT `FK_appUserId_uId` FOREIGN KEY (`app_user_id`) REFERENCES `af_user` (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for apply_animal
-- ----------------------------
DROP TABLE IF EXISTS `apply_animal`;
CREATE TABLE `apply_animal` (
  `appa_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '申请id 唯一标识',
  `appa_user_id` int(11) NOT NULL COMMENT '申请者id',
  `appa_adopt_animal` int(11) NOT NULL COMMENT '领养动物信息id',
  `appa_state` int(11) NOT NULL COMMENT '状态 0未审核/1通过/2未通过',
  `appa_dispose_time` datetime DEFAULT NULL COMMENT '处理时间',
  `appa_apply_time` datetime NOT NULL COMMENT '申请时间',
  PRIMARY KEY (`appa_id`),
  KEY `FK_appaUserId_uId` (`appa_user_id`),
  KEY `FK_appaAdoptAnimal_adoaId` (`appa_adopt_animal`),
  CONSTRAINT `FK_appaAdoptAnimal_adoaId` FOREIGN KEY (`appa_adopt_animal`) REFERENCES `adopt_animal` (`adoa_id`),
  CONSTRAINT `FK_appaUserId_uId` FOREIGN KEY (`appa_user_id`) REFERENCES `af_user` (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for business
-- ----------------------------
DROP TABLE IF EXISTS `business`;
CREATE TABLE `business` (
  `business_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商家表唯一标识',
  `business_user` int(11) NOT NULL COMMENT '商家用户id',
  `business_license_img` varchar(100) NOT NULL COMMENT '营业执照路径',
  PRIMARY KEY (`business_id`),
  KEY `FK_businessUser_uId` (`business_user`),
  CONSTRAINT `FK_businessUser_uId` FOREIGN KEY (`business_user`) REFERENCES `af_user` (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '购物车id唯一标识',
  `c_user_id` int(11) NOT NULL COMMENT '用户id',
  `c_goods_id` int(11) NOT NULL COMMENT '商品id',
  `c_num` int(11) NOT NULL COMMENT '商品数量',
  PRIMARY KEY (`c_id`),
  KEY `FK_cUserId_uId` (`c_user_id`),
  KEY `FK_cGoodsId_goodsId` (`c_goods_id`),
  CONSTRAINT `FK_cGoodsId_goodsId` FOREIGN KEY (`c_goods_id`) REFERENCES `goods` (`goods_id`),
  CONSTRAINT `FK_cUserId_uId` FOREIGN KEY (`c_user_id`) REFERENCES `af_user` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for doctor
-- ----------------------------
DROP TABLE IF EXISTS `doctor`;
CREATE TABLE `doctor` (
  `doctor_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '医生表唯一标识',
  `doctor_user` int(11) NOT NULL COMMENT '医生用户id',
  `doctor_label` varchar(100) DEFAULT NULL COMMENT '标签',
  `doctor_describe` varchar(255) NOT NULL COMMENT '医生简介',
  `doctor_img` varchar(100) NOT NULL COMMENT '医生照片',
  `doctor_license_img` varchar(100) NOT NULL COMMENT '执照路径',
  PRIMARY KEY (`doctor_id`),
  KEY `FK_doctorUser_uId` (`doctor_user`),
  CONSTRAINT `FK_doctorUser_uId` FOREIGN KEY (`doctor_user`) REFERENCES `af_user` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `goods_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `goods_name` varchar(50) NOT NULL COMMENT '商品名称',
  `goods_price` double NOT NULL COMMENT '商品价格',
  `goods_introduce` text COMMENT '商品介绍',
  `goods_img` varchar(100) NOT NULL COMMENT '有默认值 图片路径',
  `goods_sales` int(11) NOT NULL COMMENT '销量',
  `goods_publish_time` datetime NOT NULL COMMENT '发布时间',
  `goods_state` int(11) NOT NULL COMMENT '0下架/1上架/2删除',
  `goods_sends_address` varchar(255) NOT NULL COMMENT '发货地址',
  `goods_inventory` int(11) NOT NULL COMMENT '库存',
  `goods_label` varchar(50) DEFAULT NULL COMMENT '商品标签',
  `goods_user` int(11) NOT NULL COMMENT '商家id',
  `good_describe_small` varchar(255) NOT NULL COMMENT '商品简介',
  PRIMARY KEY (`goods_id`),
  KEY `FK_goodsUser_uId` (`goods_user`),
  CONSTRAINT `FK_goodsUser_uId` FOREIGN KEY (`goods_user`) REFERENCES `af_user` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for goods_comment
-- ----------------------------
DROP TABLE IF EXISTS `goods_comment`;
CREATE TABLE `goods_comment` (
  `gcom_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品评论id',
  `gcom_goods` int(11) NOT NULL COMMENT '商品id',
  `gcom_user` int(11) NOT NULL COMMENT '评论者id',
  `gcom_reply_comment_id` int(11) DEFAULT NULL COMMENT '回复的评论id(为空为初始评论)',
  `gcom_state` int(11) NOT NULL COMMENT '评论状态 1可见 2删除 ',
  `gcom_message` varchar(255) NOT NULL COMMENT '评论内容',
  `gcom_time` datetime NOT NULL COMMENT '评论时间',
  `gcom_level` double NOT NULL COMMENT '商品评级 0未评级，1~5等级',
  PRIMARY KEY (`gcom_id`),
  KEY `FK_gcomGoods_goodsId` (`gcom_goods`),
  KEY `FK_gcomUser_uId` (`gcom_user`),
  KEY `FK_gcomReplyCommentId_gcomID` (`gcom_reply_comment_id`),
  CONSTRAINT `FK_gcomGoods_goodsId` FOREIGN KEY (`gcom_goods`) REFERENCES `goods` (`goods_id`),
  CONSTRAINT `FK_gcomReplyCommentId_gcomID` FOREIGN KEY (`gcom_reply_comment_id`) REFERENCES `goods_comment` (`gcom_id`),
  CONSTRAINT `FK_gcomUser_uId` FOREIGN KEY (`gcom_user`) REFERENCES `af_user` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for health_data
-- ----------------------------
DROP TABLE IF EXISTS `health_data`;
CREATE TABLE `health_data` (
  `hd_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '资料id 唯一标识',
  `hd_title` varchar(50) NOT NULL COMMENT '资料标题',
  `hd_titleimg` varchar(100) NOT NULL COMMENT '资料标题图路径',
  `hd_describe` text NOT NULL COMMENT '资料描述',
  `hd_describe_small` varchar(255) NOT NULL COMMENT '健康资料简单介绍',
  `hd_user` int(11) NOT NULL COMMENT '发布者id',
  `hd_publish_time` datetime NOT NULL COMMENT '发布时间',
  `hd_state` int(11) NOT NULL COMMENT '状态 0不可见/1可见/2删除',
  PRIMARY KEY (`hd_id`),
  KEY `FK_hdUser_uId` (`hd_user`),
  CONSTRAINT `FK_hdUser_uId` FOREIGN KEY (`hd_user`) REFERENCES `af_user` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for health_data_collect
-- ----------------------------
DROP TABLE IF EXISTS `health_data_collect`;
CREATE TABLE `health_data_collect` (
  `hdc_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '资料收藏id唯一标识',
  `hdc_data_id` int(11) NOT NULL COMMENT '资料id',
  `hdc_user_id` int(11) NOT NULL COMMENT '收藏者id',
  `hdc_time` datetime NOT NULL COMMENT '收藏时间',
  PRIMARY KEY (`hdc_id`),
  KEY `FK_hdcDataId_uId` (`hdc_data_id`),
  KEY `FK_hdcUserId_uId` (`hdc_user_id`),
  CONSTRAINT `FK_hdcDataId_uId` FOREIGN KEY (`hdc_data_id`) REFERENCES `health_data` (`hd_id`),
  CONSTRAINT `FK_hdcUserId_uId` FOREIGN KEY (`hdc_user_id`) REFERENCES `af_user` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for im_chatlog
-- ----------------------------
DROP TABLE IF EXISTS `im_chatlog`;
CREATE TABLE `im_chatlog` (
  `ic_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `ic_from_id` int(11) NOT NULL COMMENT '发送者id',
  `ic_to_id` int(11) NOT NULL COMMENT '接受者id',
  `ic_group_id` int(11) DEFAULT NULL COMMENT '群组id 若为好友聊天则为空',
  `ic_content` text NOT NULL COMMENT '消息内容',
  `ic_sendTime` datetime NOT NULL COMMENT '发送时间',
  `ic_type` varchar(10) NOT NULL COMMENT '群聊(group)还是好友(friend)',
  `ic_status` int(11) NOT NULL COMMENT '状态:好友(接收者收到1/未收到0), 群组(发出者2/接收者收到1/未收到0)',
  PRIMARY KEY (`ic_id`),
  KEY `FK_icFromId_uId` (`ic_from_id`),
  KEY `FK_icToId_uId` (`ic_to_id`),
  CONSTRAINT `FK_icFromId_uId` FOREIGN KEY (`ic_from_id`) REFERENCES `af_user` (`u_id`),
  CONSTRAINT `FK_icToId_uId` FOREIGN KEY (`ic_to_id`) REFERENCES `af_user` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for im_friend
-- ----------------------------
DROP TABLE IF EXISTS `im_friend`;
CREATE TABLE `im_friend` (
  `if_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `if_ifg_id` int(11) NOT NULL COMMENT '用户分组id',
  `if_user_id` int(11) NOT NULL COMMENT '用户id,也就是这个用户是属于这个分组的',
  `if_nickName` varchar(20) DEFAULT NULL COMMENT '好友的昵称',
  PRIMARY KEY (`if_id`),
  KEY `FK_ifIfgId_ifgId` (`if_ifg_id`),
  KEY `FK_ifUserId_uId` (`if_user_id`),
  CONSTRAINT `FK_ifIfgId_ifgId` FOREIGN KEY (`if_ifg_id`) REFERENCES `im_friend_group` (`ifg_id`),
  CONSTRAINT `FK_ifUserId_uId` FOREIGN KEY (`if_user_id`) REFERENCES `af_user` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for im_friend_group
-- ----------------------------
DROP TABLE IF EXISTS `im_friend_group`;
CREATE TABLE `im_friend_group` (
  `ifg_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `ifg_user_id` int(11) NOT NULL COMMENT '所属用户id',
  `ifg_name` varchar(20) NOT NULL COMMENT '分组名称',
  PRIMARY KEY (`ifg_id`),
  KEY `FK_ifgUserId_uId` (`ifg_user_id`),
  CONSTRAINT `FK_ifgUserId_uId` FOREIGN KEY (`ifg_user_id`) REFERENCES `af_user` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for im_group
-- ----------------------------
DROP TABLE IF EXISTS `im_group`;
CREATE TABLE `im_group` (
  `ig_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '群号 唯一标识',
  `ig_groupname` varchar(20) NOT NULL COMMENT '群名字',
  `ig_avatar` varchar(100) NOT NULL COMMENT '群头像',
  `ig_notice` varchar(255) DEFAULT NULL COMMENT '群公告',
  `ig_creater_id` int(11) NOT NULL COMMENT '群主id/用户id',
  `ig_approval` int(11) NOT NULL COMMENT '是否开启验证 0不开启/1开启',
  PRIMARY KEY (`ig_id`),
  KEY `FK_igCreaterId_uId` (`ig_creater_id`),
  CONSTRAINT `FK_igCreaterId_uId` FOREIGN KEY (`ig_creater_id`) REFERENCES `af_user` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for im_group_user
-- ----------------------------
DROP TABLE IF EXISTS `im_group_user`;
CREATE TABLE `im_group_user` (
  `igu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `igu_group_id` int(11) NOT NULL COMMENT '群组id',
  `igu_user_id` int(11) NOT NULL COMMENT '用户id',
  `igu_nickName` varchar(20) DEFAULT NULL COMMENT '该用户的群昵称',
  PRIMARY KEY (`igu_id`),
  KEY `FK_iguGroupId_iguUserId` (`igu_group_id`),
  KEY `FK_iguUserId_iuId` (`igu_user_id`),
  CONSTRAINT `FK_iguGroupId_iguUserId` FOREIGN KEY (`igu_group_id`) REFERENCES `im_group` (`ig_id`),
  CONSTRAINT `FK_iguUserId_iuId` FOREIGN KEY (`igu_user_id`) REFERENCES `af_user` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for im_msgbox
-- ----------------------------
DROP TABLE IF EXISTS `im_msgbox`;
CREATE TABLE `im_msgbox` (
  `im_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '消息盒子id 唯一标识',
  `im_user_id` int(11) NOT NULL COMMENT '目标用户id',
  `im_from_id` int(11) DEFAULT NULL COMMENT '来源用户id 为空则为系统消息',
  `im_from_group` int(11) DEFAULT NULL COMMENT '来源用户选择的分组',
  `im_type` int(11) NOT NULL COMMENT '消息类型 ',
  `im_content` varchar(255) DEFAULT NULL COMMENT '消息描述',
  `im_remark` varchar(255) DEFAULT NULL COMMENT '附言',
  `im_href` varchar(255) DEFAULT NULL COMMENT '未知',
  `im_read` int(11) NOT NULL COMMENT '是否已读 0未读/1同意/2拒绝',
  `im_time` datetime NOT NULL COMMENT '消息添加时间',
  PRIMARY KEY (`im_id`),
  KEY `FK_imUserId_uId` (`im_user_id`),
  KEY `FK_imFromId_uId` (`im_from_id`),
  CONSTRAINT `FK_imFromId_uId` FOREIGN KEY (`im_from_id`) REFERENCES `af_user` (`u_id`),
  CONSTRAINT `FK_imUserId_uId` FOREIGN KEY (`im_user_id`) REFERENCES `af_user` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for order_goods_list
-- ----------------------------
DROP TABLE IF EXISTS `order_goods_list`;
CREATE TABLE `order_goods_list` (
  `oglist_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单商品列表唯一标识',
  `oglist_order` int(11) NOT NULL COMMENT '订单id',
  `oglist_goods` int(11) NOT NULL COMMENT '商品id',
  `oglist_buynumber` int(11) NOT NULL COMMENT '购买数量',
  PRIMARY KEY (`oglist_id`),
  KEY `FK_oglistOrder_orderId` (`oglist_order`),
  KEY `FK_oglistGoods_goodsId` (`oglist_goods`),
  CONSTRAINT `FK_oglistGoods_goodsId` FOREIGN KEY (`oglist_goods`) REFERENCES `goods` (`goods_id`),
  CONSTRAINT `FK_oglistOrder_orderId` FOREIGN KEY (`oglist_order`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=619582 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `order_user` int(11) NOT NULL COMMENT '买家id',
  `order_receive_adress` varchar(255) NOT NULL COMMENT '收货地址',
  `order_time` datetime NOT NULL COMMENT '下单时间',
  `order_state` int(11) NOT NULL COMMENT '状态 0未支付/1已支付/2删除',
  PRIMARY KEY (`order_id`),
  KEY `FK_ordersUser_uId` (`order_user`),
  CONSTRAINT `FK_ordersUser_uId` FOREIGN KEY (`order_user`) REFERENCES `af_user` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pet_circle
-- ----------------------------
DROP TABLE IF EXISTS `pet_circle`;
CREATE TABLE `pet_circle` (
  `pc_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '宠物圈id',
  `pc_title` varchar(50) NOT NULL COMMENT '宠物圈标题',
  `pc_title_img` varchar(100) NOT NULL COMMENT '宠物圈标题图片',
  `pc_describe` text NOT NULL COMMENT '宠物圈信息',
  `pc_describe_small` varchar(255) NOT NULL COMMENT '宠物圈信息简介',
  `pc_publish_time` datetime NOT NULL COMMENT '发布时间',
  `pc_user` int(11) NOT NULL COMMENT '发布者id',
  `pc_like_num` int(11) NOT NULL COMMENT '点赞数',
  `pc_collect_num` int(11) NOT NULL COMMENT '收藏数',
  `pc_state` int(11) NOT NULL COMMENT '状态 0不可见/1可见/2删除',
  PRIMARY KEY (`pc_id`),
  KEY `FK_pcUser_uId` (`pc_user`),
  CONSTRAINT `FK_pcUser_uId` FOREIGN KEY (`pc_user`) REFERENCES `af_user` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pet_circle_collect
-- ----------------------------
DROP TABLE IF EXISTS `pet_circle_collect`;
CREATE TABLE `pet_circle_collect` (
  `pcc_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '宠物圈收藏id唯一标识',
  `pcc_user_id` int(11) NOT NULL COMMENT '收藏者id',
  `pcc_pc_id` int(11) NOT NULL COMMENT '宠物圈id',
  `pcc_time` datetime NOT NULL COMMENT '收藏时间',
  PRIMARY KEY (`pcc_id`),
  KEY `FK_pccUserId_uId` (`pcc_user_id`),
  KEY `FK_pccPcId_pcId` (`pcc_pc_id`),
  CONSTRAINT `FK_pccPcId_pcId` FOREIGN KEY (`pcc_pc_id`) REFERENCES `pet_circle` (`pc_id`),
  CONSTRAINT `FK_pccUserId_uId` FOREIGN KEY (`pcc_user_id`) REFERENCES `af_user` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pet_circle_comment
-- ----------------------------
DROP TABLE IF EXISTS `pet_circle_comment`;
CREATE TABLE `pet_circle_comment` (
  `pcom_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '宠物圈评论id',
  `pcom_pet_circle` int(11) NOT NULL COMMENT '宠物圈id',
  `pcom_user` int(11) NOT NULL COMMENT '评论者id',
  `pcom_reply_comment_id` int(11) DEFAULT NULL COMMENT '回复评论id(为空为初始评论)',
  `pcom_state` int(11) NOT NULL COMMENT '评论状态 1可见/2删除 ',
  `pcom_builds` int(11) NOT NULL COMMENT '评论楼数',
  `pcom_message` varchar(255) NOT NULL COMMENT '评论内容',
  `pcom_time` datetime NOT NULL COMMENT '评论时间',
  PRIMARY KEY (`pcom_id`),
  KEY `FK_pcomPetCircle_pcId` (`pcom_pet_circle`),
  KEY `FK_pcomUser_uId` (`pcom_user`),
  KEY `FK_pcomReplyCommentId_pcomID` (`pcom_reply_comment_id`),
  CONSTRAINT `FK_pcomPetCircle_pcId` FOREIGN KEY (`pcom_pet_circle`) REFERENCES `pet_circle` (`pc_id`),
  CONSTRAINT `FK_pcomReplyCommentId_pcomID` FOREIGN KEY (`pcom_reply_comment_id`) REFERENCES `pet_circle_comment` (`pcom_id`),
  CONSTRAINT `FK_pcomUser_uId` FOREIGN KEY (`pcom_user`) REFERENCES `af_user` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pet_position
-- ----------------------------
DROP TABLE IF EXISTS `pet_position`;
CREATE TABLE `pet_position` (
  `pp_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一主键',
  `pp_lng` double NOT NULL COMMENT '经度',
  `pp_lat` double NOT NULL COMMENT '纬度',
  `pp_time` datetime NOT NULL COMMENT '记录时间',
  `pp_name` varchar(255) NOT NULL COMMENT '项圈标识',
  PRIMARY KEY (`pp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3399 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user_active_code
-- ----------------------------
DROP TABLE IF EXISTS `user_active_code`;
CREATE TABLE `user_active_code` (
  `uac_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '激活id,唯一标识',
  `uac_user_id` int(11) NOT NULL COMMENT '用户id',
  `uac_active_code` varchar(40) NOT NULL COMMENT '激活码',
  PRIMARY KEY (`uac_id`),
  KEY `FK_uacUserId_uId` (`uac_user_id`),
  CONSTRAINT `FK_uacUserId_uId` FOREIGN KEY (`uac_user_id`) REFERENCES `af_user` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user_authority
-- ----------------------------
DROP TABLE IF EXISTS `user_authority`;
CREATE TABLE `user_authority` (
  `ua_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户权限表id,唯一标识',
  `ua_user_id` int(11) NOT NULL COMMENT '用户id',
  `ua_authority` varchar(20) NOT NULL COMMENT '授权名称 PROTECT_PAGE用户/DOCTOR_PAGE医生/SHOP_PAGE商家/SUPER_PAGE管理员',
  PRIMARY KEY (`ua_id`),
  KEY `FK_uaUserId_uId` (`ua_user_id`),
  CONSTRAINT `FK_uaUserId_uId` FOREIGN KEY (`ua_user_id`) REFERENCES `af_user` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user_login_info
-- ----------------------------
DROP TABLE IF EXISTS `user_login_info`;
CREATE TABLE `user_login_info` (
  `uli_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `uli_user_id` int(11) NOT NULL COMMENT '用户id',
  `uli_login_time` datetime NOT NULL COMMENT '登陆时间',
  `uli_login_ip` varchar(25) NOT NULL COMMENT '登陆ip',
  `uli_login_address` varchar(50) NOT NULL COMMENT '登陆地点',
  PRIMARY KEY (`uli_id`),
  KEY `FK_uliUserId_uId` (`uli_user_id`),
  CONSTRAINT `FK_uliUserId_uId` FOREIGN KEY (`uli_user_id`) REFERENCES `af_user` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=547 DEFAULT CHARSET=utf8;
