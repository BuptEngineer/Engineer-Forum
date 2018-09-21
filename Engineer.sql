DROP DATABASE IF EXISTS db_experience;
CREATE DATABASE db_experience;
USE db_experience;
-- DROP DATABASE mooc;

-- 用户表
CREATE TABLE `tbl_user`(
	u_id INT(11) NOT NULL AUTO_INCREMENT,/* 用户id(默认自增长) 1-100是超级管理员,100-500是普通管理员,500之后是一般用户*/
	u_email VARCHAR(30) NOT NULL,-- 注册邮箱
	u_name VARCHAR(30) DEFAULT NULL,-- 昵称
	`u_pwd` VARCHAR(30) DEFAULT NULL,-- 密码
	u_sex CHAR(2) DEFAULT NULL,-- 性别
	u_desc VARCHAR(100) DEFAULT NULL,-- 个人签名
	u_img VARCHAR(100) DEFAULT NULL,  -- 图像路径
	`u_status` TINYINT(1) DEFAULT 0,-- 邮箱是否激活,0表示未激活，1表示已激活
	u_actnCode CHAR(64) DEFAULT NULL,-- 邮箱激活码
	u_date DATETIME DEFAULT CURRENT_TIMESTAMP, #注册时间,默认是当前时间
	u_online BOOLEAN DEFAULT TRUE,#是否在线,默认在线 
	u_growth INT(11) DEFAULT 0,#成长值,依赖于登录次数和发帖回帖频率等,可以此来进行活跃度排名
	u_vip BOOLEAN DEFAULT FALSE,#是否是vip用户
	PRIMARY KEY (u_id),-- 主键
	UNIQUE KEY u_email(u_email)-- 唯一约束
)ENGINE=INNODB DEFAULT CHARSET=utf8;


-- 帖子分类
CREATE TABLE tbl_category(
	ctg_id INT(11) NOT NULL AUTO_INCREMENT,/* 公告id(默认自增长),*/
	ctg_name VARCHAR(30) DEFAULT NULL,-- 分类名称
	pctg_id INT(11) DEFAULT NULL,/* 父分类的id，若为null，则该分类为一级分类,*/
	ctg_desc VARCHAR(500) DEFAULT NULL, -- 分类简介
	PRIMARY KEY (ctg_id),-- 主键
	CONSTRAINT `FK_category_category` FOREIGN KEY (`pctg_id`) REFERENCES `tbl_category` (`ctg_id`)
)ENGINE=INNODB DEFAULT CHARSET=utf8;

/* 帖子 */
CREATE TABLE tbl_post(
	p_id INT(11) NOT NULL AUTO_INCREMENT,
	p_name VARCHAR(100) DEFAULT NULL,
	p_desc VARCHAR(1000) DEFAULT NULL,/* 帖子的描述 */
	u_id INT(11) DEFAULT NULL,/* 用户 对应外键 */
	ctg_id INT(11) DEFAULT NULL,/* 外键 对应的哪个二级分类 */
	p_time TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP ,/*帖子发表时间为提交时间，修改帖子后时间变为修改时间 */
	PRIMARY KEY (p_id),
	CONSTRAINT `FK_post_user` FOREIGN KEY (`u_id`) REFERENCES `tbl_user` (`u_id`),
	CONSTRAINT `FK_post_category` FOREIGN KEY (`ctg_id`) REFERENCES `tbl_category` (`ctg_id`)
)ENGINE=INNODB DEFAULT CHARSET=utf8;

/* 收藏帖子 */
CREATE TABLE tbl_keep_post(
	p_id INT(11) NOT NULL,/* 外键，路线 */
	u_id INT(11) NOT NULL,/* 外键，哪个用户收藏了该帖子 */
	PRIMARY KEY(p_id,u_id),
	CONSTRAINT `FK_fr_user` FOREIGN KEY (`u_id`) REFERENCES `tbl_user` (`u_id`),
	CONSTRAINT `FK_fr_route` FOREIGN KEY (`p_id`) REFERENCES `tbl_post` (`p_id`)
)ENGINE=INNODB DEFAULT CHARSET=utf8;

