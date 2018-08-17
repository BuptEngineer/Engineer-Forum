function checkTitle(){

var m=$("#Qtitle").val();

if(m.length>25){
	alert("问题主题字符串长度超过25，将只保留前25个字符");
var news = m.substr(0,25);
$("#Qtitle").val(news);
}
}

function checkDesc(){
	var m=$("#Qdesc").val();
if(m.length>300){
	alert("问题描述字符串长度超过300，将只保留前300个字符");
var news = m.substr(0,300);
$("#Qdesc").val(news);
}
}

function fsend()
{ 
var m=$("#Qtitle").val();
if(m.length==0)
{
	alert("问题标题不可以为空！");
	$("#Qtitle").focus();
	}
else
document.getElementById('form1').submit();

}



