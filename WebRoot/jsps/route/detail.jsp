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
	padding: 20px;
}
.div2 {
	margin-top: 30px;
}

#editDiv form .edui-container{
	width:100%;
	min-width:100%;
}
#myEditor{
	width:100%;
	min-width:100%;
}
img{max-width:100%;}
</style>
</head>
<body>
<jsp:include page="../nav/nav.jsp"></jsp:include>
	<div class="container-fluid r-add-body">
		<h3 class="h3">
			<span class="glyphicon glyphicon-tag" aria-hidden="true"></span> 当前分类 : 
			<a class="btn btn-primary" href="<c:url value='/CategoryServlet?method=findRoutesByCtg&ctg_id=${route.category.ctg_id}'/>">${route.category.ctg_name }</a> 
		</h3>
		<div class="row">
			<h3 class="h3">作者：<a class="active" href="#">
				<img width="60" src=" " class="img-circle"/>
				<span> ${route.user.u_name }</span></a>
				<c:if test="${route.user.u_id eq session_user.u_id }">
				<span id="editBtn" class="btn btn-danger"  style="float:right;margin-right:3%;">编辑</span></c:if>
			</h3>
			<div class="div1" id="displayDiv">
				<div class="input-group input-group-lg">
				  <span class="input-group-addon">名称</span>
				  <strong class="form-control">${route.rt_name }</strong>
				</div>
				<div class="input-group input-group-lg div2">
				  <span class="input-group-addon">概要</span>
				  <p class="form-control" style="height:120px;">${route.rt_desc }</p>
				</div>
				<h3 class="h3 div2">成长历程：</h3>
				<div class="jumbotron" style="background-color:#F8F8F8">
					${route.rt_content }
				</div>
			</div>
			
			<div class="panel panel-default div1" id="editDiv" style="display:none">
				<form action="<c:url value='/RouteServlet'/>"  method="post">
					<input type="hidden" name="method" value="edit"/>
					<input type="hidden" name="rt_id" value="${route.rt_id }">
				<div class="input-group input-group-lg">
					<span class="input-group-addon">名称</span> 
					<input type="text" class="form-control" name="rt_name" value="${route.rt_name }"
						aria-describedby="sizing-addon1">
				</div>
				<div class="input-group input-group-lg div2">
					<span class="input-group-addon">概要</span>
					<textarea class="form-control" name="rt_desc" style="height:120px;"
						 aria-describedby="sizing-addon1">${route.rt_desc }</textarea>
				</div>
				<h3 class="h3 div2">您的学习历程：</h3>
				<script type="text/plain" id="myEditor" name="rt_content"  style="height:300px;">
   					<p>${route.rt_content}</p>
				</script>
				
				<p style="margin:10px 20px 0 0;text-align:right;">
					<span id="backBtn"class="btn btn-primary">返回</span>
					<span id="seeBtn"class="btn btn-primary">看看</span>
					<input type="submit" class="btn btn-primary" value="提交修改"/>
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
		$("#editBtn").click(function(){
			$("#displayDiv").css("display","none");
			$("#editDiv").show();
		});
		$("#backBtn").click(function(){
			$("#editDiv").hide();
			$("#displayDiv").show();
		});
		$("#seeBtn").click(function(){
			var aaa=UM.getEditor('myEditor').getContent()
			alert(aaa);
		});
</script>
</body>
</html>