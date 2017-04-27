<%@page import="com.qust.engineer.utils.PageBean"%>
<%@page import="com.qust.engineer.entity.Question" %>
<%@page import="com.qust.engineer.entity.Category" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<jsp:useBean id="myBean" class="com.qust.engineer.utils.PageBean"></jsp:useBean>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<%
  PageBean pb = new PageBean();
  
  //String url = request.getScheme()+"://"+
   //request.getServerName()+request.getRequestURI()+"?"+request.getQueryString();
   
   
   Category plate = (Category)request.getAttribute("category");
   String url = "http://localhost:8080/engineer/QuestionServlet?method=findQPlate&&plate="+plate.getCtg_id();
  pb.setUrl(url);
  
  List<Question> plateQ = new ArrayList<Question>();
  plateQ =(List<Question>)request.getAttribute("plateQ");
  
  pb.setBeanList(plateQ);
  
  pb.setPc(1);
  pb.setPs(2);
  pb.setTr(plateQ.size());
  request.setAttribute("pb", pb);
  
  if(request.getParameter("pc")!=null){
		int i=Integer.valueOf(request.getParameter("pc"));
		pb.setPc(i);
	}
  
 %>

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
<script type='text/javascript'	src="<c:url value='/jsps/Question/js/custom.js' />"></script>
<!--script-->


</head>

<body>

	<jsp:include page="../nav/nav.jsp"></jsp:include>
	<!-- Start of Page Container -->
	<div class="page-container">
		<div class="container">
			<div class="row">

				<!-- start of page content -->
				<div class="span8 main-listing"  style="width:600px;margin-left:150px">


					<div class="row-fluid top-cats">
						<section class="span4">
						<h4 class="category">
							<a href="<c:url value='/QuestionServlet?method=findQPlate&&plate='/>${category.getCtg_id()}">${category.getCtg_name() }</a>
						</h4>
						</section>
					</div>
					<hr>
					
					
					
					<!-- ------分---------页--------start--------- -->
					
					<div class="divBody">

<!-- -----输出表单中的内容-----start---- -->
	<c:forEach items="${pb.beanList}"  var="a" begin="${pb.getPc()*pb.getPs()-pb.getPs()}" end="${pb.getPc()*pb.getPs()}" >
	<article class="format-standard type-post hentry clearfix">
					<header class="clearfix">
					<h3 class="post-title">
						<a href="<c:url value='/QuestionServlet?method=findQA&&q_id='/>${a.getQ_id()}">${a.getQ_name() }</a>
					</h3>
					<div class="post-meta clearfix">
						<span class="date">${a.getQ_time()}</span> <span class="category"><a
							href="<c:url value='/QuestionServlet?method=findQPlate&&plate='/>${category.getCtg_id()}" title="点击查看详情">${category.getCtg_name()}</a></span>
						<span class="comments"><a>${a.getA_num() } 回复</a></span>
					</div>
					<!-- end of post meta --> </header>
					<p>
						${a.getQ_desc() } <a class="readmore-link"
							href="<c:url value='/QuestionServlet?method=findQA&&q_id='/>${a.getQ_id()}">Read
							more</a>
					</p>
					</article>
	</c:forEach>
<!-- -----输出表单中的内容------end--- -->
	
	
  <div class="divContent">
    
    
    <%--上一页 --%>
<c:choose>
	<c:when test="${pb.pc eq 1 }"><a class="btn active">上一页</a></c:when>
	<c:otherwise><a href="${pb.url }&pc=${pb.pc-1}" class="btn">上一页</a></c:otherwise>
</c:choose>
        <!-- 上一页 -->
     


<!-- 计算  start -->

<%--我们需要计算页码列表的开始和结束位置，即两个变量begin和end
计算它们需要通过当前页码！
1. 总页数不足6页--> begin=1, end=最大页
2. 通过公式设置begin和end，begin=当前页-1，end=当前页+3
3. 如果begin<1，那么让begin=1，end=6
4. 如果end>tp, 让begin=tp-5, end=tp
 --%>
 <c:choose>
 	<c:when test="${pb.tp <= 6 }">
 		<c:set var="begin" value="1"/>
 		<c:set var="end" value="${pb.tp }"/>
 	</c:when>
 	<c:otherwise>
 		<c:set var="begin" value="${pb.pc-2 }"/>
 		<c:set var="end" value="${pb.pc + 3}"/>
 		<c:if test="${begin < 1 }">
 		  <c:set var="begin" value="1"/>
 		  <c:set var="end" value="6"/>
 		</c:if>
 		<c:if test="${end > pb.tp }">
 		  <c:set var="begin" value="${pb.tp-5 }"/>
 		  <c:set var="end" value="${pb.tp }"/>
 		</c:if> 		
 	</c:otherwise>
 </c:choose>
 
 <!-- 计算  end -->
 
 
 
 
 <!-- 显示页号 start-->
 <c:forEach begin="${begin }" end="${end }" var="i">
   <c:choose>
   	  <c:when test="${i eq pb.pc }">
   	    <a class="btn active">${i }</a>
   	  </c:when>
   	  <c:otherwise>
   	    <a href="${pb.url }&pc=${i}" class="btn">${i }</a>
   	  </c:otherwise>
   </c:choose>
 </c:forEach>
 <!-- 显示页号 end-->
 
 
 
 
 
 
    <%-- 计算begin和end --%>
      <%-- 如果总页数<=6，那么显示所有页码，即begin=1 end=${pb.tp} --%>
        <%-- 设置begin=当前页码-2，end=当前页码+3 --%>
          <%-- 如果begin<1，那么让begin=1 end=6 --%>
          <%-- 如果end>最大页，那么begin=最大页-5 end=最大页 --%>


    
    <%-- 显示点点点 start--%>
    <c:if test="${end < pb.tp }">
      <span class="spanApostrophe">...</span>
    </c:if> 
 	<%-- 显示点点点 end --%>
    
    
    
     <%--下一页  start --%>
<c:choose>
	<c:when test="${pb.pc eq pb.tp }"><a class="btn active">下一页</a></c:when>
	<c:otherwise><a href="${pb.url }&pc=${pb.pc+1}" class="btn">下一页</a></c:otherwise>
</c:choose>
        <%--下一页 end --%>
    
    
    
    
  </div>
</div>
					
					<!-- ------分---------页---------end---------- -->
					

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