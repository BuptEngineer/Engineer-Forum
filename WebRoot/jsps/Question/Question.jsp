<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>Engineer</title>

<link rel="shortcut icon" href="images/favicon.png" />

<!-- Style Sheet-->
<link rel="stylesheet" href="<c:url value='/jsps/Question/style.css'/>" />
<link rel='stylesheet' id='bootstrap-css-css'
	href="<c:url value='/jsps/Question/css/bootstrap5152.css?ver=1.0'/>"
	type='text/css' media='all' />
<link rel='stylesheet' id='responsive-css-css'
	href="<c:url value='/jsps/Question/css/responsive5152.css?ver=1.0'/>"
	type='text/css' media='all' />
<link rel='stylesheet' id='pretty-photo-css-css'
	href="<c:url value='/jsps/Question/js/prettyphoto/prettyPhotoaeb9.css?ver=3.1.4'/>"
	type='text/css' media='all' />
<link rel='stylesheet' id='main-css-css'
	href="<c:url value='/jsps/Question/css/main5152.css?ver=1.0'/>"
	type='text/css' media='all' />
<link rel='stylesheet' id='custom-css-css'
	href="<c:url value='/jsps/Question/css/custom5152.html?ver=1.0'/>"
	type='text/css' media='all' />


<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
                <script src="js/html5.js"></script></script>
                <![endif]-->
<!-- script -->

<!-- 
<script type='text/javascript'
	src="<c:url value='/jsps/Question/js/jquery-1.8.3.min.js' />"></script>
	 -->
	 
<script type='text/javascript'
	src="<c:url value='/jsps/mainPage/js/jquery-2.0.0.min.js' />"></script>
	
	
	
<script type='text/javascript'
	src="<c:url value='/jsps/Question/js/jquery.easing.1.3.js' />"></script>
<script type='text/javascript'
	src="<c:url value='/jsps/Question/js/prettyphoto/jquery.prettyPhoto.js' />"></script>
<script type='text/javascript'
	src="<c:url value='/jsps/Question/js/jflickrfeed.js' />"></script>
<script type='text/javascript'
	src="<c:url value='/jsps/Question/js/jquery.liveSearch.js' />"></script>
<script type='text/javascript'
	src="<c:url value='/jsps/Question/js/jquery.form.js' />"></script>
<script type='text/javascript'
	src="<c:url value='/jsps/Question/js/jquery.validate.min.js' />"></script>
<script type='text/javascript'
	src="<c:url value='/jsps/Question/js/custom.js' />"></script>

<!--script-->



   <script type='text/javascript' src="<c:url value='/jsps/Question/js/checkA.js' />"></script>		





