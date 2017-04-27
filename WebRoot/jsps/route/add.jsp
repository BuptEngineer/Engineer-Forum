<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 以上三个meta是必须写的 -->
<title>添加</title>

<!-- Bootstrap -->
<link href="<c:url value='/jsps/css/bootstrap.min.css'/>"
	rel="stylesheet">
<link href="<c:url value='/umeditor/edit.css'/>" type="text/css" rel="stylesheet">
<link href="<c:url value='/umeditor/themes/default/css/umeditor.css'/>" type="text/css"
	rel="stylesheet">
<script type="text/javascript" src="<c:url value='/umeditor/third-party/jquery.min.js'/>"></script>
<script type="text/javascript" charset="utf-8" src="<c:url value='/umeditor/umeditor.config.js'/>"></script>
<script type="text/javascript" charset="utf-8" src="<c:url value='/umeditor/umeditor.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/umeditor/lang/zh-cn/zh-cn.js'/>"></script>
<script type="text/javascript">
var msg="${msg}";
if(msg!=""){
	alert(msg);
}
</script>
<style type="text/css">
* {
	margin: 0;
	padding: 0
}
body {
	background-color: #eff;
}
.r-add-body {
	background: #fff;
	width: 70%;
	min-height: 400px;
}
.div1 {
	width: 100%;
	padding: 20px;
}
.div2 {
	margin-top: 30px;
}
.div form .edui-container{

	min-width:100%;
}
img{max-width:100%;}
</style>
</head>
<%
	String ctg_id=request.getParameter("ctg_id");
	String ctg_name = request.getParameter("ctg_name");
%>
<body>

	<div class="container-fluid r-add-body">
		<h3 class="h3">
			<span class="glyphicon glyphicon-tag" aria-hidden="true"></span> 当前分类
			: <a class="label label-primary" href="#"><%=ctg_name %></a>
		</h3>
		<div class="row">
			<h3 class="h3">请填写学习路线的相关信息</h3>
			<div class="panel panel-default div1">
				<form action="<c:url value='/RouteServlet'/>"  method="post">
					<input type="hidden" name="method" value="add"/>
					<input type="hidden" name="ctg_id" value="<%=ctg_id%>">
				<div class="input-group input-group-lg">
					<span class="input-group-addon">名称</span> 
					<input type="text" class="form-control" name="rt_name" placeholder="学习路线的名称"
						aria-describedby="sizing-addon1">
				</div>
				<div class="input-group input-group-lg div2">
					<span class="input-group-addon">概要</span>
					<textarea class="form-control" name="rt_desc" style="height:120px;"
						placeholder="可以摘录您的学习历程 <小于300字>" aria-describedby="sizing-addon1"></textarea>
				</div>
				<h3 class="h3 div2">您的学习历程：</h3>
				<script type="text/plain" id="myEditor" name="rt_content" style="width:100%;height:300px;">
   					<p>请您尽可能详尽的描述，您是怎样一步一步到达现在的职业高度的，如您看了哪些书和哪些教学资源，在阶段期间达到了什么样
						的程度，走过了哪些弯路，有什么技巧等等。</p>
				</script>
				
				<p style="margin:10px 20px 0 0;text-align:right;">
					<input type="submit" class="btn-group btn"/>
					</p>
				</form>
			</div>
	
		</div>
	</div>
	
<script type="text/javascript">
		//实例化编辑器
		var um = UM.getEditor('myEditor');
		function isFocus() {
			alert(um.isFocus())
		}
		function doBlur() {
			um.blur()
		}
		function getContent() {
		
			$("#content").val(UM.getEditor('myEditor').getContent());
		}
		
</script>
</body>
</html>