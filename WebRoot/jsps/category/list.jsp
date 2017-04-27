<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta charset="UTF-8">
<head>
<title>分类</title>
<link rel="stylesheet" href="<c:url value='/jsps/css/common.css'/>" type="text/css"/>
<link rel="stylesheet" href="<c:url value='/jsps/css/category/list.css'/>" type="text/css"/>
</head>

<body>
<jsp:include page="../nav/nav.jsp"></jsp:include>
<div id="cbody">
	<div class="content">
		<div class="cate-all">
			<h3 class="title-all">
				<i class="bt-icon title-all-img"></i>
				<span>热门学习路线的动态</span>
			</h3>
			<div class="cate-all-container">
			
				<c:forEach items="${categorys }" var="c">
				<div class="cate-item">
					<div class="cate-img-div">
						<a href="<c:url value='/CategoryServlet?method=findRoutesByCtg&ctg_id=${c.ctg_id }'/>"><img  class="cate-img" src="images/cate1.jpg"/></a>
					</div>
					<div class="cate-item-content">
						<h4 class="cate-name h4"><a href="<c:url value='/CategoryServlet?method=findRoutesByCtg&ctg_id=${c.ctg_id }'/>">${c.ctg_name }</a></h4>
						<div class="cate_routes">
							
							<c:forEach items="${c.routes }" var="r">
								<p class="route-item"><a href="<c:url value='/RouteServlet?method=find&rt_id=${r.rt_id }'/>">${r.rt_name }</a><span class="time">${r.rt_time }</span></p>			
							</c:forEach>
							

						</div>
					</div>
				</div>
				
				</c:forEach>
				
				<div class="cate-item">
					<div class="cate-img-div">
						<a href="#"><img  class="cate-img" src="images/cate1.jpg"/></a>
					</div>
					<div class="cate-item-content">
						<h4 class="cate-name h4"><a href="#">计算机科学</a></h4>
						<div class="cate_routes">
							<p class="route-item"><a href="#">java高级工程师成长路线</a><span class="time">2016-1-1</span></p>
							<p class="route-item"><a href="#">说的v女生快乐的v能力师成长路线</a><span class="time">2016-1-1</span></p>
							<p class="route-item"><a href="#">linux高级工程垮了成长为能够师成长路线</a><span class="time">2016-1-1</span></p>
							<p class="route-item"><a href="#">java高级工程师成长路线</a><span class="time">2016-1-1</span></p>
							<p class="route-item"><a href="#">java高级工程师成长路线</a><span class="time">2016-1-1</span></p>
						</div>
					</div>
				</div>
				
				<p id="js-load-more" class="btn-more">查看更多</p>
			</div>
		</div>
		
		<div class="cate-my">
			<div class="find-all">
				<a href="<c:url value='/CategoryServlet?method=findAll'/>" class="see">看看所有的分类</a>
				<p>去看看更广阔的天地吧(。・_・)/~~~</p>
			</div>
			<div class="offen-go">
				<h4>常去板块</h4>
				<div class="cates-goes">
					<div class="cate-goes-item">
						<a href="#"><img class="cate-goes-img" src="images/cate1.jpg"/></a>
						<div class="goes-item-cnt">
							<a href="#" class="cate_link">JAVA WEB开发</a>
							<p class="route-num">46条学习路线</p>
						</div>
					</div>
					<div class="cate-goes-item">
						<a href="#"><img class="cate-goes-img" src="images/cate1.jpg"/></a>
						<div class="goes-item-cnt">
							<a href="#" class="cate_link">HTML5</a>
							<p class="route-num">46条学习路线</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</div>
</body>
</head>