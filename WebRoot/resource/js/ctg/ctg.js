/* 添加类名是否需要输入验证码? */
function _change() {
	$("#vCode").attr("src", "verifyCode?time = " + new Date()); // change
	// verifyCode
}

/**
 * 校验类名
 * 校验内容长度
 * @returns
 */
$(document).ready(
		function() {
			
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
			$("#addCtg-form").submit(
					function() {
						if (!validateCtgName()) {
							return false;
						}
						// ajax 提交表单
						var postData = $("#addCtg-form").serialize(); //序列化表单，后台可正常通过post方法获取数据
			            //通过ajax来提交表单 
			            $.ajax({ 
			                type: "POST", 
			                url: "addCtg", 
			                data: postData, 
			                beforeSend: function() {//提交之前做一些操作，如禁用提交按钮，防止重复提交等 
			                    $("#submitBtn").attr("disabled", true);
			                    $("#submitBtn").text("正在添加..."); 
			                }, 
			                success: function(msg) {
			                	
			                    if (msg != null) { 
			                       //做一些操作等等，，，
			                        // alert('操作成功');
			                    	// 为何校验不通过也会成功？
			                    	alert(msg);
			                        $("#submitBtn").attr("disabled", false); 
			                        $("#submitBtn").text("添加"); 
			                    } else { 
			                        $("#submitBtn").attr("disabled", false); 
			                        $("#submitBtn").text("添加"); 
			                        alert("返回错误！"); 
			                    } 
			                }
			            });
			            return false;
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

// 类名的校验
function validateCtgName() {
	var id = "ctgName";
	// 校验非空
	var value = $("#" + id).val();// 获取输入框内容
	if (!value) {
		$("#" + id + "Error").text("类名不能为空！");
		showError($("#" + id + "Error"));
		return false;
	}
	// 格式校验
	if (! /^[\w\u4e00-\u9fa5]*$/
			.test(value)) {
		$("#" + id + "Error").text("类名格式错误！");
		showError($("#" + id + "Error"));
		return false;
	}
	if (value.length > 10  ) {
		$("#" + id + "Error").text("类名不能超过 10 个字");
		showError($("#" + id + "Error"));
		return false;
	}
	if (value.length < 2  ) {
		$("#" + id + "Error").text("类名不能小于 2 个字");
		showError($("#" + id + "Error"));
		return false;
	}
	// ajax异步通信
	$.ajax({// 7大参数
		url : "ajaxValidateCtgName",// 要请求的Servlet
		data : {
			ctgName : value
		},// 请求的方法，及传递的参数
		type : "post",
		dataType : "json",
		async : false,// 是否异步请求，若是，则函数不等服务器返回就直接向下进行
		cache : false,
		success : function(result) {
			if (result) {// 返回"true"，类名未被添加过
				// 逻辑不正确 XXX
				$("#" + id + "Error").text("该类名已经存在！");
				showError($("#" + id + "Error"));
				return false;
			}
		}
	});
	// 通过校验，返回true
	return true;
}

/* 是否要用验证码
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
*/
