CREATE DATABASE db_experience;
USE db_experience;
-- DROP DATABASE mooc;

-- 用户表
CREATE TABLE `tbl_user`(
	u_id INT(11) NOT NULL AUTO_INCREMENT,/* 公告id(默认自增长),*/
	u_email VARCHAR(30) NOT NULL,-- 注册邮箱
	u_name VARCHAR(30) DEFAULT NULL,-- 昵称
	`u_pwd` VARCHAR(30) DEFAULT NULL,-- 密码
	u_sex CHAR(2) DEFAULT NULL,-- 性别
	u_desc VARCHAR(100) DEFAULT NULL,-- 个人签名
	u_img VARCHAR(100) DEFAULT NULL,  -- 图像路径
	`u_status` TINYINT(1) DEFAULT 0,-- 邮箱是否激活,0表示未激活，1表示已激活
	u_actnCode CHAR(64) DEFAULT NULL,-- 邮箱激活码
	PRIMARY KEY (u_id),-- 主键
	UNIQUE KEY u_email(u_email)-- 唯一约束
)ENGINE=INNODB DEFAULT CHARSET=utf8;



-- 路线的分类
CREATE TABLE tbl_category(
	ctg_id INT(11) NOT NULL AUTO_INCREMENT,/* 公告id(默认自增长),*/
	ctg_name VARCHAR(30) DEFAULT NULL,-- 分类名称
	pctg_id INT(11) DEFAULT NULL,/* 父分类的id，若为null，则该分类为一级分类,*/
	ctg_desc VARCHAR(500) DEFAULT NULL, -- 分类简介
	PRIMARY KEY (ctg_id),-- 主键
	CONSTRAINT `FK_category_category` FOREIGN KEY (`pctg_id`) REFERENCES `tbl_category` (`ctg_id`)
)ENGINE=INNODB DEFAULT CHARSET=utf8;


/*  职业表 */
CREATE TABLE tbl_occupation(
	o_id INT(11) NOT NULL AUTO_INCREMENT,/* 职业的id(默认自增长),*/
	o_name VARCHAR(50) DEFAULT NULL,-- 职业名称
	o_desc VARCHAR(500) DEFAULT NULL,/*  职业的描述 */
	ctg_id INT(11), -- 所属哪个二级分类 外键 DEFAULT NULL
	PRIMARY KEY (o_id),-- 主键
	CONSTRAINT `FK_occupation_category` FOREIGN KEY (`ctg_id`) REFERENCES `tbl_category` (`ctg_id`)
)ENGINE=INNODB DEFAULT CHARSET=utf8;


/* 学习路线表 */
CREATE TABLE tbl_route(
	rt_id INT(11) NOT NULL AUTO_INCREMENT,/* 路线的id(默认自增长),*/
	rt_name VARCHAR(100) NOT NULL,/* 路线名称 */
	rt_desc VARCHAR(1000) DEFAULT NULL , /* 路线的总体说明 */
	rt_time TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP, /* 路线发表时间为提交时间，修改路线后时间变为修改时间 */
	rt_check TINYINT(1) DEFAULT 0,/* 0表示未审核，1表示审核通过，-1表示未通过审核 */
	rt_likeNum INT ,/* 该条路线的点赞数 */
	u_id INT(11),/* 哪个用户添加的路线 */
	o_id INT(11),/* 外键，对应的哪个职位 */
	PRIMARY KEY (rt_id),
	CONSTRAINT `FK_rt_user` FOREIGN KEY (`u_id`) REFERENCES `tbl_user` (`u_id`),
	CONSTRAINT `FK_route_occupation` FOREIGN KEY (`o_id`) REFERENCES `tbl_occupation` (`o_id`)
)ENGINE=INNODB DEFAULT CHARSET=utf8;

/* 收藏路线 */
CREATE TABLE tbl_keep_route(
	rt_id INT(11) NOT NULL,/* 外键，路线 */
	u_id INT(11) NOT NULL,/* 外键，哪个用户收藏了该路线 */
	PRIMARY KEY(rt_id,u_id),
	CONSTRAINT `FK_fr_user` FOREIGN KEY (`u_id`) REFERENCES `tbl_user` (`u_id`),
	CONSTRAINT `FK_fr_route` FOREIGN KEY (`rt_id`) REFERENCES `tbl_route` (`rt_id`)
)ENGINE=INNODB DEFAULT CHARSET=utf8;

