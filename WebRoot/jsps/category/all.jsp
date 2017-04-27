<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>

<html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta charset="UTF-8">
<head>
<title>全部分类</title>
<link rel="stylesheet" href="<c:url value='/jsps/css/common.css'/>" type="text/css"/>
<link rel="stylesheet" href="<c:url value='/jsps/css/category/all.css'/>" type="text/css"/>

</head>

<body>
<jsp:include page="../nav/nav.jsp"></jsp:include>
<div id="all-cate-body">
	<div class="content">
		<h2 class="title-all all-cate-title">
			<i class="bt-icon title-img"></i>
				<span>全部分类</span>
		</h2>
		
		<div class="cate-items">
		
			<c:forEach items="${categorys }" var="c">
				<div class="cate-item">
					<a href="<c:url value='CategoryServlet?method=findRoutesByCtg&ctg_id=${c.ctg_id }'/>">
						<img src="<c:url value='/${c.ctg_img }'/>"/>
						<strong class="cate-name">${c.ctg_name }</strong>
					</a>
					<p class="cate-desc">${c.ctg_desc }</p>
				</div>
			</c:forEach>
			
		</div>
	</div>

</div>
</body>
</html>
