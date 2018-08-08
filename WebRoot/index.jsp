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
<title>Engineer</title>
<link rel="shortcut icon" href="<c:url value='/jsps/mainPage/img/favicon.png'/>">
</head>

<jsp:include page="nav/nav.jsp">
<jsp:param value="${categorys}" name="categorys"/>
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
                            <img src="resource/imgs/chemical.jpg " class="img-rounded" alt="First slide">
                        </div>
                        <div class="item">
                            <img src="resource/imgs/computer.jpg" class="img-rounded" alt="Second slide">
                        </div>
                        <div class="item">
                            <img src="resource/imgs/mechanical.jpg" class="img-rounded" alt="Third slide">
                        </div>
                    </div>
                    <!-- 轮播（Carousel）导航 -->
                    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
            <div class="col-md-4">
                <!--添加两列图-->
                <div class="row top">
                    <img src="resource/imgs/right-1.jpg" class="img-responsive img-rounded" alt="Cinque Terre">
                </div>
                <!-- 清除浮动，并且添加 margin-bottom -->
                <!-- 清除浮动 -->
                <div class="clearfix" style="margin-bottom: 10px;"></div>
                <div class="row bottom">
                    <img src="resource/imgs/right-2.jpg" class="img-responsive img-rounded" alt="Cinque Terre">
                </div>
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