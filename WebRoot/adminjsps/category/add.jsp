<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>添加分类</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="<c:url value='/js/jquery-1.5.1.js'/>"></script>
	<script type="text/javascript">
		function checkForm() {
			if(!$("#cname").val()) {
				alert("分类名不能为空！");
				return false;
			}
			if(!$("#cimg").val()) {
				alert("分类图片不能为空！");
				return false;
			}
			if(!$("#desc").val()) {
				alert("分类描述不能为空！");
				return false;
			}
			return true;
		}
	</script>
<style type="text/css">
*{margin:0; padding:0}
body {
	background: #f0f0f0;
	color: #535353;
	height: auto !important;
	font-family: "微软雅黑";
}
.Body {
	width: 40%;
	margin:0 auto;
 	margin-top:80px;
 	height:320px;
 	background-color:#FFF;
 	padding:20px 2%;
 	text-align:center;
}
.title-all{
	font-size: 16px;
    font-weight: 700;
    color: #666;
    margin-bottom: 10px;
}
input{
 	width: 40%;
    height: 25px;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
    -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
    transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
    }
.input-btn{
	background: #49CE33;
    color:#FFF;
    width:20%;
    height:40px;
    font-weight:600;
    line-height: 1.42857143;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    border-radius:5px;
    margin-top:10px;
	margin-left:30px;
}
</style>
  </head>
  
  <body>
  
  	<div class="Body">
  
    <h3 class="title-all">添加分类</h3>
    <h1></h1>
    <p style="font-weight: 900; color: red">${msg }</p>
    <form action="<c:url value='/admin/AdminAddCtgServlet'/>" enctype="multipart/form-data" method="post" onsubmit="return checkForm()">
    	分类名称：<input type="text" name="ctg_name" id="cname"/><br/>
    	分类图片：<input type="file" name="ctg_img" id="cimg"/><br/>
    	分类描述：<textarea rows="5" cols="32" name="ctg_desc" id="desc"></textarea><br/>
    	
    	<input type="button" class="input-btn" value="返回" onclick="history.go(-1)"/>
    	<input type="submit" class="input-btn" value="添加分类"/>
    </form>
    
    </div>
  </body>
</html>
