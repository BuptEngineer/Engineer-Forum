$(document).ready(function() {
	$("#submitBtn").click(function() {
		var ctgId = $("#ctgId").val();
		var pName = $("#pName").val();
		if(pName == ""){
			alert("文章标题为空");
			return;
		}
		if(pName.length>30){
			alert("文章标题过长");
			return;
		}
		var pDesc = $("#pDesc").val();
		
		if(pDesc == ""){
			alert("文章内容为空");
			return;
		}
		if(pDesc.length>8000){
			alert("文章内容过多");
			return;
		}
		var post = new Object();
		post.ctgId = ctgId;
		post.pDesc = pDesc;
		post.pName = pName;
		
	    $.ajax({
	        url: "add",
	        type: "POST",
	        contentType : 'application/json;charset=utf-8', //设置请求头信息
	        dataType:"json",
	        data : JSON.stringify(post),
	        success: function(data){
	            alert(data);
	        },
	        error: function(res){
	            alert(res.responseText);
	        }
	    });
	});
	
	
});