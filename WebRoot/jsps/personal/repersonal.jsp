<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>个人中心</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="stylesheet" href="jsps/css/personal/bootstrap.min.css" />
	<link rel="stylesheet" href="jsps/css/personal/bootstrap-responsive.min.css" />
	<link rel="stylesheet" href="jsps/css/personal/fullcalendar.css" />
	<link rel="stylesheet" href="jsps/css/personal/matrix-style.css" />
	<link rel="stylesheet" href="jsps/css/personal/matrix-media.css" />
	<link href="jsps/font-awesome/css/font-awesome.css" rel="stylesheet" />
	<link rel="stylesheet" href="jsps/css/personal/mycss.css" />
	<link rel="stylesheet" href="jsps/css/personal/jquery.gritter.css" />
	
	<script src="jsps/js/personal/jquery.min.js"></script>
	<script src="jsps/js/personal/matrix.js"></script>
	<link rel="stylesheet" type="text/css" href="jsps/css/personal/myBlank.css">
	<script type="text/javascript" src="jsps/js/personal/jquery-1.8.0.min.js"></script>
	<!-- 遮罩层start -->
	<script>
		jQuery(document).ready(function($) {
			$('.theme-login').click(function(){
				$('.re-theme-popover-mask').fadeIn(100);
				$('.re-theme-popover').slideDown(200);
			})
			$('.theme-poptit .close').click(function(){
				
				$('.re-theme-popover-mask').fadeOut(100);
				$('.re-theme-popover').slideUp(200);
			})
		
		})
	</script>
	<!-- 遮罩层end -->
  </head>
  
  <body>
    <!--Header-part-->
	<div id="header">
	  <div class="myHeader">个人中心</div>
	</div>
	<!--close-Header-part--> 
	
	
	<!--top-Header-menu-->
	<div id="user-nav" class="navbar navbar-inverse">
	  <ul class="nav">
		<li  class="dropdown" id="profile-messages" ><a title="" href="#" data-toggle="dropdown" data-target="#profile-messages" class="dropdown-toggle"><i class="icon icon-user"></i>  <span class="text">Welcome User</span><b class="caret"></b></a>
		  <ul class="dropdown-menu">
			<li><a href="#"><i class="icon-user"></i> My Profile</a></li>
			<li class="divider"></li>
			<li><a href="#"><i class="icon-check"></i> My Tasks</a></li>
			<li class="divider"></li>
			<li><a href="#"><i class="icon-key"></i> Log Out</a></li>
		  </ul>
		</li>
		<li class="dropdown" id="menu-messages"><a href="#" data-toggle="dropdown" data-target="#menu-messages" class="dropdown-toggle"><i class="icon icon-envelope"></i> <span class="text">Messages</span> <span class="label label-important">5</span> <b class="caret"></b></a>
		  <ul class="dropdown-menu">
			<li><a class="sAdd" title="" href="#"><i class="icon-plus"></i> new message</a></li>
			<li class="divider"></li>
			<li><a class="sInbox" title="" href="#"><i class="icon-envelope"></i> inbox</a></li>
			<li class="divider"></li>
			<li><a class="sOutbox" title="" href="#"><i class="icon-arrow-up"></i> outbox</a></li>
			<li class="divider"></li>
			<li><a class="sTrash" title="" href="#"><i class="icon-trash"></i> trash</a></li>
		  </ul>
		</li>
		<li class=""><a title="" href="#"><i class="icon icon-cog"></i> <span class="text">Settings</span></a></li>
		<li class=""><a title="" href="#"><i class="icon icon-share-alt"></i> <span class="text">Logout</span></a></li>
	  </ul>
	</div>
	<!--close-top-Header-menu-->
	
	<!--start-top-serch-->
	<div id="search">
	  <input type="text" placeholder="Search here..."/>
	  <button type="submit" class="tip-bottom" title="Search"><i class="icon-search icon-white"></i></button>
	</div>
	
	
	
	<div id="sidebar"><a href="#" class="visible-phone"><i class="icon icon-home"></i>asf </a>
	  <ul>
		<li class="active mynavigate"><a href="jsps/personal/personal.jsp"><i class="icon icon-home"></i> <span>我的首页</span></a> </li>
		<li class="mynavigate"> <a href="jsps/personal/edit_personal.jsp"><i class="icon icon-signal"></i> <span>编辑个人信息</span></a> </li>
		<li class="mynavigate"> <a href="#"><i class="icon icon-inbox"></i> <span>我的路线</span></a> </li>
		<li class="mynavigate"><a href="#"><i class="icon icon-th"></i> <span>我的提问</span></a></li>
		<li class="mynavigate"><a href="#"><i class="icon icon-fullscreen"></i> <span>我的回答</span></a></li>
		<li class="submenu mynavigate"> <a href="#"><i class="icon icon-th-list"></i> <span>我的收藏</span> <span class="label label-important">3</span></a>
		  <ul>
			<li><a href="#">我收藏的路线</a></li>
			<li><a href="#">我收藏的问题</a></li>
			
		  </ul>
		</li>
		
	  </ul>
	</div>
	<!--sidebar-menu-->
	
	<!--main-container-part-->
	<div id="content">
	<!--breadcrumbs-->
	  <div id="content-header">
		<div id="breadcrumb"> <a href="jsps/personal/personal.jsp" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> 我的首页</a></div>
	  </div>
	<!--End-breadcrumbs-->
	
	<!--Action boxes-->
	  <div class="container-fluid">
		<div class="quick-actions_homepage">
		  <ul class="quick-actions">
			<li class="bg_lb span2"> <a href="jsps/personal/personal.jsp"> <i class="icon-dashboard"></i> <span class="label label-important">20</span> 我的首页 </a> </li>
			<li class="bg_lg span2"> <a class="theme-login" href="javascript:;"> <i class="icon-signal"></i> 快速修改信息</a> </li>
			
			<li class="bg_lo span2"> <a href="#"> <i class="icon-th"></i> 我的路线</a> </li>
			<li class="bg_ls"> <a href="#"> <i class="icon-fullscreen"></i> 我的提问</a> </li>
			
			
			<li class="bg_lb span2"> <a href="#"> <i class="icon-pencil"></i>我的回答</a> </li>
			
			<li class="bg_ls span2"> <a href="#"> <i class="icon-tint"></i> 我的收藏</a> </li>
		  </ul>
		</div>
		</div>
	<!--End-Action boxes-->    
	
	<!--Chart-box-->    
		<div class="row-fluid" style="margin:0px 10px 5px 18px;width:1058">
		  <div class="widget-box">
			<div class="widget-title bg_lg"><span class="icon"><i class="icon-signal"></i></span>
			  <h5>个人简介</h5>
			</div>
			<div class="widget-content" >
			  <div class="row-fluid">
				<div class="span9">
				  <div class="chart">
					  <form action="#" method="post">
						  <div class="individual_img">
							  <div class="personImg">
							 
							  <img src="jsps/images/2.jpg"/><br/>
								</div>
							   <div class="individualName">
							  <span class="information_word">个性签名：</span><textarea name="individual" readonly >${session_user.u_desc}</textarea>
							  </div>
						  </div>
						  <div class="all_information">
							  <span class="information_word">昵称:</span><input style="height:30px" class="information"  type="text" name="username" readonly value="${session_user.u_name}"/><br/>
							  <span class="information_word">性别:</span><input style="height:30px" class="information" type="text" name="sex" readonly value="${session_user.u_sex}"/><br/>
							  <span class="information_word">电话:</span><input style="height:30px" class="information" type="text" name="telephone" readonly value="15092403902"/><br/>
							  <span class="information_word">邮箱:</span><input style="height:30px" class="information" type="text" name="email" readonly value="${session_user.u_email}"/><br/>
							  <span class="information_word">住址:</span><input style="height:30px" class="information" type="text" name="address" readonly value="青岛科技大学7#楼"/><br/>
							  <span class="information_word">单位:</span><input style="height:30px" class="information" type="text" name="work" readonly value="青岛科技大学"/><br/>				  
						  </div>
					 
					  </form>
				  </div>
				</div>
				<div class="span3" >
				  <ul class="site-stats">
					<li class="bg_lh"><i class="icon-user"></i> <strong>2540</strong> <small>粉丝数</small></li>
					<li class="bg_lh"><i class="icon-plus"></i> <strong>120</strong> <small>好友数 </small></li>
					<li class="bg_lh"><i class="icon-shopping-cart"></i> <strong>656</strong> <small>我的路线数目</small></li>
					<li class="bg_lh"><i class="icon-tag"></i> <strong>9540</strong> <small>我的回答数</small></li>
					<li class="bg_lh"><i class="icon-repeat"></i> <strong>10</strong> <small>收藏问题数</small></li>
					<li class="bg_lh"><i class="icon-globe"></i> <strong>8540</strong> <small>收藏路线数</small></li>
				  </ul>
				</div>
			  </div>
			</div>
		  </div>
		</div>
	<!--End-Chart-box--> 
		</div>
		
	<!--end-main-container-part-->
	<!-- 修改个人信息——遮罩层start -->
	
	<div class="re-theme-popover">
		 <div class="theme-poptit">
			  <a href="javascript:;" title="关闭" class="close"><h3>关闭×</h3></a>
			  <h3>修改个人信息</h3>
		 </div>
		 <div class="theme-popbod dform">
			   <form class="theme-signin" name="loginform" action="<c:url value='/PersonalCenterServlet'/>" method="post">
					<input type="hidden" name="method" value="quickUpdateInfor"/>
					
					<div class="edit_information" id="all_information">
							  <div><span class="information_word">昵称:</span><input style="height:30px" class="information"  type="text" name="u_name" id="username" value="${session_user.u_name}"/><span class="spanError" id="usernameError">${errors.username}</span></div>
							  <div><span class="information_word">性别:</span><input style="height:30px" class="information" type="text" name="u_sex" id="sex" value="${session_user.u_sex}"/><span class="spanError" id="sexError">${errors.sex}</span></div>
							  <div><span class="information_word">电话:</span><input style="height:30px" class="information" type="text" name="telephone" id="telephone" value="15092403902"/><span class="spanError" id="telephoneError"></span></div>
							  <div><span class="information_word">住址:</span><input style="height:30px" class="information" type="text" name="address" id="address" value="青岛科技大学7#楼"/><span class="spanError" id="homeError"></span></div>
							  <div><span class="information_word">单位:</span><input style="height:30px" class="information" type="text" name="work" id="work" value="青岛科技大学"/><span class="spanError" id="workError"></span></div>
							  <div><span class="information_word">密码:</span><input style="height:30px" class="information" type="text" name="u_pwd" id="password" value="${session_user.u_pwd}"/><span class="spanError" id="passwordError">${errors.password }</span></div>
							  <input class="btn btn-primary"  type="reset" id="reset" name="reset"  value=" 取消修改 " />
							  <input class="btn btn-primary editsubmit"  type="submit" id="submit" name="submit"  value=" 保存修改 " /><br/>
							  
					</div>
					
					
			   </form>
		 </div>
	</div>
	<div class="re-theme-popover-mask"></div>
	<!-- 修改个人信息——遮罩层end -->
	<!--Footer-part-->
	
	<div class="row-fluid">
	  <div id="footer" class="span12"> 2015 &copy; Engineer.
	   </div>
	</div>
	
		<!--end-Footer-part-->
  </body>
</html>
