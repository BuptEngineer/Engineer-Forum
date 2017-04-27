<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="title" content="LayoutIt! - Bootstrap可视化布局系统">
<meta name="description" content="LayoutIt! 可拖放排序在线编辑的Bootstrap可视化布局系统">
<meta name="keywords" content="可视化,布局,系统">
<title>Engineer</title>

<!-- Le styles -->
<link
	href="<c:url value='/jsps/mainPage/css/bootstrap-combined.min.css" rel="stylesheet'/>">
<link
	href="<c:url value='/jsps/mainPage/css/layoutit.css" rel="stylesheet'/>">

<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
		<script src="<c:url value='/jsps/mainPage/js/html5shiv.js'/>"></script>
	<![endif]-->

<!-- Fav and touch icons -->
<link rel="shortcut icon"
	href="<c:url value='/jsps/mainPage/img/favicon.png'/>">

<!--[if lt IE 9]>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
	<![endif]-->



</head>

<body>
	<!--导航-->

	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container-fluid">
				<button data-target=".nav-collapse" data-toggle="collapse"
					class="btn btn-navbar" type="button">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="brand" href="<c:url value='/jsps/mainPage/mainPage.jsp'/>"><img
					src="<c:url value='/jsps/mainPage/img/favicon.png'/>">Engineer<span
					class="label"></span></a>
				<div class="nav-collapse collapse">


					<ul class="nav" id="menu-layoutit">
						<li class="divider-vertical"></li>
						<li style=" height: 45px;">
							<form class="form-search">
								<input class="input-medium search-query"
									style="height:20px;width:150px" type="text" />
								<button class="btn btn-primary" contenteditable="true"
									type="submit">搜索</button>
							</form>
						</li>
						<li><a href="<c:url value='/CategoryServlet?method=findHotTapic'/>" style="color:#ffffff;" target="_blank">热门路线</a></li>
						<li><a href="<c:url value='/CategoryServlet?method=findAll'/>" style="color:#ffffff;" target="_blank">标签</a></li>
						<li><a href="<c:url value='/QuestionServlet?method=findQForMainPlate'/>"
							style="color:#ffffff;">有问有答</a></li>
						<li><a href="<c:url value='/PersonalCenterServlet?method=findUserInforById'/>"
							style="color:#ffffff;">个人中心</a></li>
						<li>
					</ul>


					 <c:choose>
					<c:when test="${session_user==null}">
					<ul class="nav pull-right">
						<li><a href="<c:url value='/jsps/user/login.jsp'/>"
							style="color:#ffffff;">登录</a></li>
						<li>
						<li><a href="<c:url value='/jsps/user/regist.jsp'/>"
							style="color:#ffffff;">注册</a></li>
						<li></li>
					</ul>
					</c:when>
					<c:otherwise>
					<ul class="nav pull-right">
						<li><a href="<c:url value='/jsps/personal/personal.jsp'/>"
							style="color:#ffffff;">${session_user.u_name }</a></li>
						<li>
					</ul>
					
					</c:otherwise>
					</c:choose>

				</div>
				<!--/.nav-collapse -->
			</div>
		</div>
	</div>


	<!--导航-->

</body>
</html>
