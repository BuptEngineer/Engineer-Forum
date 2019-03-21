## August 7, 2018 8:49 AM

* morning
  * fix the logical of login and register
    * replace itcast orm with Mybatis-spring orm
    * replace struct frame with springMVC

## August 8, 2018 9:43 PM

* night
  * I finally know why people do not add all but add single file ot git repository.
    * they need to note what happened to this code not all code updated.

## August 9, 2018 8:37 PM
* night
  * Today, I have fixed login page and register page.
  * Tomorrow, I will fix logistics of background

## August 11, 2018 12:39 PM
* noon
  * I overwrite login.js and register.js
* afternoon
  * overwrite background logical
* night
  * nearly complete login and register
  * There are some security problems, which are worthy to discuss in future.

## 08/22/2018
* 晚上
  * 增加添加分类功能
    * 暂时设定分类只有一级
  * 先用 ajax 判断类名是否合理
    * 是否超过长度
    * 是否有特殊字符
    * 是否已经存在

##03/20/2019
* 晚上
  * 首页页面会依据从后台获取对方帖子数量而改变布局，建议保持固定大小
  * 开发阶段，去掉验证码比较好
  * 实现 show.jsp 
		- 第一步，将 replay list 添加到 post 属性中，更改了reply 表格结构，添加了 p_id(用户回复主贴的id), rp_id(用户回复的回帖的id)，待做的就是在 post 中添加查询 reply 列表级联，并且在 replay 中实现根据 post id 查询 replay，同时给 reply 添加 user 属性级联，用于显示。
		- 第二步，实现回复功能，前端页面js逻辑，用户在点击回复时，js 获取所在版块的用户 id，然后将被回帖id添加在将要提交的表单的属性中，用户编辑回复内容，点击回复，添加回复。
		- 第三步，在显示回复时，在回帖内容开始前，主动添加被回复者的name。
		
##03/21/2019
* 中午
	* 数据库方面，建议将keep_post表去掉，将comment和reply两个表合二为一。在post表中多增加一些字段，比如是否已经删除，帖子的浏览数，帖子所在分区。在user表中加些字段，比如好友。
	* 历史最热模块，使用TOPK算法依据帖子的浏览数和评论数等指标显示
	* 将jdbc.properties文件中的mysql的主机ip更新下
	* 增加添加分类功能
		* 暂时设定分类只有一级
	* 先用 ajax 判断类名是否合理
		* 是否超过长度
		* 是否有特殊字符
		* 是否已经存在
