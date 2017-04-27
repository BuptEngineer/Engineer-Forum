
//用来接收返回的信息


function dlt(a_id,Q_id){

var t=confirm("确定将自己的回答删除！");
if(t)
window.location.href ="QuestionServlet?method=deleteAnswer&&a_id="+a_id+"&&q_id="+Q_id;
}


//用来更新答案
function updateA(a_id,Q_id){

	
	$("#a_content").hide(0.00001);
	$("#form2").slideDown(5);
}

//放弃修改

function giveup(){
	$("#form2").hide(0.00001);
	//$("#form2").text("");
	$("#a_content").show(0.00001);
}




function checkDesc(){
	var m=$("#Adesc").val();
if(m.length>300){
	alert("问题描述字符串长度超过300，将只保留前300个字符");
var news = m.substr(0,300);
$("#Adesc").val(news);
}
}


function NcheckDesc(){
	var m=$("#newAdesc").val();
if(m.length>300){
	alert("问题描述字符串长度超过300，将只保留前300个字符");
var news = m.substr(0,300);
$("#newAdesc").val(news);
}
}


function fsend()
{ 
var m=$("#Adesc").val();
if(m.length==0)
{
	alert("回答不能为空！");
	$("#Adesc").focus();
	}
else

document.getElementById('form1').submit();
}

function Nfsend()
{ 
var m=$("#newAdesc").val();
if(m.length==0)
{
	alert("回答不能为空！");
	$("#newAdesc").focus();
	}
else

document.getElementById('form2').submit();
}


function IsAnswered(){
	
	if(+$("#dltLink").text()!=""){
		alert("您已经为该问题添加过答案了！");
		return true;
	}
	return false;
}


