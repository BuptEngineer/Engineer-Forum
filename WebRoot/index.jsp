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

<jsp:include page="components/navbar.jsp">
	<jsp:param value="${categorys}" name="categorys" />
</jsp:include>

<!-- 看 https://www.csdn.net/ 的首页就行 -->
<!-- 图从 http://science.sciencemag.org/-->

<div class="container">
	<div class="col-md-9">
		<div class="col-md-12">
			<div class="thumbnail">
				<div class="caption ">
					<a href="posts/show"><h4>什么都懂但是都不精通真的有前途吗(´_ゝ`)</h4></a>
					<p>
						按照正常的操作习惯，不是应该在最右侧吗? <a href="#">...更多</a>
					</p>
					<p>
						标签：<a href="#">程序员</a> | 作者：<a href="#">babedoll</a> | 上次回复时间：<a class = "text-muted">2
							分钟前</a> | 回复数：<span class="badge">150</span>
					</p>
				</div>
			</div>
			
			<div class="thumbnail">
				<div class="caption ">
					<a href="#"><h4>产品经理总喜欢把 Table 的 [操作栏] 设计在最左侧，是出于什么心态(´_ゝ`)</h4></a>
					<p>
						刚毕业，js css html 基本上都掌握，不会 js 框架。当初想做前端，无奈进了个公司要求全栈， 还是.net
						的全栈。幸好大学有 c#基础，工作并不是很吃力。 <a href="#">...更多</a>
					</p>
					<p>
						标签：<a href="#">程序员</a> | 作者：<a href="#">babedoll</a> | 上次回复时间：<a class = "text-muted">2
							分钟前</a> | 回复数：<span class="badge">150</span>
					</p>
				</div>
			</div>
		</div>
		<!--.... more-->
	</div>
	<div class="col-md-3">
	<!-- right -->
		<jsp:include page="components/right.jsp">
			<jsp:param value="${categorys}" name="categorys" />
		</jsp:include>
	</div>
</div>
<div class="clearfix" style="margin-bottom: 10px;"></div>
<!-- 清除浮动 -->

<!-- 抄 https://www.csdn.net/ 的首页就行 -->
<!-- 图从 http://science.sciencemag.org/ 找就行-->

<jsp:include page="components/footer.jsp">
	<jsp:param value="${categorys}" name="categorys" />
</jsp:include>

