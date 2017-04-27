$(function() {
		//1.遍历所有错误信息集合，调用showError方法确定是否显示错误信息
		$(".spanError").each(function(){
			showError($(this));//遍历每一个元素，判断装载错误信息的span是否显示
			
		}) ;
		//2.输入框得到焦点，隐藏错误信息
		$(".information").focus(function(){
			var spanId = $(this).attr("id")+"Error";//得到显示错误信息的span的id
			$("#"+spanId).text("");//将错误信息清空
			showError($("#"+spanId));//把元素隐藏掉
		});
		//3.输入框失去焦点
		$(".information").blur(function(){
			var id = $(this).attr("id");//获取当前元素的id
			var funName = "validate"+id.substring(0,1).toUpperCase()+id.substring(1)+"()";//对应校验方法名
			eval(funName);//eval将字符串变为可执行代码运行，即调用该方法
		});
		//4.提交
		$(".editsubmit").click(function(){
			
			var bool=true;
			if(!validateUsername()|!validatePassword()|!validateSex()){
				alert("输入非法，请修改后提交！");
				bool=false;
			}
			return bool;
		});
		
	});//

	function showError(ele){//有值显示，没有值就不显示
		var text = ele.text();
		if(!text){//错误信息为空，则span不显示
			ele.css("display","none");
		}else{
			ele.css("display","");//默认显示
		}
	};
	//昵称校验
	function validateUsername(){
		var id="username";
		//校验非空
		var value=$("#"+id).val();//获取输入框内容
		if(!value){
			$("#"+id+"Error").text("昵称不能为空！");
			showError($("#"+id+"Error"));
			return false;
		}
		//username长度校验
		if(value.length<2||value.length>20){
			$("#"+id+"Error").text("2<长度<20");
			showError($("#"+id+"Error"));
			return false;
		}
		return true;
	}
	//性别校验-------------
	function validateSex(){
		var id="sex";
		//校验非空
		var value=$("#"+id).val();//获取输入框内容
		if(!value){
			$("#"+id+"Error").text("性别不能为空！");
			showError($("#"+id+"Error"));
			return false;
		}
		//性别合法校验
		if(value!="男"&&value!="女"){
			$("#"+id+"Error").text("性别输入不合法!");
			showError($("#"+id+"Error"));
			return false;
		}
		return true;
	}
	//密码的校验
	function validatePassword(){
		var id="password";
		//校验非空
		var value=$("#"+id).val();//获取输入框内容
		if(!value){
			$("#"+id+"Error").text("密码不能为空！");
			showError($("#"+id+"Error"));
			return false;
		}
		//密码长度校验
		if(value.length<6||value.length>20){
			$("#"+id+"Error").text("6<长度<20)");
			showError($("#"+id+"Error"));
			return false;
		}
		return true;
	}