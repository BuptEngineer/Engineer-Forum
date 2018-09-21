<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Engineer</title>
<link rel="shortcut icon"
	href="<c:url value='/resource/imgs/favicon.png'/>">
<style>
.img-caption-h3 {
	/* h3 18.72px, 100 - 18.72 = 81.28 */
	margin-top: -80px;
	margin-bottom: 55px;
	margin-left: 10%;
	color: white;
}
</style>
</head>

<jsp:include page="../components/navbar.jsp">
	<jsp:param value="${categorys}" name="categorys" />
</jsp:include>

<!-- 看 https://www.csdn.net/ 的首页就行 -->
<!-- 图从 http://science.sciencemag.org/-->

<div class="container">
	<div class="col-md-9">
	
		<div class="col-md-12">
			<c:forEach items="${postsLink }" var="p" varStatus="loop">
				<div class="thumbnail">
					<div class="caption">
						<a href="<c:url value='/posts/show'/>">
							<h4>${p.pName }</h4>
						</a>
						<p>${p.pDesc }</p>
						<p>
						标签：<a href="#">${categoriesLink[loop.count-1].ctgName }</a> | 
						作者：<a href="<c:url value='/user/personal'/>?uname=${usersLink[loop.count-1].uName }">${usersLink[loop.count-1].uName }</a> | 上次回复时间：<a class = "text-muted">2
							分钟前</a> | 回复数：<span class="badge">150</span>
						</p>
					</div>
				</div>
			</c:forEach>
	</div>
	</div>
	<div class="col-md-3">
	<!-- right -->
		<jsp:include page="../components/right.jsp">
			<jsp:param value="${categorys}" name="categorys" />
		</jsp:include>
	</div>
</div>

<div class="clearfix" style="margin-bottom: 10px;"></div>
<!-- 清除浮动 -->

<!-- 抄 https://www.csdn.net/ 的首页就行 -->
<!-- 图从 http://science.sciencemag.org/ 找就行-->

<jsp:include page="../components/footer.jsp">
	<jsp:param value="${categorys}" name="categorys" />
</jsp:include>