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
	href="<c:url value='/jsps/mainPage/img/favicon.png'/>">
</head>

<jsp:include page="components/navbar.jsp">
	<jsp:param value="${categorys}" name="categorys" />
</jsp:include>

<!-- 最热插图 -->
<div class="container">
	<div class="row">
		<div class="col-md-8">
			<!--轮播图-->
			<div id="myCarousel" class="carousel slide">
				<!-- 轮播（Carousel）指标 -->
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
				</ol>
				<!-- 轮播（Carousel）项目 -->
				<div class="carousel-inner">
					<div class="item active">
						<img src="resource/imgs/chemical.jpg " class="img-rounded"
							alt="First slide">
					</div>
					<div class="item">
						<img src="resource/imgs/computer.jpg" class="img-rounded"
							alt="Second slide">
					</div>
					<div class="item">
						<img src="resource/imgs/mechanical.jpg" class="img-rounded"
							alt="Third slide">
					</div>
				</div>
				<!-- 轮播（Carousel）导航 -->
				<a class="left carousel-control" href="#myCarousel" role="button"
					data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#myCarousel" role="button"
					data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>
		</div>
		<div class="col-md-4">
			<!--添加两列图-->
			<div class="row top">
				<img src="resource/imgs/right-1.jpg"
					class="img-responsive img-rounded" alt="Cinque Terre">
			</div>
			<!-- 清除浮动，并且添加 margin-bottom -->
			<!-- 清除浮动 -->
			<div class="clearfix" style="margin-bottom: 10px;"></div>
			<div class="row bottom">
				<img src="resource/imgs/right-2.jpg"
					class="img-responsive img-rounded" alt="Cinque Terre">
			</div>
		</div>
	</div>
</div>

<div class="clearfix" style="margin-bottom: 10px;"></div>
<!-- 清除浮动 -->
<div class="container">
	<div class="row">
		<div class="col-md-2 ">
			<h3 class="text-center">最热路线</h3>
		</div>
	</div>
</div>
<!-- 抄 https://www.csdn.net/ 的首页就行 -->
<!-- 图从 http://science.sciencemag.org/ 找就行-->

<div class="container">
	<div class="row">
		<div class="col-md-4">
			<div class="thumbnail">
				<a href="#"> <img alt="300x200" src="resource/imgs/title-1.jpg" />
				</a>
				<div class="caption">
					<h3>冯诺尔曼结构</h3>
					<p>
						也称普林斯顿结构，是一种将程序指令存储器和数据存储器合并在一起的存储器结构。程序指令存储地址和数据存储地址指向同一个存储器的不同物理位置。
					</p>
					<p>
						<a class="btn btn-primary" href="#">浏览</a> <a class="btn" href="#">分享</a>
					</p>
				</div>
			</div>
		</div>
		<div class="col-md-4">
			<div class="thumbnail">
				<img alt="300x200" src="resource/imgs/title-1.jpg" />
				<div class="caption">
					<h3>冯诺尔曼结构</h3>
					<p>
						也称普林斯顿结构，是一种将程序指令存储器和数据存储器合并在一起的存储器结构。程序指令存储地址和数据存储地址指向同一个存储器的不同物理位置。
					</p>
					<p>
						<a class="btn btn-primary" href="#">浏览</a> <a class="btn" href="#">分享</a>
					</p>
				</div>
			</div>
		</div>
		<div class="col-md-4">
			<div class="thumbnail">
				<img alt="300x200" src="resource/imgs/title-1.jpg" />
				<div class="caption">
					<h3>冯诺尔曼结构</h3>
					<p>
						也称普林斯顿结构，是一种将程序指令存储器和数据存储器合并在一起的存储器结构。程序指令存储地址和数据存储地址指向同一个存储器的不同物理位置。
					</p>
					<p>
						<a class="btn btn-primary" href="#">浏览</a> <a class="btn" href="#">分享</a>
					</p>
				</div>
			</div>
		</div>
		<!--.... more-->
	</div>
</div>
<div class="clearfix" style="margin-bottom: 10px;"></div>
<!-- 清除浮动 -->

<div class="container">
	<div class="row">
		<div class="col-md-2 ">
			<h3 class="text-left">最热问答</h3>
		</div>
	</div>
</div>
<!-- 抄 https://www.csdn.net/ 的首页就行 -->
<!-- 图从 http://science.sciencemag.org/ 找就行-->

<div class="container">
	<div class="row">
		<div class="col-md-4">
			<div class="thumbnail">
				<a href="#"> <img alt="300x200" src="resource/imgs/title-1.jpg" />
				</a>
				<div class="caption">
					<h3>冯诺尔曼结构</h3>
					<p>
						也称普林斯顿结构，是一种将程序指令存储器和数据存储器合并在一起的存储器结构。程序指令存储地址和数据存储地址指向同一个存储器的不同物理位置。
					</p>
					<p>
						<a class="btn btn-primary" href="#">浏览</a> <a class="btn" href="#">分享</a>
					</p>
				</div>
			</div>
		</div>
		<div class="col-md-4">
			<div class="thumbnail">
				<img alt="300x200" src="resource/imgs/title-1.jpg" />
				<div class="caption">
					<h3>冯诺尔曼结构</h3>
					<p>
						也称普林斯顿结构，是一种将程序指令存储器和数据存储器合并在一起的存储器结构。程序指令存储地址和数据存储地址指向同一个存储器的不同物理位置。
					</p>
					<p>
						<a class="btn btn-primary" href="#">浏览</a> <a class="btn" href="#">分享</a>
					</p>
				</div>
			</div>
		</div>
		<div class="col-md-4">
			<div class="thumbnail">
				<img alt="300x200" src="resource/imgs/title-1.jpg" />
				<div class="caption">
					<h3>冯诺尔曼结构</h3>
					<p>
						也称普林斯顿结构，是一种将程序指令存储器和数据存储器合并在一起的存储器结构。程序指令存储地址和数据存储地址指向同一个存储器的不同物理位置。
					</p>
					<p>
						<a class="btn btn-primary" href="#">浏览</a> <a class="btn" href="#">分享</a>
					</p>
				</div>
			</div>
		</div>
		<!--.... more-->
	</div>
</div>

<jsp:include page="components/footer.jsp">
	<jsp:param value="${categorys}" name="categorys" />
</jsp:include>
</div>