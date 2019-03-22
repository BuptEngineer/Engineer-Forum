<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>添加帖子</title>
</head>
	<%
		Date d = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String now = df.format(d);
	%>
<body>
	<jsp:include page="../components/navbar.jsp">
		<jsp:param value="${categorys}" name="categorys" />
	</jsp:include>
	<div class="container">
		<div class="raw">
			<div class=" col-md-9">
				<!-- 正文-开始 -->
				<div class="col-md-12">
					<div class="thumbnail">
						<div class="caption ">
							<!-- 面包屑导航 -->
							<ol class="breadcrumb">
								<li><a href="#">Engineer</a></li>
								<li class="active"><a href="#">${post.category.ctgName}</a></li>
							</ol>
							
							<h2>${ post.pName}</h2>
							<p>
								作者：<a href="<c:url value='/user/personal'/>?uname=${post.user.uName}">${ post.user.uName}</a> | 发帖时间：<a class="text-muted">${post.pTime}<!-- 2分钟前--></a>
							</p>
							<hr>
							<p>
							${post.pDesc}
							</p>
						</div>
					</div>
					<!-- 正文-结束 -->
					
					
					<!-- 评论-开始 -->
					<div class="thumbnail">
						<div class="caption ">
							<p>
								回复数：<span class="badge">${post.replyList.size()}</span> | <a href="#replyAnchor">添加回复</a>
							</p>
							<hr>
							
							<c:forEach items ="${post.replyList}" var="reply">
							<!-- 单个评论 开始 -->
							<div>
								<p class="text-left">
									作者 : <a href="<c:url value='/user/personal'/>?uname=${reply.user.uName}"><strong>${reply.user.uName}</strong> </a> | 时间 : <span
										class="text-muted">${reply.rTime}<!-- 2分钟前--></span> | <a href="#replyAnchor">回复</a>
								</p>
								<p>
									${reply.rContent}
								</p>
							</div>
							<hr>
							 <!-- 单个评论 结束 -->
							</c:forEach>
							
						</div>
					</div>
					<!-- 评论-结束 -->
					
					<!-- 回复-开始 -->
					<div class="panel panel-default ">
						<div class="panel-body">
							<form id="addCtg-form" class="form-horizontal"
								action="loginVerification" method="post">
									<div class="col-md-12">
										<textarea class="form-control" rows="3" placeholder="回复内容，理智的回复是友谊的开端"></textarea>
										<span id="contentError" class="help-block"></span>
									</div>

									<div class="col-md-2">
										<button id="submitBtn" type="submit"
											class="btn btn-primary btn-lg btn-block btn-sm">回复</button>
											<a name="replyAnchor"></a> <!-- 锚点 -->
									</div>
									<div class = "col-md-10">
										<p class = "text-right "> <a href = "#topAnchor">返回顶部 ></a> </p>
									</div>
								<hr>
							</form>
						</div>
					</div>
				</div>
				<!-- 回复-结束 -->
			</div>
			<div class="col-md-3">
				<jsp:include page="../components/right.jsp">
					<jsp:param value="${categorys}" name="categorys" />
				</jsp:include>
			</div>
		</div>
	</div>
	<jsp:include page="../components/footer.jsp">
		<jsp:param value="${categorys}" name="categorys" />
	</jsp:include>

</body>
</html>