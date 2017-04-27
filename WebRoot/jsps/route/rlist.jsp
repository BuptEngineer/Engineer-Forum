<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>分类下的学习经验</title>
<link href="<c:url value='/jsps/css/bootstrap.min.css'/>"
	rel="stylesheet">
<link href="<c:url value='/jsps/css/route/rlist.css'/>" type="text/css"
	rel="stylesheet">
<script type="text/javascript"
	src="<c:url value='/js/jquery-1.11.1.min.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/jsps/js/route/rlist.js'/>"></script>
</head>
<body>
	<jsp:include page="../nav/nav.jsp"></jsp:include>
	<div class="container-fluid r-add-body">
		<div class="row">
			<div class="col-md-8 col-xs-8">
				<h3 class="h3">
					<a href="#" class="a cate-img"><img
						src="<c:url value='/${category.ctg_img }'/>" class="img-circle" /></a>
					<div class="cate-name">
						<i class="glyphicon glyphicon-tag" aria-hidden="true"></i> <a
							href="#" class="a">${category.ctg_name }</a>
						<p class="route-num">一共有123条经验分享</p>
					</div>
				</h3>
				<div class="row" id="routeItems"
					style="clear:both;min-height:300px;">
					<c:forEach items="${category.routes }" var="r">
						<div class="route-item">
							<div class="user-route">
								<div class="user-img">
									<a href="#"><img class="img-circle" src="user.jpg" /></a>
								</div>
								<div class="col-xs-11">
									<div class="ru-info">
										<p class="col-md-10 margin-bottom-small" style="padding:0">
											<a
												href="<c:url value='RouteServlet?method=find&rt_id=${r.rt_id }'/>"
												class="route-name">${r.rt_name}</a>
										</p>
										<p class="col-md-2 margin-bottom-small">
											<i class="glyphicon glyphicon-thumbs-up"></i><strong>12</strong>
										</p>
									</div>
									<p class="user-info">
										<a href="#">${r.user.u_name }</a>，<span>
											${r.user.u_desc }</span>
									</p>
								</div>
							</div>
							<div class="route-desc">
								${r.rt_desc } <a
									href="<c:url value='RouteServlet?method=find&rt_id=${r.rt_id }'/>"
									class="alert-link">查看更多</a>
							</div>
							<p class="col-md-offset-1">
								<span class="time">${r.rt_time }</span> <span
									class="col-md-offset-1 time">评论数：12</span>
							</p>
						</div>

					</c:forEach>

					<div class="route-item">
						<div class="user-route">
							<div class="user-img">
								<a href="#"><img class="img-circle"
									src="<c:url value='/jsps/images/user.jpg'/>" /></a>
							</div>
							<div class="col-xs-11">
								<div class="ru-info">
									<p class="col-md-10 margin-bottom-small" style="padding:0">
										<a href="#" class="route-name">如何有效的使用Engineer这个网站，并在其中获得大量粉丝</a>
									</p>
									<p class="col-md-2 margin-bottom-small">
										<i class="glyphicon glyphicon-thumbs-up"></i><strong>12</strong>
									</p>
								</div>
								<p class="user-info">
									<a href="#">管理员王小二</a>，<span> 我是一个傻大白，傻啊傻大白。</span>
								</p>
							</div>
						</div>
						<div class="route-desc">
							首先，这个网站时傻瓜式操作的，简单易用。下面我来教教大家如何使用。至于后半个问题，您还是多读读书吧！ <a href="#"
								class="alert-link">查看更多</a>
						</div>
						<p class="col-md-offset-1">
							<span class="time">2016-1-1</span> <span
								class="col-md-offset-1 time">评论数：12</span>
						</p>
					</div>
				</div>
				<p id="js-load-more" class="btn-more">查看更多</p>
					<input type="hidden" name="ctg_id" value="${category.ctg_id }" />
			</div>
		
		<!-- 以下是右侧的 -->
		<div class="col-md2 col-xs-3">
			<div class="follow">
				<a href="#" class="btn btn-primary">关注此标签</a>
			</div>
			<div class="follow">
				<a
					href="<c:url value='/jsps/route/add.jsp?ctg_id=${category.ctg_id }&ctg_name=${category.ctg_name }'/>"
					class="btn btn-primary">添加学习经验</a>
			</div>
			<div class="cate-desc">
				<h4 class="h4">
					标签描述
					</h4>
					<p class="panel panel-default">${category.ctg_desc }</p>
			</div>
		</div>

	</div>
</div>
</body>
</html>


