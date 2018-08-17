<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Engineer</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
     <!-- start of sidebar -->
                                        <aside class="span4 page-sidebar">

                                               <c:choose>
											<c:when test="${session_user!=null }">	
                                                 <section class="widget">
                                                       <a href="<c:url value='/QuestionServlet?method=rediretAddQ'/>"> <div class="support-widget">
                                                                <h3 class="title">我要提问</h3>
                                                                <p class="intro">提出一个问题，得到的往往不仅仅是一个答案</p>
                                                        </div>
														</a>
                                                </section>
											</c:when>
											<c:otherwise>
											 <section class="widget">
                                                       <a href="<c:url value='/jsps/user/login.jsp'/>"> <div class="support-widget">
                                                                <h3 class="title">我要提问</h3>
                                                                <p class="intro">提出一个问题，得到的往往不仅仅是一个答案</p>
                                                        </div>
														</a>
                                                </section>
											</c:otherwise>
											</c:choose>




								
                                                <section class="widget"><h3 class="title">问题分类</h3>
                                                        <ul>
                                                        <c:forEach items="${categorys}" var="a">
                                                        <li><a href="<c:url value='/QuestionServlet?method=findQPlate&&plate='/>${a.getCtg_id()}" title="Lorem ipsum dolor sit amet,">${a.getCtg_name()}</a> </li>
                                                        </c:forEach>
                                                        
                                                        </ul>
                                                </section>

                                              
                                        </aside>
                                        <!-- end of sidebar -->
  </body>
</html>
