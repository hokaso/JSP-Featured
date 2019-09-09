/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.7.25-log : Database - teaching
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`teaching` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `teaching`;

/*Table structure for table `chat` */

DROP TABLE IF EXISTS `chat`;

CREATE TABLE `chat` (
  `junior_id` varchar(30) NOT NULL,
  `college_id` varchar(30) NOT NULL,
  `status` int(11) DEFAULT NULL COMMENT '0为已读或无，1为未读',
  PRIMARY KEY (`college_id`,`junior_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `chat` */

/*Table structure for table `college` */

DROP TABLE IF EXISTS `college`;

CREATE TABLE `college` (
  `college_id` varchar(50) DEFAULT NULL,
  `college_password` varchar(20) DEFAULT NULL,
  `college_name` varchar(10) DEFAULT NULL,
  `college_gender` varchar(2) DEFAULT NULL,
  `college_birth` date DEFAULT NULL,
  `college_phone` varchar(12) DEFAULT NULL,
  `college_address` varchar(25) DEFAULT NULL,
  `college_photo` varchar(50) DEFAULT NULL,
  `college_statue` int(1) DEFAULT NULL COMMENT '0待审核，1通过，2不通过'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `college` */

insert  into `college`(`college_id`,`college_password`,`college_name`,`college_gender`,`college_birth`,`college_phone`,`college_address`,`college_photo`,`college_statue`) values ('college1','123456','123456','男','2019-05-02','13425200000','广东省肇庆市肇庆学院','/photo/20190530093612college1.jpg',1),('college2','123456','college2','男','2019-06-13','13425200000','广东省肇庆市端州区肇庆学院','/photo/20190601185953college2.jpg',1);

/*Table structure for table `course` */

DROP TABLE IF EXISTS `course`;

CREATE TABLE `course` (
  `course_id` int(10) NOT NULL AUTO_INCREMENT,
  `college_id` varchar(10) DEFAULT NULL,
  `course_name` varchar(20) DEFAULT NULL,
  `course_time` date DEFAULT NULL,
  `course_statue` varchar(10) DEFAULT NULL,
  `course_intro` varchar(25) DEFAULT NULL,
  `course_price` int(2) DEFAULT NULL,
  `course_photo` varchar(50) DEFAULT NULL,
  `course_type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `course` */

insert  into `course`(`course_id`,`college_id`,`course_name`,`course_time`,`course_statue`,`course_intro`,`course_price`,`course_photo`,`course_type`) values (9,'college1','历史必修一','2019-06-08','已被购买','历史必修一课后解答',20,'/photo/20190601123432college1.jpg','历史'),(10,'college2','数学必修一','2019-06-23','未被购买','集合、区间',32,'/photo/20190601212410college2.jpg','数学'),(11,'college2','数学必修二','2019-06-16','未被购买','主要辅导几何',30,'/photo/20190601212434college2.jpg','数学'),(12,'college1','英语必修一','2019-06-19','未被购买','英语必修一教学',30,'/photo/20190601212514college1.jpg','英语'),(13,'college1','物理必修二','2019-06-16','未被购买','物理必修二辅导',40,'/photo/20190601212928college1.jpg','物理'),(14,'college1','政治必修一','2019-06-15','未被购买','政治必修一',20,'/photo/20190601214113college1.jpg','政治');

/*Table structure for table `junior` */

DROP TABLE IF EXISTS `junior`;

CREATE TABLE `junior` (
  `junior_id` varchar(20) DEFAULT NULL,
  `junior_name` varchar(20) DEFAULT NULL,
  `junior_password` varchar(10) DEFAULT NULL,
  `junior_gender` varchar(2) DEFAULT NULL,
  `junior_birth` date DEFAULT NULL,
  `junior_phone` varchar(12) DEFAULT NULL,
  `junior_address` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `junior` */

insert  into `junior`(`junior_id`,`junior_name`,`junior_password`,`junior_gender`,`junior_birth`,`junior_phone`,`junior_address`) values ('junior1','12345','123456','男','2019-05-10','13425200000','广东肇庆端州肇庆学院'),('junior2','junior2','123456','男','1995-05-10','13425200000','广东省肇庆市高要区某学校');

/*Table structure for table `teach` */

DROP TABLE IF EXISTS `teach`;

CREATE TABLE `teach` (
  `teach_id` varchar(50) DEFAULT NULL,
  `junior_id` varchar(50) DEFAULT NULL,
  `course_id` int(10) DEFAULT NULL,
  `college_id` varchar(50) DEFAULT NULL,
  `teach_statue` varchar(20) DEFAULT NULL,
  `score_statue` varchar(10) DEFAULT NULL COMMENT '已评分，未评分，null',
  `college_score` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `teach` */

insert  into `teach`(`teach_id`,`junior_id`,`course_id`,`college_id`,`teach_statue`,`score_statue`,`college_score`) values ('20190601220302junior1','junior1',9,'college1','已授课','已评分',80);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