<style type="text/css">
.panel {
	height: 120px;
	display: none;
}
</style>
</head>
<body>
	<jsp:include page="../nav/nav.jsp"></jsp:include>
	<!-- Start of Page Container -->
	<div class="page-container">
		<div class="container">
			<div class="row">

				<!-- start of page content -->
				<div class="span8 page-content" style="width:600px;margin-left:150px" >

					<ul class="breadcrumb">
						<li><a href="<c:url value='/QuestionServlet?method=findQForMainPlate'/>">有问有答 </a><span class="divider">/</span></li>
						<li><a href="<c:url value='/QuestionServlet?method=findQPlate&&plate='/>${question.getCategory().getCtg_id()}" title="点击查看详情">${question.getCategory().getCtg_name()}</a> <span
							class="divider">/</span></li>
						<li class="active">${question.getQ_name() }</li>
					</ul>

					<article class=" type-post format-standard hentry clearfix">

					<h1 class="post-title">
						<a>${question.getQ_name() }</a>
					</h1>

					<div class="post-meta clearfix">
						<span class="date">${question.getQ_time() }</span> <span class="category"><a
							href="<c:url value='/QuestionServlet?method=findQPlate&&plate='/>${question.getCategory().getCtg_id()}" title="查看该类下的问题">${question.getCategory().getCtg_name() }</a></span>
						<span class="comments"><a>${question.getA_num() }
								回答</a></span>		
								
					</div>
					<!-- end of post meta -->${question.getQ_desc() } </article>

					<hr style="border:1px solid #CCCCCC">


					<section id="comments">

					<h3 id="comments-title">回答区：</h3>

					<ol class="commentlist">
					
					
					
								
								
					<!-- 将登录用户的回答置顶 -->
					<c:forEach items="${answer}" var="a">
					 <c:if test="${a.getUser().getU_id()==session_user.getU_id()}">
						<!--   单个例子     -->
						<li class="comment even thread-even depth-1" id="li-comment-2">
							<article id="comment-2"> <a href="#"> <img
							alt="用户没有上传头像"	src=" ${a.getUser().getU_img() }" class="avatar avatar-60 photo" height="60"
								width="60">
							</a>

							<div class="comment-meta">
								<h5 class="author">
									<cite class="fn"> <a href="#" rel="external nofollow"
										class="url">${a.getUser().getU_name() }</a>
									</cite> 
									
								</h5>
								<p class="date">
									<time datetime="2013-02-26T13:18:47+00:00">${a.getA_time() }</time>
								</p>
								<div style="margin-left:4px;float:right;" ><a id="dltLink" class="comment-reply-link" title="用户只可以删除自己的回答"
							 href="javascript:dlt(${a.getA_id()},${question.getQ_id()});">删除</a></div>
							 
								<div style="margin-left:4px;float:right;" ><a href="javascript:updateA(${a.getA_id()},${question.getQ_id()});"> 修改</a></div>
								
								
							</div>
							<!-- end .comment-meta -->
							
							
							
							<!-- 隐藏的域 -->
							
							<form action="<c:url value='/QuestionServlet?method=updateAnswer&&q_id=${question.getQ_id() }&&a_id=${a.getA_id() }'/>" method="post" id="form2" 
							style="display:none"
							 >

							<div>
								<textarea class="span8" name="newAdesc" id="newAdesc" cols="58"
									rows="10" style="width:100%;height:100px" placeholder="最多可输入300个字" onBlur="NcheckDesc()" >${a.getA_content() } </textarea>
							</div>
							<div style="float:right;margin-left:10px">
								<input type="button" name="NsubmitBtn" id="NsubmitBtn" onClick="Nfsend()" value="保存修改">
							</div>
							<div style="float:right;">
								<input type="button" name="NsubmitBtn" id="NsubmitBtn" onClick="giveup()" value="放弃修改">
							</div>
						</form>
							<!-- 隐藏的域 -->
							
							<div id="a_content" class="comment-body" style="width:500px;"><span style="width:20px;">${a.getA_content() }</span>
							
							</div>
							<!-- end of comment-body --> </article>
							<!-- end of comment -->

							<ul class="children">

								<li
									class="comment byuser comment-author-saqib-sarwar bypostauthor odd alt depth-2"
									id="li-comment-3"></li>
							</ul>
						</li>
					<!--   单个例子     -->
					</c:if>
							</c:forEach>
					
					<!-- 将登录用户的回答置顶 -->
					
					
					
					
					<!-- 将其他的放在后面 -->
					<c:forEach items="${answer}" var="a">
					<c:if test="${a.getUser().getU_id()!=session_user.getU_id()}"><!-- 通过和session中用户的u_id比较 -->
						<!--   单个例子     -->
						<li class="comment even thread-even depth-1" id="li-comment-2">
							<article id="comment-2"> <a href=""> <img
								alt=" ${a.getUser().getU_img() }" class="avatar avatar-60 photo" height="60"
								width="60">
							</a>

							<div class="comment-meta">

								<h5 class="author">
									<cite class="fn"> <a href="" rel="external nofollow"
										class="url">${a.getUser().getU_name() }</a>
									</cite> 
									
								</h5>

								<p class="date">

									<time datetime="2013-02-26T13:18:47+00:00">${a.getA_time() }</time>

								</p>

							</div>
							<!-- end .comment-meta -->

							<div class="comment-body">${a.getA_content() }</div>
							<!-- end of comment-body --> </article>
							<!-- end of comment -->

							<ul class="children">

								<li
									class="comment byuser comment-author-saqib-sarwar bypostauthor odd alt depth-2"
									id="li-comment-3"></li>
							</ul>
						</li>
					<!--   单个例子     -->
					
					</c:if>
							</c:forEach>




					</ol>
					
					<hr style="border:1px solid #CCCCCC">
					
					
					<!-- 我要回答 --> 
					<script type="text/javascript">
						$(document).ready(function() {
							
							$(".flip").click(function() {
								if(!IsAnswered())$(".panel").slideToggle("fast");
							});
						});
						
					</script>
					<div id="respond">

						<div class="cancel-comment-reply">
							<a rel="nofollow" id="cancel-comment-reply-link" href="#"
								style="display:none;">Click here to cancel reply.</a>
						</div>

<c:choose>
						<c:when test="${session_user!=null }">
						<div class="flip">
							<label style="color:#0066FF; font-size:15px; margin-bottom:10px"
								for="comment"><a>点此添加回答</a></label>
						</div>
						</c:when>
						<c:otherwise>
						<div >
							<label style="color:#0066FF; font-size:15px; margin-bottom:10px"
								for="comment"><a href="<c:url value='/jsps/user/login.jsp'/>">点此添加回答</a></label>
						</div>
						</c:otherwise>
						</c:choose>

						
						<div class="panel">
						<form action="<c:url value='/QuestionServlet?method=addAnswer&&q_id='/>${question.getQ_id() }" method="post" id="form1" >

							<div>
								<textarea class="span8" name="Adesc" id="Adesc" cols="58"
									rows="10" style="width:100%;height:100%" placeholder="最多可输入300个字" onBlur="checkDesc()" ></textarea>
							</div>
							<div style="float:right;">
								<input type="button" name="" id="submitBtn" onClick="fsend()" value="提交回答">
							</div>
						</form>
						</div>
					</div>

					</section>
					<!-- end of comments -->

				</div>
				<!-- end of page content -->


				<!-- start of sidebar -->
				<jsp:include page="Right/right.jsp">
				<jsp:param value="${categorys}" name="categorys"/>
				</jsp:include>
				<!-- end of sidebar -->
			</div>
		</div>
	</div>
	<!-- End of Page Container -->
	<a href="#top" id="scroll-top"></a>

	<jsp:include page="../footer/footer.jsp"></jsp:include>
</body>
</html>