/* 路线下的节点类 */
CREATE TABLE tbl_section(
	s_id INT(11) NOT NULL AUTO_INCREMENT,/* 节点的id */
	s_num INT DEFAULT NULL , /* 节点的编号 */
	s_name VARCHAR(50),/* 节点的名称 */
	s_content TEXT DEFAULT NULL,/* 节点下面的经验之潭*/
	rt_id INT(11),/* 外键，表所属于哪一个路线 */
	PRIMARY KEY (s_id),
	CONSTRAINT `FK_section_route` FOREIGN KEY (`rt_id`) REFERENCES `tbl_route` (`rt_id`) 
)ENGINE=INNODB DEFAULT CHARSET=utf8;

/* 对路线节点的评论 */
CREATE TABLE tbl_sct_comment(
	sc_id INT(11) NOT NULL,/*  */
	sc_content VARCHAR(1000) NOT NULL,/* 评论的内容 */
	sc_time TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP,/* 评论的时间 */
	u_id INT(11) NOT NULL,/* 外键，哪个用户的评论 */
	s_id INT(11) NOT NULL,/* 外键，在哪个节点下面的评论 */
	PRIMARY KEY (`sc_id`),
	CONSTRAINT `FK_sc_user` FOREIGN KEY (`u_id`) REFERENCES `tbl_user` (`u_id`),
	CONSTRAINT `FK_sc_section` FOREIGN KEY (`s_id`) REFERENCES `tbl_section` (`s_id`)
)ENGINE=INNODB DEFAULT CHARSET=utf8;

/* 对节点评论的回复 */
CREATE TABLE tbl_sc_reply(
	scr_id INT(11) NOT NULL,/* 回复的id */
	scr_content VARCHAR(1000),/* 回复的内容 */
	u_id INT(11) NOT NULL,/* 外键，哪个用户的回复 */
	sc_id INT(11) NOT NULL,/** 外键，对应的哪条评论 */
	scr_time TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP,/* 回复的时间 */
	PRIMARY KEY(scr_id),
	CONSTRAINT `FK_scr_user` FOREIGN KEY (`u_id`) REFERENCES `tbl_user` (`u_id`),
	CONSTRAINT `FK_scr_sc` FOREIGN KEY (`sc_id`) REFERENCES `tbl_sct_comment` (`sc_id`)
);


-- ------------问答部分----------------------------
/* 提问表 */
CREATE TABLE tbl_question(
	q_id INT(11) NOT NULL AUTO_INCREMENT,
	q_name VARCHAR(100) DEFAULT NULL,
	q_desc VARCHAR(1000) DEFAULT NULL,/* 问题的描述 */
	u_id INT(11) DEFAULT NULL,/* 那个用户的提问 */
	ctg_id INT(11) DEFAULT NULL,/* 外键 对应的哪个二级分类 */
	q_time TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP ,/*提问发表时间为提交时间，修改路线后时间变为修改时间 */
	PRIMARY KEY (q_id),
	CONSTRAINT `FK_question_user` FOREIGN KEY (`u_id`) REFERENCES `tbl_user` (`u_id`),
	CONSTRAINT `FK_question_category` FOREIGN KEY (`ctg_id`) REFERENCES `tbl_category` (`ctg_id`)
)ENGINE=INNODB DEFAULT CHARSET=utf8;

/* 关注问题 */
CREATE TABLE tbl_follow_qst(
	q_id INT(11) NOT NULL,/* 外键，问题 */
	u_id INT(11) NOT NULL,/* 外键，用户 */
	PRIMARY KEY(q_id,u_id),
	CONSTRAINT `FK_fq_user` FOREIGN KEY (`u_id`) REFERENCES `tbl_user` (`u_id`),
	CONSTRAINT `FK_fq_question` FOREIGN KEY (`q_id`) REFERENCES `tbl_question` (`q_id`)
)ENGINE=INNODB DEFAULT CHARSET=utf8;

/* 回答表 【注意】一个用户对一个问题，只能给出一个答案 */
CREATE TABLE tbl_answer(
	a_id INT(11) NOT NULL AUTO_INCREMENT,
	q_id INT(11) NOT NULL,/* 对应的哪个问题 */ 
 	a_content TEXT DEFAULT NULL,/* 回答的内容 */
 	u_id INT (11) NOT NULL,/* 外键，用户的id */
	a_time TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP ,/*提问发表时间为提交时间，修改路线后时间变为修改时间 */
	a_likeNum INT,/* 回答的点赞数 */ 
	PRIMARY KEY (a_id),
	UNIQUE(q_id,u_id),/* 让问题和用户的组合唯一 */
	CONSTRAINT `FK_answer_question` FOREIGN KEY (`q_id`) REFERENCES `tbl_question` (`q_id`),
	CONSTRAINT `FK_answer_user` FOREIGN KEY (`u_id`) REFERENCES `tbl_user` (`u_id`)
)ENGINE=INNODB DEFAULT CHARSET=utf8;

