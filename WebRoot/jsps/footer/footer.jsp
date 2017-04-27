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
    
    <title>My JSP 'footer.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

<link href="<c:url value='/jsps/mainPage/css/bootstrap-combined.min.css" rel="stylesheet'/>">
<link href="<c:url value='/jsps/mainPage/css/layoutit.css" rel="stylesheet'/>">


  </head>
  
  <body>
    <!--footer-->
      <hr style="border:1px solid #CCCCCC" >
	<div class="container-fluid">
	<div class="row-fluid">
		<div class="span6">
			<img src="<c:url value='/jsps/mainPage/img/favicon.png'/>" >
			<dl>
				<dt>
					Engineer
				</dt>
				<dd>
					工程师之路，改变你的未来
				</dd>
				
			</dl>
		</div>
		<div class="span6">
			<div class="row-fluid">
				<div class="span4">
						<h4>关于</h4>
					<ul>
						<li>
							新闻资讯
						</li>
						<li>
							体育竞技
						</li>
						
					
					</ul>
				</div>
				<div class="span4">
						<h4>联系方式</h4>
					<ul>
						<li>
							新闻资讯
						</li>
						<li>
							体育竞技
						</li>
					
					</ul>
				</div>
				<div class="span4">
						<h4>地址</h4>
					<ul>
						<li>
							新闻资讯
						</li>
						<li>
							体育竞技
						</li>
						<li>
							娱乐八卦
						</li>
						
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
<hr>

                <div contenteditable="true" class="text-center">版权所有 | Copyright @ Engineer</div>
              
<!--footer-->
</div>
  </body>
</html>
