<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>

<!--js css-->
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resource/css/user/login.css'/>">
<script type="text/javascript"
	src="<c:url value='/resource/js/lib/jquery.min.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/resource/js/user/login.js'/>"></script>

<script type="text/javascript">
	// alert notice about login
	var msg = "${msg}";
	if (msg != "") {
		alert(msg);
	}
</script>
</head>
<!-- procession of login 
	1. When user firstly enter this page, verification code should show.
	2. After user inputed the email, it should check on its correction of formation
-->
<body>
	<div class="login">
		<div class="login-img">
			<img src="<c:url value='/resource/imgs/login-show.png'/>"
				width="100%">
		</div>
		<c:url var="post_url" value="/UserServlet" />
		<form id="submitBtn" class="login-form" action="${post_url}"
			method="post" target="_top">
			<input type="hidden" name="method" value="login" />
			<div class="inputDiv">
				<label class="form-label">邮箱</label> <input id="email" type="text"
					name="u_email" class="input" value="${form.u_email }"
					placeholder="邮箱:" />
				<div class="errorDiv">
					<span id="emailError" class="error">${errors.email }</span>
				</div>
			</div>

			<div class="inputDiv">
				<label class="form-label">密码</label> <input id="password"
					type="password" name="u_pwd" class="input" value="${form.u_pwd }"
					placeholder="密码:" />
				<div class="errorDiv">
					<span id="passwordError" class="error">${errors.password }</span>
				</div>
			</div>

			<div class="inputDiv">
				<label class="form-label">验证</label> <input id="verifyCode"
					type="text" name="verifyCode" class="input" placeholder="验证码:" />
				<div class="errorDiv">
					<span id="verifyCodeError" class="error">${errors.verifyCode }</span>
				</div>
			</div>

			<div class="img-div">
				<img id="vCode" src="<c:url value='verifyCode'/>" />
				<!-- "ajax" the code -->
				<a class="change" href="javascript:_change()">看不清，换一张</a>
			</div>

			<p>
				<input class="form-submit" type="submit" value="登录"></input>
			</p>
			<p class="more">
				<a href="<c:url value='register'/>">免费注册></a><br /> <a href="#">忘记密码？</a>
			</p>
		</form>

	</div>
	<h3 style="text-align: right">${msg}</h3>
</body>
</html>