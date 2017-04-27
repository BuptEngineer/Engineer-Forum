<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="title" content="LayoutIt! - Bootstrap可视化布局系统">
<meta name="description" content="LayoutIt! 可拖放排序在线编辑的Bootstrap可视化布局系统">
<meta name="keywords" content="可视化,布局,系统">
<title>Engineer</title>

<!-- Le styles -->
<link href="<c:url value='/jsps/mainPage/css/bootstrap-combined.min.css" rel="stylesheet'/>">
<link href="<c:url value='/jsps/mainPage/css/layoutit.css" rel="stylesheet'/>">

<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->

<!--[if lt IE 9]>
		<script src="js/html5shiv.js"></script>
	<![endif]-->

	<!-- Fav and touch icons -->
		<link rel="shortcut icon" href="<c:url value='/jsps/mainPage/img/favicon.png'/>">

	
	<!--[if lt IE 9]>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
	<![endif]-->
	
	<script type="text/javascript" src="js/jquery-2.0.0.min.js"></script>
	
	
	<!--[if lt IE 9]>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
	<![endif]-->

	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	


</head>


<jsp:include page="../nav/nav.jsp">
<jsp:param value="${categorys}" name="categorys"/>
</jsp:include>

	<div class="row-fluid"  >
		<div class="span12">
			<div class="carousel slide" id="carousel-561128">
				<ol class="carousel-indicators">
					<li data-slide-to="0" data-target="#carousel-561128">
					</li>
					<li data-slide-to="1" data-target="#carousel-561128">
					</li>
					<li data-slide-to="2" data-target="#carousel-561128" class="active">
					</li>
				</ol>
				<div class="carousel-inner">
					<div class="item">
						<img alt="" src="img/1.jpg" />
						<div class="carousel-caption">
							<h4>
								棒球
							</h4>
							<p>
								棒球运动是一种以棒打球为主要特点，集体性、对抗性很强的球类运动项目，在美国、日本尤为盛行。
							</p>
						</div>
					</div>
					<div class="item">
						<img alt="" src="img/2.jpg" />
						<div class="carousel-caption">
							<h4>
								冲浪
							</h4>
							<p>
								冲浪是以海浪为动力，利用自身的高超技巧和平衡能力，搏击海浪的一项运动。运动员站立在冲浪板上，或利用腹板、跪板、充气的橡皮垫、划艇、皮艇等驾驭海浪的一项水上运动。
							</p>
						</div>
					</div>
					<div class="item active">
						<img alt="" src="img/3.jpg" />
						<div class="carousel-caption">
							<h4>
								自行车
							</h4>
							<p>
								以自行车为工具比赛骑行速度的体育运动。1896年第一届奥林匹克运动会上被列为正式比赛项目。环法赛为最著名的世界自行车锦标赛。
							</p>
						</div>
					</div>
				</div> <a data-slide="prev" href="#carousel-561128" class="left carousel-control">‹</a> <a data-slide="next" href="#carousel-561128" class="right carousel-control">›</a>
			</div>
		</div>
	</div>
	<div class="row-fluid">
		<div class="span12">
			<h3 class="text-center">
				最热路线
			</h3>
		</div>
	</div>
	
	<!-- 遮罩层 -->
								<div class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
			 <a id="modal-613559" href="#modal-container-613559" role="button" class="btn" data-toggle="modal">触发遮罩窗体</a>
			
			<div id="modal-container-613559" class="modal hide fade" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-header">
					 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h3 id="myModalLabel">
						标题栏
					</h3>
				</div>
				<div class="modal-body">
					<p>
						显示信息
					</p>
				</div>
				<div class="modal-footer">
					 <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button> <button class="btn btn-primary">保存设置</button>
				</div>
			</div>
		</div>
	</div>
</div>
								<!-- 遮罩层 -->
	<div class="row-fluid">
		<div class="span12">
			<ul class="thumbnails">
				<li class="span4">
					<div class="thumbnail">
						<img alt="300x200" src="img/people.jpg" />
						<div class="caption">
							<h3>
								冯诺尔曼结构
							</h3>
							<p>
								也称普林斯顿结构，是一种将程序指令存储器和数据存储器合并在一起的存储器结构。程序指令存储地址和数据存储地址指向同一个存储器的不同物理位置。
							</p>
							<p>
								<a class="btn btn-primary" href="#">浏览</a> <a class="btn" href="#">分享</a>
							</p>
						</div>
					</div>
				</li>
				<li class="span4">
					<div class="thumbnail">
						<img alt="300x200" src="img/city.jpg" />
						<div class="caption">
							<h3>
								哈佛结构
							</h3>
							<p>
								哈佛结构是一种将程序指令存储和数据存储分开的存储器结构，它的主要特点是将程序和数据存储在不同的存储空间中，进行独立编址。
							</p>
							<p>
								<a class="btn btn-primary" href="#">浏览</a> <a class="btn" href="#">分享</a>
							</p>
						</div>
					</div>
				</li>
				<li class="span4">
					<div class="thumbnail">
						<img alt="300x200" src="img/sports.jpg" />
						<div class="caption">
							<h3>
								改进型哈佛结构
							</h3>
							<p>
								改进型的哈佛结构具有一条独立的地址总线和一条独立的数据总线，两条总线由程序存储器和数据存储器分时复用，使结构更紧凑。
							</p>
							<p>
								<a class="btn btn-primary" href="#">浏览</a> <a class="btn" href="#">分享</a>
							</p>
						</div>
					</div>
				</li>
			</ul> <span class="label">文字标签</span>
		</div>
	</div>
	<div class="row-fluid">
		<div class="span12">
			<h3 class="text-center">
				最热问答
			</h3>
		</div>
	</div>
	<div class="row-fluid">
		<div class="span12">
			<ul class="thumbnails">
				<li class="span4">
					<div class="thumbnail">
						<img alt="300x200" src="img/people.jpg" />
						<div class="caption">
							<h3>
								冯诺尔曼结构
							</h3>
							<p>
								也称普林斯顿结构，是一种将程序指令存储器和数据存储器合并在一起的存储器结构。程序指令存储地址和数据存储地址指向同一个存储器的不同物理位置。
							</p>
							<p>
								<a class="btn btn-primary" href="#">浏览</a> <a class="btn" href="#">分享</a>
							</p>
						</div>
					</div>
				</li>
				<li class="span4">
					<div class="thumbnail">
						<img alt="300x200" src="img/city.jpg" />
						<div class="caption">
							<h3>
								哈佛结构
							</h3>
							<p>
								哈佛结构是一种将程序指令存储和数据存储分开的存储器结构，它的主要特点是将程序和数据存储在不同的存储空间中，进行独立编址。
							</p>
							<p>
								<a class="btn btn-primary" href="#">浏览</a> <a class="btn" href="#">分享</a>
							</p>
						</div>
					</div>
				</li>
				<li class="span4">
					<div class="thumbnail">
						<img alt="300x200" src="img/sports.jpg" />
						<div class="caption">
							<h3>
								改进型哈佛结构
							</h3>
							<p>
								改进型的哈佛结构具有一条独立的地址总线和一条独立的数据总线，两条总线由程序存储器和数据存储器分时复用，使结构更紧凑。
							</p>
							<p>
								<a class="btn btn-primary" href="#">浏览</a> <a class="btn" href="#">分享</a>
							</p>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</div>

<!--footer-->
<hr>
	<div class="container-fluid">
	<div class="row-fluid">
		<div class="span6">
			<img src="img/favicon.png">
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

                <div contenteditable="true" class="text-center">版权所有  |  Copyright by Engineer</div>
              
<!--footer-->
</div>