/* 对回答的评论表 */
CREATE TABLE tbl_comment(
	c_id INT(11) NOT NULL AUTO_INCREMENT,
	c_content VARCHAR(1000) NOT NULL,/* 评论的内容 */
	c_time TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP,/* 评论的时间 */
	u_id INT(11) NOT NULL,/* 外键，哪个用户的评论 */
	p_id INT(11) NOT NULL,/* 外键，在哪个帖子下面的评论 */
	PRIMARY KEY (`c_id`),
	CONSTRAINT `FK_comment_user` FOREIGN KEY (`u_id`) REFERENCES `tbl_user` (`u_id`),
	CONSTRAINT `FK_comment_post` FOREIGN KEY (`p_id`) REFERENCES `tbl_post` (`p_id`)
)ENGINE=INNODB DEFAULT CHARSET=utf8;


/* 对回答评论的回复 */
CREATE TABLE tbl_reply(
	r_id INT(11) NOT NULL AUTO_INCREMENT,/* 回复的id */
	r_content VARCHAR(1000),/* 回复的内容 */
	u_id INT(11) NOT NULL,/* 外键，哪个用户的回复 */
	c_id INT(11) NOT NULL,/* 外键，对应的哪条评论 */
	r_time TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP,/* 回复的时间 */
	PRIMARY KEY(r_id),
	CONSTRAINT `FK_reply_user` FOREIGN KEY (`u_id`) REFERENCES `tbl_user` (`u_id`),
	CONSTRAINT `FK_reply_comment` FOREIGN KEY (`c_id`) REFERENCES `tbl_comment` (`c_id`)
)ENGINE=INNODB DEFAULT CHARSET = utf8;


/* 私信表 */
CREATE TABLE tbl_letter(
	l_id INT(11) NOT NULL AUTO_INCREMENT,
	l_content VARCHAR(1000) NOT NULL,/* 私信内容 */
	from_u_id INT(11) NOT NULL,/* 谁写的私信 */
	to_u_id INT(11) NOT NULL,/* 发给谁的id */
	ul_time TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP,/* 发私信的时间 */
	l_isread TINYINT(1) DEFAULT 0,/* 0表示未读，1表示已读 */	
	PRIMARY KEY (l_id),
	CONSTRAINT `FK_ut_user_f` FOREIGN KEY (`from_u_id`) REFERENCES `tbl_user` (`u_id`),
	CONSTRAINT `FK_ut_user_t` FOREIGN KEY (`to_u_id`) REFERENCES `tbl_user` (`u_id`)
)ENGINE=INNODB DEFAULT CHARSET=utf8;



insert  into `tbl_category`(`ctg_id`,`ctg_name`,`pctg_id`,`ctg_desc`) values (1,'程序员',NULL,'程序员之间交流的家园'),(6,'Android',NULL,'Android');



insert  into `tbl_post`(`p_id`,`p_name`,`p_desc`,`u_id`,`ctg_id`,`p_time`) values (5,'Android','Android',NULL,1,NULL),(6,'Android','Android',NULL,1,NULL),(7,'Android','Android',NULL,1,NULL),(8,'Android','Android',NULL,1,NULL),(9,'Android','Android',NULL,1,NULL),(10,'Android','Android',NULL,1,NULL),(11,'Android','Android',NULL,1,NULL),(12,'Android','Android',NULL,1,NULL),(13,'Android','Android',NULL,1,NULL),(14,'Android','Android',NULL,1,NULL),(15,'Android','Android',NULL,1,NULL),(16,'Android','Android',NULL,1,NULL),(17,'Android','Android',NULL,1,NULL),(18,'234','123',21,1,NULL),(19,'234','今天真的是太忙了',21,1,NULL);


insert  into `tbl_user`(`u_id`,`u_email`,`u_name`,`u_pwd`,`u_sex`,`u_desc`,`u_img`,`u_status`,`u_actnCode`,`u_date`,`u_online`,`u_growth`,`u_vip`) values (1,'1','1','1',NULL,NULL,NULL,0,NULL,'2018-09-21 19:08:48',0,0,NULL),(2,'2','3',NULL,NULL,NULL,NULL,0,NULL,'2018-09-21 19:08:48',1,0,0),(20,'e1','insertS',NULL,'u',NULL,NULL,0,NULL,'2018-09-21 19:20:55',1,0,0),(21,'s@q.com','梅林','123123','u',NULL,NULL,0,NULL,'2018-09-21 19:22:17',1,4,0);
