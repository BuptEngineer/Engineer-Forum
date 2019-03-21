<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Engineer</title>
<link rel="shortcut icon"
	href="<c:url value='/resource/imgs/favicon.png'/>">
<style>
.img-caption-h3 {
	/* h3 18.72px, 100 - 18.72 = 81.28 */
	margin-top: -80px;
	margin-bottom: 55px;
	margin-left: 10%;
	color: white;
}
</style>
<script src="resource/js/lib/jquery-1.5.1.js"></script>
<script type="text/javascript">
	//使用ajax访问数据库进行分页刷新
	$(document).ready(function(){
		query(1);
		$.ajax({
			type:"get",
			url:"${pageContext.request.contextPath}/init",
		})
	});
	
	 function query(page){
		$.ajax({
			type:"get",
			url:"${pageContext.request.contextPath}/page?page="+page+"\&key="+document.getElementById('requestArgs').innerHTML,
			contentType:"application/json;charset=utf-8",
			success:function(data){
				if(data.list.length==0)
					return;
				var content="";
				for(var i=0;i<data.list.length;i++){
					content+="<div class=\"thumbnail\">"+
						"<div class=\"caption\">"+
						"<a href=\"<c:url value='/posts/show'/>?id="+data.list[i].pId+"\">"+
						"<h4>"+data.list[i].pName+"</h4>"+
						"</a>"+
						"<p>"+data.list[i].pDesc+"</p>"+
						"<p>"+
						"标签：<a href=\"#\">"+data.list[i].category.ctgName+"</a> | "+
						"作者：<a href=\"<c:url value='/user/personal'/>?uname="+data.list[i].user.uName+"\">"+data.list[i].user.uName+"</a> | 上次回复时间：<a class = \"text-muted\">2"+
						"分钟前</a> | 回复数：<span class=\"badge\">150</span>"+
						"</p>"+
						"</div>"+
						"</div>";
				}
				document.getElementById('ajaxForPage').innerHTML=content;
				var nag="<ul class=\"pagination  pagination-lg\">";//页数导航
				if(data.pageNum>1){
					nag+="<li onclick='query(1)'><a href='javascript:void(0);'>First</a></li>";
				}else{
					nag+="<li onclick='query(1)' class=\"disabled\"><a href='javascript:void(0);'>First</a></li>";
				}
				
				if(data.navigateFirstPage>1){
					nag+="<li onclick='query("+data.prePage+")'><a href='javascript:void(0);'>...</a></li>";
				}
				
				for(var i=0;i<data.navigatepageNums.length;i++){
					if(data.navigatepageNums[i]==data.pageNum)
						nag+="<li class=\"active\" onclick='query("+data.navigatepageNums[i]+")'><a href='javascript:void(0);'>"+data.navigatepageNums[i]+"</a></li>";
					else
						nag+="<li onclick='query("+data.navigatepageNums[i]+")'><a href='javascript:void(0);'>"+data.navigatepageNums[i]+"</a></li>";	
				}
				
				if(data.navigateLastPage<data.pages){
					nag+="<li onclick='query("+data.nextPage+")'><a href='javascript:void(0);'>...</a></li>";
				}
				
				if(data.pageNum<data.lastPage){
					nag+="<li onclick='query("+data.lastPage+")'><a href='javascript:void(0);'>Last</a></li>";
				}else{
					nag+="<li onclick='query("+data.lastPage+")' class='disabled'><a href='javascript:void(0);'>Last</a></li>";
				}
				
				nag+="</ul>";
				document.getElementById('page').innerHTML=nag;
			},
			error:function(data){
				alert("Ajax获取数据出现错误,请检查是否存在未注册的用户发布过帖子或者数据库配置是否正常,可以与管理员联系尝试解决");
				//跳转到404页面
			}
		})
	}
</script>
</head>

<jsp:include page="components/navbar.jsp">
	<jsp:param value="${categorys}" name="categorys" />
</jsp:include>

<!-- 看 https://www.csdn.net/ 的首页就行 -->
<!-- 图从 http://science.sciencemag.org/-->

<div class="container">
	<div class="col-md-9">
		<div class="col-md-12" id="ajaxForPage">
			<div class="thumbnail">
					<div class="caption ">
						<a href="posts/show"><h4>什么都懂但是都不精通真的有前途吗(´_ゝ`)</h4></a>
						<p>
							按照正常的操作习惯，不是应该在最右侧吗? <a href="#">...更多</a>
						</p>
						<p>
							标签：<a href="#">程序员</a> | 作者：<a href="#">babedoll</a> | 上次回复时间：<a class = "text-muted">2
								分钟前</a> | 回复数：<span class="badge">150</span>
						</p>
					</div>
				</div>
			<div class="thumbnail">
				<div class="caption ">
					<a href="#"><h4>产品经理总喜欢把 Table 的 [操作栏] 设计在最左侧，是出于什么心态(´_ゝ`)</h4></a>
					<p>
						刚毕业，js css html 基本上都掌握，不会 js 框架。当初想做前端，无奈进了个公司要求全栈， 还是.net
						的全栈。幸好大学有 c#基础，工作并不是很吃力。 <a href="#">...更多</a>
					</p>
					<p>
						标签：<a href="#">程序员</a> | 作者：<a href="#">babedoll</a> | 上次回复时间：<a class = "text-muted">2
							分钟前</a> | 回复数：<span class="badge">150</span>
					</p>
				</div>
			</div>
		</div>
		<!--.... more-->
		<!-- 添加导航页数-->
		<div id="page" align="center"></div>
	</div>

	<div class="col-md-3">
	<!-- right -->
		<jsp:include page="components/right.jsp">
			<jsp:param value="${categorys}" name="categorys" />
		</jsp:include>
	</div>
</div>
<div class="clearfix" style="margin-bottom: 10px;"></div>
<!-- 清除浮动 -->
<div id="requestArgs" hidden=""><%=request.getParameter("key")==null?"":request.getParameter("key") %></div><!-- 隐藏属性 -->
<!-- 抄 https://www.csdn.net/ 的首页就行 -->
<!-- 图从 http://science.sciencemag.org/ 找就行-->

<jsp:include page="components/footer.jsp">
	<jsp:param value="${categorys}" name="categorys" />
</jsp:include>

