<%@page import="com.qust.engineer.entity.Question"%>
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

<script type='text/javascript'
	src="<c:url value='/jsps/Question/js/jquery-1.8.3.min.js' />"></script>
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

</head>

<body>

	<jsp:include page="../nav/nav.jsp"></jsp:include>

	<!-- Start of Page Container -->
	<div class="page-container">
		<div class="container">
			<div class="row">

				<!-- start of page content -->
				<div class="span8 page-content">

					<div class="row-fluid top-cats">
						<section class="span4">
						<h4 class="category">
							<a href="<c:url value='/QuestionServlet?method=findQForMainPlate'/>">有问有答</a>
						</h4>
						</section>
					</div>


					<hr style="border:1px solid #CCCCCC">
					<!-- Basic Home Page Template -->
					<div class="row separator">
						<section class="span4 articles-list">
						<h3>热门问题</h3>
						<ul class="articles">
							<c:forEach items="${hot10Q}" var="a">
		   								<li class="article-entry standard">
								<h4>
									<a href="<c:url value='/QuestionServlet?method=findQA&&q_id='/>${a.getQ_id()}" title="点击查看">${a.getQ_name()}</a>
								</h4> <span class="article-meta">${a.getQ_time() }   
								from<a href="<c:url value='/QuestionServlet?method=findQPlate&&plate='/>${a.getCategory().getCtg_id()}"title="点击查看">
								${a.getCategory().getCtg_name()} 
										</a></span>
										</li>
								</c:forEach>
						</ul>
						</section>

						<section class="span4 articles-list">
						<h3>最近问题</h3>
						<ul class="articles">
						
						<c:forEach items="${new10Q}" var="a">
								<li class="article-entry standard">
								<h4>
									<a href="<c:url value='/QuestionServlet?method=findQA&&q_id='/>${a.getQ_id()}">${a.getQ_name()}</a>
								</h4> <span class="article-meta">${a.getQ_time() }   
								from<a href="<c:url value='/QuestionServlet?method=findQPlate&&plate='/>${a.getCategory().getCtg_id()}"title="点击查看">
								${a.getCategory().getCtg_name()} 
										</a></span>
										</li>
		   							
							</c:forEach>
							
							
						</ul>
						</section>
					</div>

					<div class="row home-category-list-area">
						<div class="span8">
							<h2>各类技术社区</h2>
						</div>
					</div>

					<div class="row-fluid top-cats">


						<c:forEach items="${categorys}" var="a" begin="0" end="2">
						<!-- 单个例子   -->
						<section class="span4">
						<h4 class="category">
							<a href="<c:url value='/QuestionServlet?method=findQPlate&&plate='/>${a.getCtg_id()}">${a.getCtg_name() }</a>
						</h4>
						<div class="category-description">
							<p>${a.getCtg_desc() }</p>
						</div>
						</section>
						<!-- 单个例子   -->
						</c:forEach>

					</div>

				</div>
				<!-- end of page content -->



				
				<jsp:include page="Right/right.jsp">
				<jsp:param value="${categorys}" name="categorys"/>
				</jsp:include>
				
				
			</div>
		</div>
	</div>
	<!-- End of Page Container -->
	<a href="#top" id="scroll-top"></a>
	<jsp:include page="../footer/footer.jsp"></jsp:include>
</body>
</html>
