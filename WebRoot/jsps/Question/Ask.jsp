<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
	
   <script type='text/javascript' src="<c:url value='/jsps/Question/js/check.js' />"></script>		
	
<!--script-->


<!--下滑列表框-->
<script type="text/javascript">
	$(document).ready(function() {
		$(".flip").click(function() {
			$(".panel").slideToggle("slow");
		});
	});
</script>
<style type="text/css">
.panel {
	height: 120px;
	display: none;
}
</style>
<script type="text/javascript">

var t=${success};
if(t!=null)
if(t){
alert("问题添加成功!");
}
</script>
</head>

<body>


	<jsp:include page="../nav/nav.jsp"></jsp:include>


	<!-- Start of Page Container -->
	<div class="page-container">
		<div class="container">
			<div class="row">

				<!-- start of page content -->
				<div class="span8 page-content">

					<article class=" type-page  hentry clearfix">
					<h1 class="post-title">
						<a href="#">我要提问</a>
					</h1>

					<hr style="border:1px solid #CCCCCC">


					</article>

					<div id="respond">

						<h3>编辑问题</h3>

						<div class="cancel-comment-reply">
							<a rel="nofollow" id="cancel-comment-reply-link" href="#"
								style="display:none;">Click here to cancel reply.</a>
						</div>


						<form action="<c:url value='/QuestionServlet?method=addQ' />" method="post" id="form1">
							<div style="margin-bottom:5px;">
								<label for="url">选择问题分类</label> <select name="ctg_id">
									 <c:forEach items="${categorys}" var="a">								
									<option value="${a.getCtg_id()}">${a.getCtg_name() }</option>
									  </c:forEach>
								</select>
							</div>



							<div>
								<label for="url">问题标题</label> <input style="height:30px"
									class="span8" type="text" name="Qtitle" id="Qtitle" value=""
									size="22" onBlur="checkTitle()" placeholder="最多可输入25个字">
							</div>


							<div>
								<label for="comment">问题描述</label>
								<textarea class="span8" name="Qdesc" id="Qdesc" cols="58"
									rows="10" placeholder="最多可输入300个字" onBlur="checkDesc()"></textarea>
									<div style="float:right">
								<input type="button" name="" id="submitBtn" onClick="fsend()" value="提交问题">
							</div>
							</div>
						</form>

					</div>
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