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
    
    <title>My JSP 'error.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<script type='text/javascript'
	src="<c:url value='/jsps/Question/js/jquery-1.8.3.min.js' />"></script>
	
<script type="text/javascript">
$(window).resize(function(){ 
    $(".mydiv").css({ 
        position: "absolute", 
        left: ($(window).width() - $(".mydiv").outerWidth())/2, 
        top: ($(window).height() - $(".mydiv").outerHeight())/2 
    });        
}); 
$(function(){ 
    $(window).resize(); 
}); 
</script>


<style type="text/css">

.mydiv{ 
   width:300px;  
   height:200px;  
   position:absolute;  
   left:50%;  
   top:50%;  
   margin:-100px 0 0 -150px 
} 
.mydiv a{

text-decoration:none;

}
.mydiv a:hover{

color:#00CCCC;
}

</style>
  </head>
  
  <body>
  <div class="mydiv">
          出错啦<br>
     <a href="${url}"> 返回刚才的链接</a>
     </div>
  </body>
</html>
