<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>添加帖子</title>
</head>
<body>
	<jsp:include page="../components/navbar.jsp">
		<jsp:param value="${categorys}" name="categorys" />
	</jsp:include>
	<div class="container">
		<div class="raw">
			<div class=" col-md-9">
				<div class="panel panel-default ">
					<div class="panel-body">
						<div class="col-md-2">
							<h3 class="text-left">${checkUser.uName }</h3>
							<p class="text-left">
								<a href="#">
									<c:if test="${checkUser.uOnline ==true}">
										在线
									</c:if>
									<c:if test="${checkUser.uOnline ==false}">
										离线
									</c:if>
								</a>
							</p>
						</div>
						<div class="col-md-10" style="border-left: 1px solid #ccc;">
							<div class="clearfix" style="margin-bottom: 4%;"></div>
							<p class="text-left text-muted">Engineer 编号 ${checkUser.uId }， 加入于
								${uDate}</p>
							<p class="text-muted">活跃度排名：${active}</p>
						</div>
					</div>
				</div>
				<!-- 回复-开始 -->
				<div class="panel panel-default">
					<div class="panel-body">
						<ul id="myTab" class="nav nav-tabs">
							<li class="active"><a href="#home" data-toggle="tab"> 设置
							</a></li>
							<li><a href="#posts" data-toggle="tab">帖子</a></li>
							<li><a href="#replies" data-toggle="tab">回复</a></li>
						</ul>

						<!-- 分页导航的内容 -->
						<div id="myTabContent" class="tab-content">
							<div class="tab-pane fade in active" id="home">
								<div class="clearfix" style="margin-bottom: 2%;"></div>
								<form id="addCtg-form"
									class="form-horizontal col-md-offset-2 col-md-8"
									action="loginVerification" method="post">

									<!-- 修改邮箱 开始 -->
									<label for="firstname" class="col-md-12 text-center">修改邮箱</label>
									<label for="firstname" class="col-md-2 control-label">邮箱</label>
									<div class="col-md-10">
										<input type="text" id="className" name="title"
											value="sa@q.com" class="form-control" placeholder="邮箱">
										<span id="titleError" class="help-block"></span>
									</div>
									<!-- 修改邮箱 结束 -->

									<!-- 修改密码 开始 -->
									<label for="firstname" class="col-md-12 text-center">修改密码</label>
									<label for="firstname" class="col-md-2 control-label">原密码</label>
									<div class="col-md-10">
										<input type="text" id="className" name="title"
											value="${form.u_email}" class="form-control"
											placeholder="原密码"> <span id="titleError"
											class="help-block"></span>
									</div>
									<label for="firstname" class="col-md-2 control-label">新密码</label>
									<hr>
									<div class="col-md-10">
										<input type="text" id="className" name="title"
											value="${form.u_email}" class="form-control"
											placeholder="新密码"> <span id="titleError"
											class="help-block"></span>
									</div>
									<label for="firstname" class="col-md-2 control-label">确认</label>
									<div class="col-md-10">
										<input type="text" id="className" name="title"
											value="${form.u_email}" class="form-control"
											placeholder="确认新密码"> <span id="titleError"
											class="help-block"></span>
									</div>
									<div class="col-sm-offset-2 col-sm-10">
										<button id="submitBtn" type="submit"
											class="btn btn-primary btn-lg btn-block">提交</button>
									</div>
									<!-- 修改密码 结束-->
								</form>
							</div>
							<div class="tab-pane fade" id="posts">
								<!-- 单个帖子 开始 -->
								<hr>
								<div>
									<p>
									<a href="#">什么都懂但是都不精通真的有前途吗(´_ゝ`)</a>
									</p>
									<p>
										标签：<a href="#">程序员</a> | 最新回复时间：<a
											class="text-muted">2 分钟前</a> | 回复数：<span class="badge">150</span>
									</p>
								</div>
								<!-- 单个帖子结束 -->
								<!-- 单个帖子 开始 -->
								<hr>
								<div>
									<p>
									<a href="#">什么都懂但是都不精通真的有前途吗(´_ゝ`)</a>
									</p>
									<p>
										标签：<a href="#">程序员</a> | 最新回复时间：<a
											class="text-muted">2 分钟前</a> | 回复数：<span class="badge">150</span>
									</p>
								</div>
								<!-- 单个帖子结束 -->
							</div>
							<div class="tab-pane fade" id="replies">
								<!-- 单个评论 开始 -->
								<hr>
								<div>
									<p class="text-left">
										回复的主题 : <a href="#"><strong>青春在哪里</strong> </a> | 时间 : <span
											class="text-muted">20 小时 3 分钟前</span>
									</p>
									<p>
										<!-- 回复内容 -->
										刚毕业，js css html 基本上都掌握，不会 js 框架。当初想做前端，无奈进了个公司要求全栈， 还是.net
										的全栈。幸好大学有 c#基础，工作并不是很吃力。
									</p>
								</div>
								<!-- 单个评论 结束 -->
								<!-- 单个评论 开始 -->
								<hr>
								<div>
									<p class="text-left">
										回复的主题 : <a href="#"><strong>青春在哪里</strong> </a> | 时间 : <span
											class="text-muted">20 小时 3 分钟前</span>
									</p>
									<p>
										<!-- 回复内容 -->
										刚毕业，js css html 基本上都掌握，不会 js 框架。当初想做前端，无奈进了个公司要求全栈， 还是.net
										的全栈。幸好大学有 c#基础，工作并不是很吃力。
									</p>
								</div>
								<!-- 单个评论 结束 -->
							</div>
						</div>
						<!-- 分页导航的内容 -->

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