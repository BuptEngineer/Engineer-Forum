function _change() {
	$("#vCode").attr("src", "verifyCode?time = " + new Date()); // change
	// verifyCode
}
// 1. submit form after confirming everything is right
// 2. when input label lose focus, check out content of input label
// 21. If content is wrong, show error span and add "has-error"
// class to the parent of this label.
// 3. when input label get focus, remove span and remove "has-error" class

// there are several tips
// 1. remove repeat codes, and use function to packing these code.
// 2. remove odd css classes, use dom tree's nodes to operate css
$(document).ready(
		function() {
			// 1.遍历所有错误信息集合，调用showError方法确定是否显示作物信息
//			 $("input").each(function(){
//			 showError($(this).next());//遍历每一个元素，判断装载错误信息的span是否显示
//			 });
			// 1. Input labels get focus, remove error
			$("input").focus(function() {
				var spanId = $(this).attr("id") + "Error";// 得到显示错误信息的span的id
				$("#" + spanId).text("");// 将错误信息清空
				showError($("#" + spanId));// 把元素隐藏掉
			});

			// 2. Input labels lose focus
			// check out whether content is right.
			$("input").blur(
					function() {
						var id = $(this).attr("id");// 获取当前元素的id
						var funName = "validate"
								+ id.substring(0, 1).toUpperCase()
								+ id.substring(1) + "()";// 对应校验方法名
						eval(funName);// eval将字符串变为可执行代码运行，即调用该方法
					});

			// 3. submit form, before submit it, check out every input label.
			$("#register-form").submit(
					function() {
						var bool = true;
						if (!validateEmail() | !validateUsername()
								| !validatePassword() | !validateConfirmpass()
								| !validateVerifyCode()) {
							bool = false;
						}
						return bool;
					});
		});

function showError(ele) {
	var text = ele.text();
	if (!text) {// 错误信息为空，则span不显示
		ele.css("display", "none");
		ele.parent().removeClass("has-error");
	} else {
		ele.css("display", "");// 默认显示
		ele.parent().addClass("has-error");
	}
};

// 邮箱的校验
function validateEmail() {
	var id = "email";
	// 校验非空
	var value = $("#" + id).val();// 获取输入框内容
	if (!value) {
		$("#" + id + "Error").text("email不能为空！");
		showError($("#" + id + "Error"));
		return false;
	}
	// email格式校验
	if (!/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/
			.test(value)) {
		$("#" + id + "Error").text("email格式错误！");
		showError($("#" + id + "Error"));
		return false;
	}
	// ajax异步通信
	$.ajax({// 7大参数
		url : "ajaxValidateEmail",// 要请求的Servlet
		data : {
			u_email : value
		},// 请求的方法，及传递的参数
		type : "post",
		dataType : "json",
		contentType : 'application/json;charset=utf-8', //设置请求头信息
		async : false,// 是否异步请求，若是，则函数不等服务器返回就直接向下进行
		cache : false,
		success : function(result) {
			if (result != "") {// 返回""，则邮箱已经被注册
				$("#" + id + "Error").text(result);
				showError($("#" + id + "Error"));
				return false;
			}
		}
	});
	// 通过校验，返回true
	return true;
}

// 昵称的校验
function validateUsername() {
	var id = "username";
	// 校验非空
	var value = $("#" + id).val();// 获取输入框内容
	if (!value) {
		$("#" + id + "Error").text("昵称不能为空！");
		showError($("#" + id + "Error"));
		return false;
	}
	// username长度校验
	if (value.length < 2 || value.length > 20) {
		$("#" + id + "Error").text("昵称的长度必须在2~20之间!");
		showError($("#" + id + "Error"));
		return false;
	}
	return true;
}

// 密码的校验
function validatePassword() {
	var id = "password";
	// 校验非空
	var value = $("#" + id).val();// 获取输入框内容
	if (!value) {
		$("#" + id + "Error").text("密码不能为空！");
		showError($("#" + id + "Error"));
		return false;
	}
	// username长度校验
	if (value.length < 6 || value.length > 20) {
		$("#" + id + "Error").text("密码的长度必须在6~20之间!");
		showError($("#" + id + "Error"));
		return false;
	}
	return true;
}

// 确认密码的校验
function validateConfirmpass() {
	var id = "confirmpass";
	// 校验
	var value = $("#" + id).val();// 获取输入框内容
	if (!value) {
		$("#" + id + "Error").text("密码不能为空！");
		showError($("#" + id + "Error"));
		return false;
	}
	if (value != $("#password").val()) {
		$("#" + id + "Error").text("两次密码不一致！");
		showError($("#" + id + "Error"));
		return false;
	}
	return true;
}

// 验证码的校验
function validateVerifyCode() {
	var id = "verifyCode";
	// 校验
	var value = $("#" + id).val();// 获取输入框内容

	if (!value) {
		$("#" + id + "Error").text("验证码不能为空！");
		showError($("#" + id + "Error"));

		return true;
	}
	if (value.length != 4) {
		$("#" + id + "Error").text("验证码错误！");
		showError($("#" + id + "Error"));
		return true;
	}
	// ajax验证码校验
	$.ajax({
		// 7大参数
		url : "verifyCode",// 要请求的servlet
		data : {
			verifyCode : value
		},// 给服务器的参数
		type : "POST",
		dataType : "json",
		async : false,// 是否异步请求，如果是异步请求，则不等服务器返回，我们这个函数就直接向下运行
		cache : false,
		success : function(result) {
			if (!result) {
				$("#" + id + "Error").text("验证码错误！");
				showError($("#" + id + "Error"));
				return true;
			}
		}
	});
	//要通过检验，
	return true;
}
