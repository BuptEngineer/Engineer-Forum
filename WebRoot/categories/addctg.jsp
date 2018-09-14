<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>添加分类</title>
</head>
<body>
	<jsp:include page="../components/navbar.jsp">
		<jsp:param value="${categorys}" name="categorys" />
	</jsp:include>
	<div class="container">
		<div class="raw">
			<div class=" col-md-9">
				<div class="panel panel-default ">
					<div class="panel-head">
						<h3 class="text-center">添加分类</h3>
						<hr>
					</div>
					<div class="panel-body">
						<!-- 调节间距 -->
						<div class="clearfix" style="margin-bottom: 0%;"></div>

						<form id="addCtg-form"
							class="form-horizontal col-md-offset-2 col-md-8"
							action="loginVerification" method="post">
							<!-- 当出错时，为 form-group div 添加 has-error class，并且添加 下面的 span 元素 -->
							<!--当需要提示的时候，class 去掉 hidden-->
							<!--可以通过 id 来找到每个输入标签对应的提示文本框-->
							<!-- <span class="help-block hidden">一个较长的帮助文本块，超过一行，
									需要扩展到下一行。本实例中的帮助文本总共有两行。</span> -->
							<!-- 
								1. 查找是否已经存在类名
								2. 检查类名长度是否合适
								3. 检查类名中是否有特殊字符
							 -->
							<div class="form-group">
								<label for="firstname" class="col-md-2 control-label">类名</label>
								<div class="col-md-10">
									<input type="text" id="className" name="className"
										value="${form.u_email}" class="form-control" placeholder="类名">
									<span id="classNameError" class="help-block"></span>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<button id="submitBtn" type="submit"
										class="btn btn-primary btn-lg btn-block">添加</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<jsp:include page="../components/right.jsp">
					<jsp:param value="${categorys}" name="categorys" />
				</jsp:include>
			</div>
		</div>
	</div>
	<jsp:include page="../components/footer.jsp">
		<jsp:param value="${categorys}" name="categorys" />
	</jsp:include>

</body>
</html>