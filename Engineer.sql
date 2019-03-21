/*
SQLyog Ultimate v8.32 
MySQL - 5.7.18 : Database - db_experience
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_experience` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `db_experience`;

/*Table structure for table `tbl_category` */

DROP TABLE IF EXISTS `tbl_category`;

CREATE TABLE `tbl_category` (
  `ctg_id` INT(11) NOT NULL AUTO_INCREMENT,
  `ctg_name` VARCHAR(30) DEFAULT NULL,
  `pctg_id` INT(11) DEFAULT NULL,
  `ctg_desc` VARCHAR(500) DEFAULT NULL,
  PRIMARY KEY (`ctg_id`),
  KEY `FK_category_category` (`pctg_id`),
  CONSTRAINT `FK_category_category` FOREIGN KEY (`pctg_id`) REFERENCES `tbl_category` (`ctg_id`)
) ENGINE=INNODB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_category` */

INSERT  INTO `tbl_category`(`ctg_id`,`ctg_name`,`pctg_id`,`ctg_desc`) VALUES (1,'程序员',NULL,'程序员之间交流的家园'),(6,'Android',NULL,'Android'),(7,'青春',NULL,'给我一个粉红的回忆');

/*Table structure for table `tbl_comment` */

DROP TABLE IF EXISTS `tbl_comment`;

/*Data for the table `tbl_comment` */

/*Table structure for table `tbl_keep_post` */

DROP TABLE IF EXISTS `tbl_keep_post`;

CREATE TABLE `tbl_keep_post` (
  `p_id` INT(11) NOT NULL,
  `u_id` INT(11) NOT NULL,
  PRIMARY KEY (`p_id`,`u_id`),
  KEY `FK_fr_user` (`u_id`),
  CONSTRAINT `FK_fr_route` FOREIGN KEY (`p_id`) REFERENCES `tbl_post` (`p_id`),
  CONSTRAINT `FK_fr_user` FOREIGN KEY (`u_id`) REFERENCES `tbl_user` (`u_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_keep_post` */

/*Table structure for table `tbl_letter` */

DROP TABLE IF EXISTS `tbl_letter`;

CREATE TABLE `tbl_letter` (
  `l_id` INT(11) NOT NULL AUTO_INCREMENT,
  `l_content` VARCHAR(1000) NOT NULL,
  `from_u_id` INT(11) NOT NULL,
  `to_u_id` INT(11) NOT NULL,
  `ul_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `l_isread` TINYINT(1) DEFAULT '0',
  PRIMARY KEY (`l_id`),
  KEY `FK_ut_user_f` (`from_u_id`),
  KEY `FK_ut_user_t` (`to_u_id`),
  CONSTRAINT `FK_ut_user_f` FOREIGN KEY (`from_u_id`) REFERENCES `tbl_user` (`u_id`),
  CONSTRAINT `FK_ut_user_t` FOREIGN KEY (`to_u_id`) REFERENCES `tbl_user` (`u_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_letter` */

/*Table structure for table `tbl_post` */

DROP TABLE IF EXISTS `tbl_post`;

CREATE TABLE `tbl_post` (
  `p_id` INT(11) NOT NULL AUTO_INCREMENT,
  `p_name` VARCHAR(100) DEFAULT NULL,
  `p_desc` VARCHAR(1000) DEFAULT NULL,
  `u_id` INT(11) DEFAULT NULL,
  `ctg_id` INT(11) DEFAULT NULL,
  `p_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`p_id`),
  KEY `FK_post_user` (`u_id`),
  KEY `FK_post_category` (`ctg_id`),
  CONSTRAINT `FK_post_category` FOREIGN KEY (`ctg_id`) REFERENCES `tbl_category` (`ctg_id`),
  CONSTRAINT `FK_post_user` FOREIGN KEY (`u_id`) REFERENCES `tbl_user` (`u_id`)
) ENGINE=INNODB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_post` */

INSERT  INTO `tbl_post`(`p_id`,`p_name`,`p_desc`,`u_id`,`ctg_id`,`p_time`) VALUES (18,'234','123',21,1,'0000-00-00 00:00:00'),(19,'234','今天真的是太忙了',21,1,'0000-00-00 00:00:00'),(23,'234','what??',21,6,'0000-00-00 00:00:00'),(25,'123123','123123',21,6,NULL),(26,'程序员有春天吗','程序员有春天吗',22,7,NULL),(27,'Android','Android',NULL,1,NULL),(28,'Android','Android',NULL,1,NULL),(29,'Android','Android',NULL,1,NULL),(30,'Android','Android',NULL,1,NULL),(31,'Android','Android',NULL,1,NULL),(32,'Android','Android',NULL,1,NULL),(33,'Android','Android',NULL,1,NULL),(34,'Android','Android',NULL,1,NULL);

/*Table structure for table `tbl_reply` */

DROP TABLE IF EXISTS `tbl_reply`;

CREATE TABLE `tbl_reply` (
  `r_id` INT(11) NOT NULL AUTO_INCREMENT,
  `r_content` VARCHAR(1000) DEFAULT NULL,
  `u_id` INT(11) NOT NULL,
  `p_id` INT(11) NOT NULL COMMENT '用户回复的主贴id',
  `r_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `rp_id` INT(11) DEFAULT NULL COMMENT '被回帖的帖子id',
  PRIMARY KEY (`r_id`),
  KEY `FK_reply_user` (`u_id`),
  KEY `FK_reply_comment` (`p_id`),
  KEY `FK_reply_parent` (`rp_id`),
  CONSTRAINT `FK_reply_parent` FOREIGN KEY (`rp_id`) REFERENCES `tbl_reply` (`r_id`),
  CONSTRAINT `FK_reply_comment` FOREIGN KEY (`p_id`) REFERENCES `tbl_post` (`p_id`),
  CONSTRAINT `FK_reply_user` FOREIGN KEY (`u_id`) REFERENCES `tbl_user` (`u_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_reply` */

/*Table structure for table `tbl_user` */

DROP TABLE IF EXISTS `tbl_user`;

CREATE TABLE `tbl_user` (
  `u_id` INT(11) NOT NULL AUTO_INCREMENT,
  `u_email` VARCHAR(30) NOT NULL,
  `u_name` VARCHAR(30) DEFAULT NULL,
  `u_pwd` VARCHAR(30) DEFAULT NULL,
  `u_sex` CHAR(2) DEFAULT NULL,
  `u_desc` VARCHAR(100) DEFAULT NULL,
  `u_img` VARCHAR(100) DEFAULT NULL,
  `u_status` TINYINT(1) DEFAULT '0',
  `u_actnCode` CHAR(64) DEFAULT NULL,
  `u_date` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `u_online` TINYINT(1) DEFAULT '1',
  `u_growth` INT(11) DEFAULT '0',
  `u_vip` TINYINT(1) DEFAULT '0',
  PRIMARY KEY (`u_id`),
  UNIQUE KEY `u_email` (`u_email`)
) ENGINE=INNODB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_user` */

INSERT  INTO `tbl_user`(`u_id`,`u_email`,`u_name`,`u_pwd`,`u_sex`,`u_desc`,`u_img`,`u_status`,`u_actnCode`,`u_date`,`u_online`,`u_growth`,`u_vip`) VALUES (1,'1','1','1',NULL,NULL,NULL,0,NULL,'2018-09-21 19:08:48',0,0,NULL),(2,'2','3',NULL,NULL,NULL,NULL,0,NULL,'2018-09-21 19:08:48',1,0,0),(20,'e1','insertS',NULL,'u',NULL,NULL,0,NULL,'2018-09-21 19:20:55',1,0,0),(21,'s@q.com','梅林','123123','u',NULL,NULL,0,NULL,'2018-09-21 19:22:17',1,11,0),(22,'123@1.com','qq','123123','m',NULL,NULL,NULL,NULL,'2019-03-06 20:51:09',1,5,0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
