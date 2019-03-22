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
				<!-- 正文-开始 -->
				<div class="col-md-12">
					<div class="thumbnail">
						<div class="caption ">
							<!-- 面包屑导航 -->
							<ol class="breadcrumb">
								<li><a href="#">Engineer</a></li>
								<li class="active"><a href="#">程序员</a></li>
							</ol>
							
							<h2>什么都懂但是都不精通真的有前途吗(´_ゝ`)</h2>
							<p>
								作者：<a href="#">babedoll</a> | 发帖时间：<a class="text-muted">2
									分钟前</a>
							</p>
							<hr>
							<p>自古程序与产品难“两立” 前阵子就有程序猿因为需求与产品经理干架 [要求用户 app
								的主题颜色能根据手机壳自动调整] 看看旁边女程序媛节节败退的发际线，曾是程序猿的小编忍不住内心一阵骚动
								正在沉思时，眼帘闯入一个人影——产品经理跑过来喊开 sprint 会议
								小编突然想到一个话题：如果现在角色反转，今天你是产品经理，你能想到的最跪的需求是什么？ YY
								反戈！大家脑洞大开一下，留言有惊喜礼品赠送哦! [举例] 俺们家是做企业直播、点播视频服务的，我会给程序猿（产品经理）提需求：

								用户做教育直播比如日语场景练习，用投息成影技术，实现新垣结衣与你面对面交流。

								做财经讲股直播，最后加彩蛋，系统自动梳理输出股票未来走势。

								做培训直播，根据用户意念把讲师的声纹变成用户想听的人的声音，比如石原里美。。。</p>
							<p>自古程序与产品难“两立” 前阵子就有程序猿因为需求与产品经理干架 [要求用户 app
								的主题颜色能根据手机壳自动调整] 看看旁边女程序媛节节败退的发际线，曾是程序猿的小编忍不住内心一阵骚动
								正在沉思时，眼帘闯入一个人影——产品经理跑过来喊开 sprint 会议
								小编突然想到一个话题：如果现在角色反转，今天你是产品经理，你能想到的最跪的需求是什么？ YY
								反戈！大家脑洞大开一下，留言有惊喜礼品赠送哦! [举例] 俺们家是做企业直播、点播视频服务的，我会给程序猿（产品经理）提需求：

								用户做教育直播比如日语场景练习，用投息成影技术，实现新垣结衣与你面对面交流。

								做财经讲股直播，最后加彩蛋，系统自动梳理输出股票未来走势。

								做培训直播，根据用户意念把讲师的声纹变成用户想听的人的声音，比如石原里美。。。</p>
						</div>
					</div>
					<!-- 正文-结束 -->
					
					
					<!-- 评论-开始 -->
					<div class="thumbnail">
						<div class="caption ">
							<p>
								回复数：<span class="badge">150</span> | <a href="#replyAnchor">添加回复</a>
							</p>
							<hr>
							<!-- 单个评论 开始 -->
							<div>
								<p class="text-left">
									作者 : <a href="#"><strong>AustinHUANG</strong> </a> | 时间 : <span
										class="text-muted">20 小时 3 分钟前</span> | <a href="#replyAnchor">回复</a>
								</p>
								<p>
									<!-- 回复内容 -->
									刚毕业，js css html 基本上都掌握，不会 js 框架。当初想做前端，无奈进了个公司要求全栈， 还是.net
									的全栈。幸好大学有 c#基础，工作并不是很吃力。
								</p>
							</div>
							<!-- 单个评论 结束 -->
							<hr>
							<div>
								<p class="text-left">
									作者 : <a href="#"><strong>AustinHUANG</strong> </a> | 时间 : <span
										class="text-muted">20 小时 3 分钟前</span> | <a href="#replyAnchor">回复</a>
								</p>
								<p>
									<!-- 回复内容 -->
									刚毕业，js css html 基本上都掌握，不会 js 框架。当初想做前端，无奈进了个公司要求全栈， 还是.net
									的全栈。幸好大学有 c#基础，工作并不是很吃力。
								</p>
							</div>
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