/* 对回答的评论表 */
CREATE TABLE tbl_asw_comment(
	ac_id INT(11) NOT NULL AUTO_INCREMENT,
	ac_content VARCHAR(1000) NOT NULL,/* 评论的内容 */
	ac_time TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP,/* 评论的时间 */
	u_id INT(11) NOT NULL,/* 外键，哪个用户的评论 */
	a_id INT(11) NOT NULL,/* 外键，在哪个回答下面的评论 */
	PRIMARY KEY (`ac_id`),
	CONSTRAINT `FK_ac_user` FOREIGN KEY (`u_id`) REFERENCES `tbl_user` (`u_id`),
	CONSTRAINT `FK_ac_asw` FOREIGN KEY (`a_id`) REFERENCES `tbl_answer` (`a_id`)	
)ENGINE=INNODB DEFAULT CHARSET=utf8;

/* 对回答评论的回复 */
CREATE TABLE tbl_ac_reply(
	acr_id INT(11) NOT NULL AUTO_INCREMENT,/* 回复的id */
	acr_content VARCHAR(1000),/* 回复的内容 */
	u_id INT(11) NOT NULL,/* 外键，哪个用户的回复 */
	ac_id INT(11) NOT NULL,/** 外键，对应的哪条评论 */
	acr_time TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP,/* 回复的时间 */
	PRIMARY KEY(acr_id),
	CONSTRAINT `FK_acr_user` FOREIGN KEY (`u_id`) REFERENCES `tbl_user` (`u_id`),
	CONSTRAINT `FK_acr_ac` FOREIGN KEY (`ac_id`) REFERENCES `tbl_asw_comment` (`ac_id`)
)ENGINE=INNODB DEFAULT CHARSET=utf8;

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

/* 后台管理员 */
CREATE TABLE `tbl_admin`(
	`adm_id` INT  AUTO_INCREMENT,-- 排用来序，自增长
	`adm_name` VARCHAR(30) DEFAULT NULL,
	`adm_pwd` VARCHAR(30) DEFAULT NULL,
	`adm_issuper` TINYINT(1) DEFAULT 0,-- 是否超级管理员，只有超级管理员才能添加管理员
	PRIMARY KEY (`adm_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/* 举报的路线表*/
CREATE TABLE tbl_report_route(
	rr_id INT(11) NOT NULL AUTO_INCREMENT,
	rt_id INT(11) NOT NULL,/** 外键，被举报的路线 */
	from_u_id INT(11) NOT NULL,/*外键 由谁举报的 */
	rr_time TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP,/*举报的时间*/
	-- rr_isignore TINYINT(1) DEFAULT 0,/*0表示没阅，1表示已忽略  */
	PRIMARY KEY(rr_id),
	UNIQUE(rt_id,from_u_id),/* 一个人只能举报一条路线仅一次 */
	CONSTRAINT `FK_rr_user_f` FOREIGN KEY (`from_u_id`) REFERENCES `tbl_user` (`u_id`)
)ENGINE=INNODB DEFAULT CHARSET=utf8;

/*举报回答*/
CREATE TABLE tbl_report_answer(
	ra_id INT(11) NOT NULL AUTO_INCREMENT,
	a_id INT(11) NOT NULL,/** 外键，哪个回答 */
	from_u_id INT(11) NOT NULL,/*外键 由谁举报的 */
	ra_time TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP,/*举报的时间*/
	-- ra_isignore TINYINT(1) DEFAULT 0,/*0表示没阅，1表示已忽略  */
	PRIMARY KEY(ra_id),
	UNIQUE(a_id,from_u_id),/* 一个人只能举报一条回答仅一次 */
	CONSTRAINT `FK_ra_user_f` FOREIGN KEY (`from_u_id`) REFERENCES `tbl_user` (`u_id`),
	CONSTRAINT `FK_ra_answer` FOREIGN KEY (`a_id`) REFERENCES `tbl_answer` (`a_id`)
)ENGINE=INNODB DEFAULT CHARSET=utf8;

