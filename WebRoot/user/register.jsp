<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>注册</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<!--js css-->
<!-- <link rel="stylesheet" type="text/css"
	href="<c:url value='/resource/css/user/login.css'/>"> -->
<script src="<c:url value='/resource/js/lib/jquery.min.js'/>"></script>
<link href="<c:url value='/resource/css/lib/bootstrap.min.css'/>"
	rel="stylesheet" type="text/css">
<script src="<c:url value='/resource/js/lib/bootstrap.min.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/resource/js/user/login.js'/>"></script>

<script type="text/javascript">
	// alert notice about login
	var msg = "${msg}";
	if (msg != "") {
		alert(msg);
	}
</script>
<style>
body {
	padding-top: 7%;
	background: #f0f0f0;
}
</style>
<script type="text/javascript"
	src="<c:url value='/resource/js/user/regist.js'/>"></script>

</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col-md-offset-2 col-md-8 ">
				<div class="panel panel-default ">
					<!-- <div class="panel-heading text-center span20">
									注册(面板标题)
							</div> -->
					<div class="panel-body">
						<!-- 调节间距 -->
						<div class="clearfix" style="margin-bottom: 7%;"></div>
						<form id="register-form"
							class="form-horizontal col-md-offset-2 col-md-8" role="form"
							action="registerVerification" method="post">
							<div class="form-group">
								<!--has-error，当出错，其中的所有文字都变成红色-->
								<label for="email" class="col-md-2 control-label">邮箱</label>
								<div class="col-md-10">
									<input type="text" class="form-control" id="email"
										name="uEmail" placeholder="邮箱" value="${form.u_email }">
									<!--当需要提示的时候，class 去掉 hidden-->
									<!--可以通过 id 来找到每个输入标签对应的提示文本框-->
									<span id="emailError" class="help-block  "></span>
								</div>
							</div>
							<div class="form-group">
								<label for="nickname" class="col-sm-2 control-label">昵称</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" placeholder="昵称"
										name="uName" id="username" value="${form.u_name }"> <span
										id="usernameError" class="help-block  "></span>
								</div>
							</div>
							<div class="form-group">
								<label for="password" class="col-sm-2 control-label">密码</label>
								<div class="col-sm-10">
									<input type="password" class="form-control" placeholder="密码"
										name="uPwd" id="password" value="${form.u_pwd }"> <span
										id="passwordError" class="help-block  "></span>
								</div>
							</div>
							<div class="form-group">
								<label for="password" class="col-sm-2 control-label">重复密码</label>
								<div class="col-sm-10">
									<input type="password" class="form-control" placeholder="密码"
										name="confirmpass" id="confirmpass"
										value="${form.confirmpass }"> <span
										id="confirmpassError" class="help-block  "></span>
								</div>
							</div>
							<div class="form-group">
								<label for="name" class="col-sm-2 control-label">性别</label>
								<div class="col-sm-10">
									<label class="radio-inline"> <!-- inline：在同一行--> <input
										type="radio" name="uSex" id="male" value="m"> 男
									</label> <label class="radio-inline"> <input type="radio"
										name="uSex" id="female" value="w"> 女
									</label> <label class="radio-inline"> <input type="radio"
										name="uSex" id="undefined" value="u" checked>
										不确定
									</label>
								</div>
							</div>
							<div class="form-group">
								<label for="lastname" class="col-md-2 control-label">验证</label>
								<div class="col-md-5">
									<input type="text" class="form-control" id="verifyCode"
										name="verifyCode" placeholder="验证码"> <span
										id="verifyCodeError" class="help-block  "></span>
								</div>
								<div class="col-md-5">
									<img id="vCode" src="<c:url value='verifyCode'/>" width="100%" />
									<a for="lastname" href="javascript:_change()"
										style="margin-top: -100px">看不清，换一张</a>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<button type="submit" class="btn btn-primary btn-lg btn-block">注册</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

