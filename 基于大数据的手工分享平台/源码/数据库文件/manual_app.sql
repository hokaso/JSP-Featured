/*
SQLyog Ultimate v12.5.0 (64 bit)
MySQL - 5.7.25-log : Database - manual_app
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`manual_app` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `manual_app`;

/*Table structure for table `cart_items` */

DROP TABLE IF EXISTS `cart_items`;

CREATE TABLE `cart_items` (
  `cart_item_id` varchar(32) NOT NULL COMMENT '条目的id',
  `cart_item_count` int(11) DEFAULT NULL COMMENT '商品的数量',
  `goods_id` varchar(32) DEFAULT NULL COMMENT '所关联的商品',
  `cart_id` varchar(32) DEFAULT NULL COMMENT '所关联的购物车',
  `specs_id` varchar(32) DEFAULT NULL COMMENT '关联商品的规格id',
  PRIMARY KEY (`cart_item_id`),
  KEY `cart_items_ibfk_1` (`goods_id`),
  KEY `cart_items_ibfk_2` (`specs_id`),
  KEY `cart_items_ibfk_3` (`cart_id`),
  CONSTRAINT `cart_items_ibfk_1` FOREIGN KEY (`goods_id`) REFERENCES `mall_goods` (`goods_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cart_items_ibfk_2` FOREIGN KEY (`specs_id`) REFERENCES `goods_specs` (`specs_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cart_items_ibfk_3` FOREIGN KEY (`cart_id`) REFERENCES `mall_cart` (`cart_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='购物车条目表';

/*Data for the table `cart_items` */

insert  into `cart_items`(`cart_item_id`,`cart_item_count`,`goods_id`,`cart_id`,`specs_id`) values 
('B001E12530B548768D4F057FA1DBCA09',1,'qweqwagg','7E70A09305C84FBD93C14212991C545F','gaerg23r23ewd'),
('F62C11917FBC42469BB1093C9FD26996',1,'qweqwagg','7E70A09305C84FBD93C14212991C545F','afgergergegegef');

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `c_id` varchar(128) NOT NULL COMMENT '评论ID',
  `d_id` varchar(128) NOT NULL COMMENT '动态ID',
  `u_id` varchar(128) NOT NULL COMMENT '用户ID',
  `content` varchar(255) DEFAULT NULL COMMENT '评论内容',
  `time` datetime DEFAULT NULL COMMENT '评论时间',
  PRIMARY KEY (`c_id`),
  KEY `u_id` (`u_id`) USING BTREE,
  KEY `comment_idfk_2` (`d_id`),
  CONSTRAINT `comment_idfk_1` FOREIGN KEY (`u_id`) REFERENCES `customer` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_idfk_2` FOREIGN KEY (`d_id`) REFERENCES `dynamic` (`d_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户评论表';

/*Data for the table `comment` */

insert  into `comment`(`c_id`,`d_id`,`u_id`,`content`,`time`) values 
('15534558536730.08585156527079363','666','2','sada','2019-03-24 19:30:53'),
('15555595068189.171204936830154','116','1','啊啊啊','2019-04-18 11:51:46'),
('15555595087209.417594795532915','116','1','','2019-04-18 11:51:48'),
('15556633233138.176869924840968','116','1','嗨','2019-04-19 16:42:03'),
('15556634096344.367546197125918','1554625360552','1','哈哈哈哈','2019-04-19 16:43:29'),
('15556773415313.4714674197457307','1555591169276','1','嗨','2019-04-19 20:35:41'),
('15556774175583.715703929539832','1554625360552','1','有用吗','2019-04-19 20:36:57');

/*Table structure for table `customer` */

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `u_id` varchar(128) NOT NULL COMMENT '用户ID',
  `name` varchar(128) DEFAULT NULL COMMENT '用户名',
  `headPicPath` varchar(128) DEFAULT '/null' COMMENT '头像图片地址',
  `phonenumber` varchar(128) DEFAULT NULL COMMENT '手机号',
  `password` varchar(128) DEFAULT NULL COMMENT '密码',
  `gender` varchar(128) DEFAULT NULL COMMENT '性别',
  `location` varchar(255) DEFAULT NULL COMMENT '地址',
  `signature` varchar(255) DEFAULT NULL COMMENT '签名',
  `cancellationCount` int(11) DEFAULT '0' COMMENT '取消订单次数',
  `order_consigneeAddress` varchar(500) DEFAULT NULL COMMENT '默认收货地址',
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

/*Data for the table `customer` */

insert  into `customer`(`u_id`,`name`,`headPicPath`,`phonenumber`,`password`,`gender`,`location`,`signature`,`cancellationCount`,`order_consigneeAddress`) values 
('1','李一','testImages/headpic/1555575669966.png','1','1','男','肇庆','真开心啊',12,'肇庆学院'),
('1555677310123',NULL,'/null','4','4',NULL,NULL,NULL,0,NULL),
('2','王二','testImages/zhangsan.jpg','2','2','女','福建','怎么回事，小老弟',3,'肇庆学院2'),
('3','张三','testImages/headpic/1555577081615.png','3','3','男','广州','哈哈哈哈或哈哈哈哈或或或或或或或或或或或或',0,'肇庆学院'),
('gtrs','赵四','be','avrver','qqqqqqqqqq','男','vrv','fesrver',3,'ferfw');

/*Table structure for table `dynamic` */

DROP TABLE IF EXISTS `dynamic`;

CREATE TABLE `dynamic` (
  `d_id` varchar(128) NOT NULL COMMENT '动态ID',
  `u_id` varchar(128) NOT NULL COMMENT '用户ID',
  `title` varchar(128) DEFAULT NULL COMMENT '动态标题',
  `content` text COMMENT '动态内容',
  `release_date` varchar(128) DEFAULT NULL COMMENT '发布日期',
  `category` varchar(128) DEFAULT NULL COMMENT '社区分类',
  `total_like` int(11) DEFAULT '0' COMMENT '动态受到的总赞数',
  `total_comment` int(11) DEFAULT '0' COMMENT '动态产生的总评论数',
  `goods_id` varchar(32) DEFAULT NULL COMMENT '动态对应的商品ID',
  `total_benefit` int(11) DEFAULT '0' COMMENT '动态产生的总利润',
  `dynamic_rank` int(11) DEFAULT NULL,
  PRIMARY KEY (`d_id`,`u_id`),
  KEY `d_id` (`d_id`),
  KEY `dynamic_ibfk_1` (`u_id`),
  KEY `dynamic_ibfk_2` (`category`),
  CONSTRAINT `dynamic_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `customer` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `dynamic_ibfk_2` FOREIGN KEY (`category`) REFERENCES `goods_category` (`ca_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='动态信息表';

/*Data for the table `dynamic` */

insert  into `dynamic`(`d_id`,`u_id`,`title`,`content`,`release_date`,`category`,`total_like`,`total_comment`,`goods_id`,`total_benefit`,`dynamic_rank`) values 
('112','1','关于皮艺的第01条消息','http://tieba.baidu.com/p/3022663403','2019-03-22 13:05:53.000000','leather',0,0,'qweqwagg',0,NULL),
('113','1','关于皮艺的第02条消息','疯马皮长夹。12卡位2钞夹，边缘带削薄封边。有兴趣加276****** 交流。价格便宜。接受各种定制','2019-03-22 16:18:41.000000','leather',0,0,'qweqwagg',0,NULL),
('114','1','关于布艺的第02条消息','布艺品的分类方法有很多，如按使用功能、空间、设计特色、加工工艺等分类。不管用什么材料和加工工艺制作的布艺品，最重要的是用在什么地方和做什么用，所以我们通常把布艺品按照使用功能和空间分类。','2019-03-22 22:57:41.000000','fabric',0,0,'qweqwagg',21,NULL),
('115','1','关于布艺的第03条消息','解答这些生活日常用品不仅美观大方，而且增强了布料的强度和耐磨能力。到了今天，布艺有了另一种含义，指以布为主料，经过艺术加工，达到一定的艺术效果，满足人们的生活需求的制品。当然，传统布艺手工和现代布艺家具之间设有严格的界限，传统布艺也可以自然地融入现代装饰中。','2019-03-24 00:06:51.000000','fabric',0,0,'qweqwagg',0,NULL),
('116','1','关于编织的第01条消息','编织，毛衣便是最基本的入门。现在，开始来编织毛衣吧。','2019-03-24 21:56:23.000000','weave',1,3,'qweqwagg',4,NULL),
('117','1','关于布艺的第04条消息','布艺在现代家庭中越来越受到人们的青睐，如果说家庭使用功能的装修为“硬饰”，而布艺作为“软饰”在家居中更独具魅力，它柔化了室内空间生硬的线条，赋予居室一种温馨的格调：或清新自然、或典雅华丽、或情调浪漫。在布艺风格上，可以很明显地感觉到各个品牌的特色，但是却无法简单地用欧式、中式抑或是其他风格来概括，各种风格互相借鉴、融合，赋予了布艺不羁的性格。最直接的影响是它对于家居氛围的塑造作用加强了，因为采用的元素比较广泛，让它跟很多不同风格的家居都可以搭配，而且会有完全不同的感觉。','2019-03-25 09:54:28.000000','fabric',0,0,'qweqwagg',21,NULL),
('1554624619474','1','关于布艺的第05条消息','2、 厨房类—用于厨房的系列产品，包括围裙、袖套、厨帽、隔热手套、隔热垫、隔热手柄套、微波炉套、饭煲套、冰箱套、厨用窗帘、便当袋、保鲜纸袋、擦手巾、茶巾等。','2019-04-07 16:10:19.000000','fabric',0,0,'qzaaaaa',0,NULL),
('1554624962935','1','关于布艺的第06条消息','5、 垫子类—用于客厅和起居室以及其他休闲区域的各类坐垫，其配套的形式和设计手法不胜枚举。','2019-04-07 16:11:37.000000','fabric',0,0,'qzaaaaa',0,NULL),
('1554625360552','2','关于布艺的第07条消息','3、皮边边油教程','2019-04-07 16:16:02.000000','fabric',1,0,'qzaaaaa',7,NULL),
('1555591169276','3','刺绣呀呀01','我是刺绣','2019-04-18 20:39:29','embroidery',1,0,'',0,0),
('1555677431123','1','我是标题','陌陌陌陌','2019-04-19 20:37:11','fabric',0,0,'',0,0),
('222','3','关于皮艺的第03条消息','伴随人们生活水平的提高，单纯的功能性空间已满足不了人们的精神追求，人们用“家居配饰” “软装饰”等词汇去努力描述家居空间所要营造出的氛围的重要性，那么更为精确的一词应该叫家居陈设。家居陈设是指在某个空间内将家具陈设、家居配饰、家居软装饰等元素通过完美设计手法将所要表达的空间意境呈现在整个空间内，使得整个空间满足人们的物质追求和精神追求。','2019-04-07 16:22:40.000000','leather',0,0,'',0,NULL),
('333','2','关于布艺的第08条消息','　　诚和创立于1939年，是一家专门从事染色工艺的研发与培训以及皮革材料的研发、生产与销售的公司。它于1955年在日本开设了第一家染色工艺培训班，在之后的半个多世纪，其培训范围逐步扩展至其他皮革工艺职业培训及兴趣培训。如今培训班的毕业生遍布日本全国各地。','2019-04-07 22:10:43.000000','fabric',0,0,'',0,NULL),
('444','1','关于皮艺的第04条消息','  秋末冬初，天气逐渐转冷。围上一条与众不同的披肩，既漂亮又保暖。“秋菱”披肩款式来自外网，为了能够完美再现原版披肩的轻盈美丽，特选用了进口的云马和16#蕾丝，用针：可乐2.3 用线链接花之语时尚编织纱线店   特录制详细的视频教程。图解及视频教程观看链接：http://mp.weixin.qq.com/s/HL9gtCXLKDwgav5Evbb7Jw ','2019-03-07 20:37:41.000000','leather',0,0,'qweqwagg',0,NULL),
('555','3','关于编织的第02条消息','4、皮边蜡封教程','2019-03-19 20:37:37.000000','weave',0,0,'qweqwagg',21,NULL),
('666','3','关于编织的第03条消息','大城市的饰品销售方式基本以公司直营店，加盟店以及小饰品店为主；中小城市的饰品消费由于受收入水平等方面的限制，仍然以鲜花店、礼品店的形式销售饰品，其产品一般都是较普通的饰品，产品的档次偏低。随着中国二三线城市的发展，这些城乡居民的饰品消费需求也会逐渐跟上大城市的步伐，这对广大饰品企业来说更是难得的发展机遇。','2019-03-07 21:30:58.000000','weave',1,1,'qweqwagg',4,NULL);

/*Table structure for table `favorite` */

DROP TABLE IF EXISTS `favorite`;

CREATE TABLE `favorite` (
  `u_id` varchar(128) NOT NULL COMMENT '用户ID',
  `weave` int(128) NOT NULL DEFAULT '0' COMMENT '用户种类01',
  `paper` int(128) NOT NULL DEFAULT '0' COMMENT '用户种类02',
  `ornaments` int(128) NOT NULL DEFAULT '0' COMMENT '用户种类03',
  `leather` int(128) NOT NULL DEFAULT '0' COMMENT '用户种类04',
  `fabric` int(128) NOT NULL DEFAULT '0' COMMENT '用户种类05',
  `embroidery` int(128) NOT NULL DEFAULT '0' COMMENT '用户种类06',
  `others` int(128) NOT NULL DEFAULT '0' COMMENT '用户种类07',
  `pri_total_like` int(128) NOT NULL DEFAULT '0' COMMENT '用户前总like数',
  `u_type` varchar(128) NOT NULL DEFAULT 'weave' COMMENT '用户类型',
  PRIMARY KEY (`u_id`),
  CONSTRAINT `favorite_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `customer` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户大数据分析情况存储表';

/*Data for the table `favorite` */

insert  into `favorite`(`u_id`,`weave`,`paper`,`ornaments`,`leather`,`fabric`,`embroidery`,`others`,`pri_total_like`,`u_type`) values 
('1',19,0,0,3,8,1,0,10,'weave'),
('1555677310123',0,0,0,0,0,0,0,0,'weave'),
('2',6,0,0,0,0,0,0,0,'weave'),
('3',10,0,0,0,0,0,0,0,'weave');

/*Table structure for table `follow_fan` */

DROP TABLE IF EXISTS `follow_fan`;

CREATE TABLE `follow_fan` (
  `u_id` varchar(128) NOT NULL COMMENT '被关注者的用户ID',
  `fan_id` varchar(128) NOT NULL COMMENT '关注者的用户ID',
  PRIMARY KEY (`u_id`,`fan_id`),
  KEY `follow_fan_ibfk_2` (`fan_id`),
  CONSTRAINT `follow_fan_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `customer` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `follow_fan_ibfk_2` FOREIGN KEY (`fan_id`) REFERENCES `customer` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户关注情况表';

/*Data for the table `follow_fan` */

insert  into `follow_fan`(`u_id`,`fan_id`) values 
('2','1'),
('3','1'),
('1','2'),
('1','3'),
('2','3');

/*Table structure for table `goods_category` */

DROP TABLE IF EXISTS `goods_category`;

CREATE TABLE `goods_category` (
  `ca_id` int(11) NOT NULL COMMENT '商品种类编号',
  `ca_name` varchar(50) NOT NULL COMMENT '商品种类名',
  PRIMARY KEY (`ca_id`),
  KEY `ca_name` (`ca_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品的种类编码和名字对应表';

/*Data for the table `goods_category` */

insert  into `goods_category`(`ca_id`,`ca_name`) values 
(6,'embroidery'),
(5,'fabric'),
(4,'leather'),
(3,'ornaments'),
(7,'others'),
(2,'paper'),
(1,'weave');

/*Table structure for table `goods_comment` */

DROP TABLE IF EXISTS `goods_comment`;

CREATE TABLE `goods_comment` (
  `goods_comment_id` varchar(32) NOT NULL COMMENT '商品评论的id',
  `goods_comment_content` varchar(1000) DEFAULT NULL COMMENT '评论内容',
  `goods_comment_time` varchar(60) DEFAULT NULL COMMENT '评价的时间',
  `goods_degree` int(11) DEFAULT NULL COMMENT '商品满意度：1->差评；2->中评；3->差评',
  `u_id` varchar(32) DEFAULT NULL COMMENT '顾客id',
  `order_id` varchar(32) DEFAULT NULL COMMENT '订单id',
  `goods_id` varchar(32) DEFAULT NULL COMMENT '商品的id',
  `specs_id` varchar(32) DEFAULT NULL COMMENT '所购买的商品规格',
  PRIMARY KEY (`goods_comment_id`),
  KEY `FK_goods_comment` (`goods_id`),
  CONSTRAINT `FK_goods_comment` FOREIGN KEY (`goods_id`) REFERENCES `mall_goods` (`goods_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品评论情况表';

/*Data for the table `goods_comment` */

insert  into `goods_comment`(`goods_comment_id`,`goods_comment_content`,`goods_comment_time`,`goods_degree`,`u_id`,`order_id`,`goods_id`,`specs_id`) values 
('091AF8E44BEC4035AEFFF0A68CE66AF8','1','2019-04-13 05:10:13',0,'1','2E156E530FE94BC9A9169C62F3ECC512','qweqwagg','afgergergegegef'),
('412736095BB14C79B6FF6EFCEDC280C4','1','2019-04-13 05:10:13',0,'1','2E156E530FE94BC9A9169C62F3ECC512','qweqwagg','qwqwqw'),
('6847044BFEEF42359AF5CD10B07CAD11','1','2019-04-13 05:10:13',0,'1','2E156E530FE94BC9A9169C62F3ECC512','qweqwagg','gaerg23r23ewd'),
('79B8BF6FDC434681BE8C8D9126316177','好用','2019-04-13 04:00:27',0,'1','2E156E530FE94BC9A9169C62F3ECC512','qweqwagg','gaerg23r23ewd'),
('BD9D66AC4EF046A2B2443026329DFFDC','333','2019-04-13 03:47:34',0,'1','2E156E530FE94BC9A9169C62F3ECC512','qweqwagg','afgergergegegef'),
('F5499BF85BB74F9BB6CA54893A279537','233','2019-04-13 03:47:34',0,'1','2E156E530FE94BC9A9169C62F3ECC512','qweqwagg','gaerg23r23ewd'),
('FE076964721C474B90BC611764294992','不起球','2019-04-13 04:00:27',0,'1','2E156E530FE94BC9A9169C62F3ECC512','qweqwagg','afgergergegegef'),
('hsthdhytjjtyheyt','还可以','2019-03-28 18:22:30',1,'1','qqq',NULL,'aaa'),
('nbdhsegrtrhythtyj','very good','2019-03-25 18:22:30',1,'1','qqq',NULL,'aaa');

/*Table structure for table `goods_intr_comm_img` */

DROP TABLE IF EXISTS `goods_intr_comm_img`;

CREATE TABLE `goods_intr_comm_img` (
  `img_id` varchar(32) NOT NULL COMMENT '图片id',
  `img_path` varchar(200) DEFAULT NULL COMMENT '图片的路径',
  `img_order` int(11) DEFAULT NULL COMMENT '图片的顺序',
  `img_type` int(11) DEFAULT NULL COMMENT '1表示商品介绍的图片，2表示评论的图片',
  `goods_id` varchar(32) DEFAULT NULL COMMENT '归属商品',
  `goods_comment_id` varchar(32) DEFAULT NULL COMMENT '商品评论的id',
  PRIMARY KEY (`img_id`),
  KEY `FK_goods_introduce` (`goods_id`),
  KEY `FK_goods_intr_comm_img` (`goods_comment_id`),
  CONSTRAINT `FK_goods_intr_comm_img` FOREIGN KEY (`goods_comment_id`) REFERENCES `goods_comment` (`goods_comment_id`) ON DELETE SET NULL,
  CONSTRAINT `FK_goods_intr_comm_img_goods` FOREIGN KEY (`goods_id`) REFERENCES `mall_goods` (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品评论图片信息表';

/*Data for the table `goods_intr_comm_img` */

insert  into `goods_intr_comm_img`(`img_id`,`img_path`,`img_order`,`img_type`,`goods_id`,`goods_comment_id`) values 
('grtshtyejrutuktiu','goodsImages/bianzhiImg/introImg/234567.jpg',3,1,'qweqwagg',NULL),
('htyhtyjhryury','goodsImages/bianzhiImg/introImg/345678.jpg',2,1,'qweqwagg',NULL),
('rhgreytjuy','goodsImages/bianzhiImg/introImg/123456.jpg',1,1,'qweqwagg',NULL),
('vvaaaaa1','goodsImages/zhiyiImg/introImg/1a.jpg',1,1,'qzaaaaa',NULL),
('vvaaaaa10','goodsImages/zhiyiImg/introImg/10a.jpg',10,1,'qzaaaaa',NULL),
('vvaaaaa11','goodsImages/zhiyiImg/introImg/11a.jpg',11,1,'qzaaaaa',NULL),
('vvaaaaa12','goodsImages/zhiyiImg/introImg/12a.jpg',12,1,'qzaaaaa',NULL),
('vvaaaaa13','goodsImages/zhiyiImg/introImg/13a.jpg',13,1,'qzaaaaa',NULL),
('vvaaaaa14','goodsImages/zhiyiImg/introImg/14a.jpg',14,1,'qzaaaaa',NULL),
('vvaaaaa2','goodsImages/zhiyiImg/introImg/2a.jpg',2,1,'qzaaaaa',NULL),
('vvaaaaa3','goodsImages/zhiyiImg/introImg/3a.jpg',3,1,'qzaaaaa',NULL),
('vvaaaaa4','goodsImages/zhiyiImg/introImg/4a.jpg',4,1,'qzaaaaa',NULL),
('vvaaaaa5','goodsImages/zhiyiImg/introImg/5a.jpg',5,1,'qzaaaaa',NULL),
('vvaaaaa6','goodsImages/zhiyiImg/introImg/6a.jpg',6,1,'qzaaaaa',NULL),
('vvaaaaa7','goodsImages/zhiyiImg/introImg/7a.jpg',7,1,'qzaaaaa',NULL),
('vvaaaaa8','goodsImages/zhiyiImg/introImg/8a.jpg',8,1,'qzaaaaa',NULL),
('vvaaaaa9','goodsImages/zhiyiImg/introImg/9a.jpg',9,1,'qzaaaaa',NULL),
('vvbbbbb1','goodsImages/shipin/introImg/1bb.jpg',1,1,'qzbbbbb',NULL),
('vvbbbbb2','goodsImages/shipin/introImg/2bb.jpg',2,1,'qzbbbbb',NULL),
('vvbbbbb3','goodsImages/shipin/introImg/3bb.jpg',3,1,'qzbbbbb',NULL),
('vvbbbbb4','goodsImages/shipin/introImg/4bb.jpg',4,1,'qzbbbbb',NULL),
('vvbbbbb5','goodsImages/shipin/introImg/5bb.jpg',5,1,'qzbbbbb',NULL),
('vvbbbbb6','goodsImages/shipin/introImg/6bb.jpg',6,1,'qzbbbbb',NULL),
('vvbbbbb7','goodsImages/shipin/introImg/7bb.jpg',7,1,'qzbbbbb',NULL),
('vvbbbbb8','goodsImages/shipin/introImg/8bb.jpg',8,1,'qzbbbbb',NULL),
('vvbbbbb9','goodsImages/shipin/introImg/9bb.jpg',9,1,'qzbbbbb',NULL),
('vvbcccc1','goodsImages/piyi/introImg/1c.jpg',1,1,'qzccccc',NULL),
('vvbcccc10','goodsImages/piyi/introImg/10c.jpg',10,1,'qzccccc',NULL),
('vvbcccc11','goodsImages/piyi/introImg/11c.jpg',11,1,'qzccccc',NULL),
('vvbcccc12','goodsImages/piyi/introImg/12c.jpg',12,1,'qzccccc',NULL),
('vvbcccc13','goodsImages/piyi/introImg/13c.jpg',13,1,'qzccccc',NULL),
('vvbcccc14','goodsImages/piyi/introImg/14c.jpg',14,1,'qzccccc',NULL),
('vvbcccc2','goodsImages/piyi/introImg/2c.jpg',2,1,'qzccccc',NULL),
('vvbcccc3','goodsImages/piyi/introImg/3c.jpg',3,1,'qzccccc',NULL),
('vvbcccc4','goodsImages/piyi/introImg/4c.jpg',4,1,'qzccccc',NULL),
('vvbcccc5','goodsImages/piyi/introImg/5c.jpg',5,1,'qzccccc',NULL),
('vvbcccc6','goodsImages/piyi/introImg/6c.jpg',6,1,'qzccccc',NULL),
('vvbcccc7','goodsImages/piyi/introImg/7c.jpg',7,1,'qzccccc',NULL),
('vvbcccc8','goodsImages/piyi/introImg/8c.jpg',8,1,'qzccccc',NULL),
('vvbcccc9','goodsImages/piyi/introImg/9c.jpg',9,1,'qzccccc',NULL),
('vvbddddd1','goodsImages/buyi/introImg/1d.jpg',1,1,'qzddddd',NULL),
('vvbddddd2','goodsImages/buyi/introImg/2d.jpg',2,1,'qzddddd',NULL),
('vvbddddd3','goodsImages/buyi/introImg/3d.jpg',3,1,'qzddddd',NULL),
('vvbddddd4','goodsImages/buyi/introImg/4d.jpg',4,1,'qzddddd',NULL),
('vveeeee1','goodsImages/cixiu/introImg/1e.jpg',1,1,'qzeeeee',NULL),
('vveeeee10','goodsImages/cixiu/introImg/11e.jpg',10,10,'qzeeeee',NULL),
('vveeeee11','goodsImages/cixiu/introImg/12e.jpg',11,11,'qzeeeee',NULL),
('vveeeee2','goodsImages/cixiu/introImg/2e.jpg',2,2,'qzeeeee',NULL),
('vveeeee3','goodsImages/cixiu/introImg/3e.jpg',3,3,'qzeeeee',NULL),
('vveeeee4','goodsImages/cixiu/introImg/5e.jpg',4,4,'qzeeeee',NULL),
('vveeeee5','goodsImages/cixiu/introImg/6e.jpg',5,5,'qzeeeee',NULL),
('vveeeee6','goodsImages/cixiu/introImg/7e.jpg',6,6,'qzeeeee',NULL),
('vveeeee7','goodsImages/cixiu/introImg/8e.jpg',7,7,'qzeeeee',NULL),
('vveeeee8','goodsImages/cixiu/introImg/9e.jpg',8,8,'qzeeeee',NULL),
('vveeeee9','goodsImages/cixiu/introImg/10e.jpg',9,9,'qzeeeee',NULL);

/*Table structure for table `goods_specs` */

DROP TABLE IF EXISTS `goods_specs`;

CREATE TABLE `goods_specs` (
  `specs_id` varchar(32) NOT NULL COMMENT 'id',
  `goods_id` varchar(32) DEFAULT NULL COMMENT '商品的id',
  `specs_attrs` varchar(300) DEFAULT NULL COMMENT '商品的规格内容，以json串的形式保存',
  `specs_stock` int(11) DEFAULT NULL COMMENT '一规格相对应的库存量',
  `specs_price` double DEFAULT NULL COMMENT '某一规格相对应的价格',
  `specs_img` varchar(1000) DEFAULT NULL COMMENT '某一规格对应的图片',
  `specs_create_time` varchar(50) DEFAULT NULL COMMENT '创建时间',
  `specs_update_time` varchar(50) DEFAULT NULL COMMENT '更新时间',
  `specs_perchase_price` double DEFAULT NULL COMMENT '进货价',
  PRIMARY KEY (`specs_id`),
  KEY `FK_goods_specs` (`goods_id`),
  CONSTRAINT `FK_goods_specs` FOREIGN KEY (`goods_id`) REFERENCES `mall_goods` (`goods_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品规格信息表';

/*Data for the table `goods_specs` */

insert  into `goods_specs`(`specs_id`,`goods_id`,`specs_attrs`,`specs_stock`,`specs_price`,`specs_img`,`specs_create_time`,`specs_update_time`,`specs_perchase_price`) values 
('afgergergegegef','qweqwagg','粉红',14,5.21,'goodsImages/bianzhiImg/specsImg/7.jpg',NULL,NULL,NULL),
('efwefe','qweqwagg','黑色',32,5.21,'goodsImages/bianzhiImg/specsImg/2.jpg',NULL,NULL,NULL),
('fefqefqrfq','qweqwagg','浅绿',21,5.21,'goodsImages/bianzhiImg/specsImg/4.jpg',NULL,NULL,NULL),
('gaerg23r23ewd','qweqwagg','桔色',32,5.21,'goodsImages/bianzhiImg/specsImg/5.jpg',NULL,NULL,NULL),
('qwqwqw','qweqwagg','朱红',10,5.21,'goodsImages/bianzhiImg/specsImg/6.jpg',NULL,NULL,NULL),
('r233r4','qweqwagg','乳白',39,5.21,'goodsImages/bianzhiImg/specsImg/1.jpg',NULL,NULL,NULL),
('rza1','qzaaaaa','初学套餐',34,13.43,'goodsImages/zhiyiImg/specsImg/1aa.jpg',NULL,NULL,NULL),
('rza2','qzaaaaa','学生套餐 ',45,18.57,'goodsImages/zhiyiImg/specsImg/2aa.jpg',NULL,NULL,NULL),
('rza3','qzaaaaa','畅玩套餐',23,29.43,'goodsImages/zhiyiImg/specsImg/3aa.jpg',NULL,NULL,NULL),
('rza4','qzaaaaa','专业教学套餐',23,39.3,'goodsImages/zhiyiImg/specsImg/4aa.jpg',NULL,NULL,NULL),
('rza5','qzaaaaa','超划算大礼包',34,49.18,'goodsImages/zhiyiImg/specsImg/5aa.jpg',NULL,NULL,NULL),
('rza6','qzaaaaa','超豪华套餐',67,77.03,'goodsImages/zhiyiImg/specsImg/6aa.jpg',NULL,NULL,NULL),
('rza7','qzaaaaa','体验套餐',23,8.39,'goodsImages/zhiyiImg/specsImg/7aa.jpg',NULL,NULL,NULL),
('rzb1','qzbbbbb','白色圆形',45,1.5,'goodsImages/shipin/specsImg/2asasadsdasdadsadasd.jpg',NULL,NULL,0),
('rzb2','qzbbbbb','红色圆形',46,1.69,'goodsImages/shipin/specsImg/2asasadsdasdadsadasd.jpg',NULL,NULL,0),
('rzb3','qzbbbbb','白色水滴形',32,8.22,'goodsImages/shipin/specsImg/2asasadsdasdadsadasd.jpg',NULL,NULL,0),
('rzc1','qzccccc','红色河马',34,25,'goodsImages/piyi/specsImg/3ccccccccc.jpg',NULL,NULL,NULL),
('rzc2','qzccccc','正黄猫头鹰',31,25,'goodsImages/piyi/specsImg/3ccccccccc.jpg',NULL,NULL,NULL),
('rzc3','qzccccc','豌豆绿小狗',34,25,'goodsImages/piyi/specsImg/3ccccccccc.jpg',NULL,NULL,NULL),
('rzc4','qzccccc','大象灰企鹅',45,25,'goodsImages/piyi/specsImg/3ccccccccc.jpg',NULL,NULL,NULL),
('rzd1','qzddddd','大红',23,20,'goodsImages/buyi/specsImg/1dd.jpg',NULL,NULL,NULL),
('rzd2','qzddddd','黄色',34,20,'goodsImages/buyi/specsImg/2dd.jpg',NULL,NULL,NULL),
('rzd3','qzddddd','绿色',44,20,'goodsImages/buyi/specsImg/3dd.jpg',NULL,NULL,NULL),
('rzd4','qzddddd','湖蓝',56,20,'goodsImages/buyi/specsImg/4dd.jpg',NULL,NULL,NULL),
('rzd5','qzddddd','米白',13,20,'goodsImages/buyi/specsImg/5dd.jpg',NULL,NULL,NULL),
('rzd6','qzddddd','黑色',34,20,'goodsImages/buyi/specsImg/6dd.jpg',NULL,NULL,NULL),
('rze1','qzeeeee','套餐1',34,42,'goodsImages/cixiu/specsImg/1ee.jpg',NULL,NULL,NULL),
('rze2','qzeeeee','套餐2',23,58,'goodsImages/cixiu/specsImg/2ee.jpg',NULL,NULL,NULL),
('rze3','qzeeeee','套餐3',43,99,'goodsImages/cixiu/specsImg/3ee.jpg',NULL,NULL,NULL),
('rze4','qzeeeee','套餐4',12,45,'goodsImages/cixiu/specsImg/4ee.jpg',NULL,NULL,NULL),
('rze5','qzeeeee','麻色帆布',32,19.9,'goodsImages/cixiu/specsImg/5ee.jpg',NULL,NULL,NULL),
('rze6','qzeeeee','白色帆布',23,19.9,'goodsImages/cixiu/specsImg/6ee.jpg',NULL,NULL,NULL);

/*Table structure for table `liked` */

DROP TABLE IF EXISTS `liked`;

CREATE TABLE `liked` (
  `d_id` varchar(128) NOT NULL COMMENT '收到赞的动态的ID',
  `u_id` varchar(128) NOT NULL COMMENT '点赞用户的ID',
  PRIMARY KEY (`d_id`,`u_id`),
  KEY `d_id` (`d_id`),
  KEY `liked_ibfk_1` (`u_id`),
  CONSTRAINT `liked_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `customer` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `liker_ibfk_2` FOREIGN KEY (`d_id`) REFERENCES `dynamic` (`d_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='点赞情况表';

/*Data for the table `liked` */

insert  into `liked`(`d_id`,`u_id`) values 
('116','1'),
('1554625360552','1'),
('1555591169276','1'),
('666','1');

/*Table structure for table `mall_cart` */

DROP TABLE IF EXISTS `mall_cart`;

CREATE TABLE `mall_cart` (
  `cart_id` varchar(32) NOT NULL COMMENT '购物车的ID',
  `u_id` varchar(32) DEFAULT NULL COMMENT '所关联的用户',
  PRIMARY KEY (`cart_id`),
  KEY `mall_cart_ibfk_1` (`u_id`),
  CONSTRAINT `mall_cart_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `customer` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='购物车表';

/*Data for the table `mall_cart` */

insert  into `mall_cart`(`cart_id`,`u_id`) values 
('25643BCEF91942FFA034BD57D2942E3B','1'),
('25FA22AB9FEB4D0A8861898720C63063','1'),
('2AF05E1928594ADD9ACB5C55F1CAE524','1'),
('2B784315662C402594AC5EE2AC68296E','1'),
('36E9A081DA004510B2CBB073A34B24AC','1'),
('470353F69C594221A16E0C9094559860','1'),
('7153063A907140ECB5CA6A2C2855EB73','1'),
('7E70A09305C84FBD93C14212991C545F','1'),
('98461681BB0449C093296FC387D6AF98','1'),
('9F566411E35342C381AE50190F7443E1','1'),
('B5A2C1F4D82B48479C87C592BB415ED0','1'),
('C65B077394F748E2B578624BBFB305C5','1'),
('D88914CBE6554BD69D0225096679ADB5','1'),
('E7D4E0FB8E994C53B5E3E79F710B4D1E','1'),
('E8F14DAEAE494013AD3E19ACE661D45F','1'),
('ED8FEEA2A81445069E1AE10865C66F42','1');

/*Table structure for table `mall_collection` */

DROP TABLE IF EXISTS `mall_collection`;

CREATE TABLE `mall_collection` (
  `mall_collection_id` varchar(32) NOT NULL COMMENT '收藏信息ID',
  `goods_id` varchar(32) NOT NULL COMMENT '被收藏的商品ID',
  `u_id` varchar(32) NOT NULL COMMENT '收藏用户的ID',
  PRIMARY KEY (`mall_collection_id`),
  KEY `FK_mall_collection_customer` (`u_id`),
  KEY `FK_mall_collection_goods` (`goods_id`),
  CONSTRAINT `FK_mall_collection_customer` FOREIGN KEY (`u_id`) REFERENCES `customer` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_mall_collection_goods` FOREIGN KEY (`goods_id`) REFERENCES `mall_goods` (`goods_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品收藏信息表';

/*Data for the table `mall_collection` */

insert  into `mall_collection`(`mall_collection_id`,`goods_id`,`u_id`) values 
('06272F750A1D4527BA5E186BEC241294','qweqwagg','1');

/*Table structure for table `mall_goods` */

DROP TABLE IF EXISTS `mall_goods`;

CREATE TABLE `mall_goods` (
  `goods_id` varchar(32) NOT NULL COMMENT '商品ID',
  `goods_name` varchar(100) NOT NULL COMMENT '商品名',
  `goods_price` varchar(128) DEFAULT '0' COMMENT '价格',
  `goods_state` int(11) DEFAULT NULL COMMENT '上架情况（1在售，0表示下架）',
  `goods_coverPic` varchar(1000) DEFAULT NULL COMMENT '封面图',
  `goods_category` int(11) DEFAULT NULL COMMENT '种类',
  `goods_describe` varchar(200) DEFAULT NULL COMMENT '商品描述',
  `goods_sale_price` double DEFAULT NULL COMMENT '出售价',
  `goods_perchase_price` double DEFAULT NULL COMMENT '进货价',
  `goods_sales_volume` int(11) DEFAULT NULL COMMENT '销量',
  PRIMARY KEY (`goods_id`),
  KEY `mall_goods_ibfk_1` (`goods_category`),
  CONSTRAINT `mall_goods_ibfk_1` FOREIGN KEY (`goods_category`) REFERENCES `goods_category` (`ca_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品信息表';

/*Data for the table `mall_goods` */

insert  into `mall_goods`(`goods_id`,`goods_name`,`goods_price`,`goods_state`,`goods_coverPic`,`goods_category`,`goods_describe`,`goods_sale_price`,`goods_perchase_price`,`goods_sales_volume`) values 
('qweqwagg','奶棉','5.20',1,'goodsImages/bianzhiImg/coverImg/111222.jpg',1,'柔软儿童耐洗宝宝毛线4股牛奶棉线创意钩针不起球不掉毛粗毛',1,1,1),
('qzaaaaa','衍纸工具套装','8.39',1,'goodsImages/zhiyiImg/coverImg/111aaa.jpg',2,'衍纸工具套装 手工材料包学生衍生纸36色高品质衍纸条线稿图',1,1,1),
('qzbbbbb','珍珠半成品带吊配件','1.50',1,'goodsImages/shipin/coverImg/111bbb.jpg',3,'雪莲银器珍珠半成品带吊配件diy配饰耳钉耳环项链帽服饰辅料吊坠噶啥',1,1,1),
('qzccccc','已打孔萌物小动物卡包材料包','25.00',1,'goodsImages/piyi/coverImg/111ccc.jpg',4,'已打孔萌物小动物卡包材料包河马猫头鹰小狗企鹅DIY手工皮具Y032',1,1,1),
('qzddddd','进口不织布布料无纺布材料包','20.00',1,'goodsImages/buyi/coverImg/111ddd.jpg',5,'包邮手工diy布艺进口不织布布料无纺布材料包 毛毡幼儿园50色免邮',1,1,1),
('qzeeeee','刺绣diy工具','42.00',1,'goodsImages/cixiu/coverImg/111eee.jpg',6,'刺绣diy工具衣服抖音法式团扇手工制作成人初学丝带绣 苏绣自绣花',1,1,1);

/*Table structure for table `mall_orders` */

DROP TABLE IF EXISTS `mall_orders`;

CREATE TABLE `mall_orders` (
  `order_id` varchar(32) NOT NULL COMMENT '订单id',
  `u_id` varchar(32) NOT NULL COMMENT '所属关联用户',
  `order_create_time` varchar(30) DEFAULT 'NULL' COMMENT '下单时间',
  `order_paytime` varchar(30) DEFAULT NULL COMMENT '付款时间',
  `order_totalPrice` double DEFAULT NULL COMMENT '合计',
  `order_consigneeAddress` varchar(300) DEFAULT NULL COMMENT '收货地址',
  `order_message` varchar(200) DEFAULT NULL COMMENT '顾客备注（留言）',
  `order_consigneeName` varchar(32) DEFAULT NULL COMMENT '收货人姓名',
  `order_consigneePhone` varchar(15) DEFAULT NULL COMMENT '收货人电话',
  `order_state` varchar(50) DEFAULT 'NULL' COMMENT '订单状态：未付款，未发货，已发货，已签收，取消购买(已生成了订单，但未付款，取消购买)，交易失败(已付款，未发货，取消订单), 用户已删除',
  `order_delete` int(1) DEFAULT '1' COMMENT '删除标志（1：表示不删除，0：表示已删除）',
  `order_is_commented` int(11) DEFAULT '0' COMMENT '评论标志，1：表示已评论；0：表示未评论',
  PRIMARY KEY (`order_id`),
  KEY `mall_orders_ibfk_1` (`u_id`),
  CONSTRAINT `mall_orders_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `customer` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单信息表';

/*Data for the table `mall_orders` */

insert  into `mall_orders`(`order_id`,`u_id`,`order_create_time`,`order_paytime`,`order_totalPrice`,`order_consigneeAddress`,`order_message`,`order_consigneeName`,`order_consigneePhone`,`order_state`,`order_delete`,`order_is_commented`) values 
('8186C55C29DE4D7F95FA28236BE8B0FD','1','2019-04-18 21:57:07',NULL,5.21,'肇庆学院','','李一','1','未付款',1,0);

/*Table structure for table `message` */

DROP TABLE IF EXISTS `message`;

CREATE TABLE `message` (
  `message_id` int(128) NOT NULL AUTO_INCREMENT COMMENT '消息ID',
  `u_id` varchar(128) NOT NULL COMMENT '发送用户ID',
  `t_id` varchar(128) NOT NULL COMMENT '接收用户ID',
  `time` varchar(128) NOT NULL COMMENT '发送时间',
  `context` varchar(255) NOT NULL COMMENT '消息内容',
  PRIMARY KEY (`message_id`,`u_id`,`t_id`,`time`,`context`),
  KEY `u_id` (`u_id`),
  KEY `message_ibfk_2` (`t_id`),
  CONSTRAINT `message_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `customer` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `message_ibfk_2` FOREIGN KEY (`t_id`) REFERENCES `customer` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8 COMMENT='聊天信息表';

/*Data for the table `message` */

insert  into `message`(`message_id`,`u_id`,`t_id`,`time`,`context`) values 
(82,'1','2','2019年03月24日 13:09:53','你好呀'),
(84,'1','2','2019年04月11日 23:36:52','，'),
(85,'1','3','2019年04月12日 18:33:06','…'),
(89,'1','2','2019年04月17日 11:28:01','测试'),
(91,'1','2','2019年04月19日 16:42:43','测试一下'),
(92,'1','3','2019年04月19日 16:43:09','骰'),
(93,'1','3','2019年04月19日 20:36:00','私信'),
(94,'1','3','2019年04月19日 20:36:43','！！'),
(83,'2','1','2019年03月24日 13:10:00','hi'),
(86,'2','1','2019年04月12日 18:35:50','…'),
(87,'2','1','2019年04月12日 18:35:52','，'),
(90,'3','1','2019年04月18日 20:38:26','好');

/*Table structure for table `order_items` */

DROP TABLE IF EXISTS `order_items`;

CREATE TABLE `order_items` (
  `order_item_id` varchar(32) NOT NULL COMMENT '订单条目ID',
  `order_item_count` int(11) DEFAULT NULL COMMENT '购买数量',
  `item_price` double DEFAULT NULL COMMENT '条目小计',
  `goods_id` varchar(32) DEFAULT NULL COMMENT '所关联的商品',
  `specs_id` varchar(32) DEFAULT NULL COMMENT '商品关联的规格',
  `order_id` varchar(32) DEFAULT NULL COMMENT '所关联的订单ID',
  PRIMARY KEY (`order_item_id`),
  KEY `order_items_ibfs_1` (`goods_id`),
  KEY `order_items_ibfs_2` (`specs_id`),
  KEY `order_items_ibfs_3` (`order_id`),
  CONSTRAINT `order_items_ibfs_1` FOREIGN KEY (`goods_id`) REFERENCES `mall_goods` (`goods_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_items_ibfs_2` FOREIGN KEY (`specs_id`) REFERENCES `goods_specs` (`specs_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_items_ibfs_3` FOREIGN KEY (`order_id`) REFERENCES `mall_orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单条目表';

/*Data for the table `order_items` */

insert  into `order_items`(`order_item_id`,`order_item_count`,`item_price`,`goods_id`,`specs_id`,`order_id`) values 
('217C26BDB4E34086B6DD1F3598AAB244',1,5.21,'qweqwagg','afgergergegegef','8186C55C29DE4D7F95FA28236BE8B0FD');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
