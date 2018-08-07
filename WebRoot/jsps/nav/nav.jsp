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
<title>Engineer</title>

<!-- Le styles -->
<!-- 
<link
	href="<c:url value='/jsps/mainPage/css/bootstrap-combined.min.css" rel="stylesheet'/>">
<link
	href="<c:url value='/jsps/mainPage/css/layoutit.css" rel="stylesheet'/>">
 -->
<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
		<script src="<c:url value='/jsps/mainPage/js/html5shiv.js'/>"></script>
	<![endif]-->

<!-- Fav and touch icons -->
<!-- 
<link rel="shortcut icon"
	href="<c:url value='/jsps/mainPage/img/favicon.png'/>">
 -->
<!--[if lt IE 9]>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
	<![endif]-->
<link
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://cdn.bootcss.com/jquery/2.0.0/jquery.min.js"></script>
<script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body>
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<!-- class：navbar-header 表示向导航栏添加一个标题-->
			<div class="active navbar-header">
				<!-- data-toggle = collapse，表示添加响应式布局 -->
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#example-navbar-collapse">
					<span class="sr-only">切换导航</span> <span class="icon-bar"></span> <span
						class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
				<!-- a 元素标签会让文本看起来跟大写-->
				<a class="navbar-brand" href="#">Engineer</a>
			</div>
			<!--向 div 添加一个标题 class.nav, class.navbar-nav 无序列表即可-->
			<div class="collapse navbar-collapse" id="example-navbar-collapse">
				<ul class="nav navbar-nav">
					<li ><a
						href="<c:url value='/CategoryServlet?method=findHotTapic'/>">热门路线</a></li>
					<li><a href="<c:url value='/CategoryServlet?method=findAll'/>">标签</a></li>
					<li><a
						href="<c:url value='/QuestionServlet?method=findQForMainPlate'/>">有问有答</a></li>
					<li><a
						href="<c:url value='/PersonalCenterServlet?method=findUserInforById'/>">个人中心</a></li>
					<li>
					<li>
						<!-- 添加一个搜索框 -->
						<form class="navbar-form navbar-left" role="search">
							<div class="form-group">
								<input type="text" class="form-control" placeholder="Search">
							</div>
							<button type="submit" class="btn btn-default">提交</button>
						</form>
					</li>
					<!-- dropdown 二级列表 -->
					<li class="dropdown">
						<!--二级列表的标题--> <a href="#" class="dropdown-toggle"
						data-toggle="dropdown"> Java <b class="caret"></b>
					</a> <!--二级列表元素-->
						<ul class="dropdown-menu">
							<li><a href="#">个人中心</a></li>
							<li><a href="#">有问有答</a></li>
							<li><a href="#">Jasper Report</a></li>
							<!--添加分割线-->
							<li class="divider"></li>
							<li><a href="#">分离的链接</a></li>
							<li class="divider"></li>
							<li><a href="#">另一个分离的链接</a></li>
						</ul>
					</li>

				</ul>
				<ul class="nav navbar-nav navbar-right">
					<c:choose>
						<c:when test="${session_user==null}">
							<li><a href="<c:url value='/jsps/user/login.jsp'/>">登录</a></li>
							<li>
							<li><a href="<c:url value='/jsps/user/regist.jsp'/>">注册</a></li>
							<li></li>
						</c:when>
						<c:otherwise>
							<li><a href="<c:url value='/jsps/personal/personal.jsp'/>">${session_user.u_name }</a></li>
							<li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
	</nav>


	<!--导航-->

</body>
</html>
