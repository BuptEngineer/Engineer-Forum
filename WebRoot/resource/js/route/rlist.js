$(function() {
$("#js-load-more").click(function() {
		var count =$(".route-item").size();
		count = count-1;
		var ctgid=$("input[name='ctg_id']").val() ;
		var html="";
		$.ajax({
			url:"/engineer/RouteServlet",
			data:{method:"ajaxAddMore",begin:count,ctg_id:ctgid},
			type:"POST",
			dataType:"json",
			async:false,
			cache:false,
			success:function(routes){
				if(!routes){
					$("#js-load-more").text("暂时没有更多内容!");
					$("#js-load-more").unbind("click");
				}else{
					for(var i=0;i<routes.length;i++){alert(routes[i]);
						html="<div class='route-item'>"+
						"<div class='user-route'>"+
							"<div class='user-img'>"+
								"<a href='#'><img class='img-circle' src='user.jpg' /></a>"+
							"</div>"+
							"<div class='col-xs-11'>"+
								"<div class='ru-info'>"+
									"<p class='col-md-10 margin-bottom-small' style='padding:0'>"+
										"<a href='/engineer/RouteServlet?method=find&rt_id="+routes[i].rt_id +"' "+
											"class='route-name'>"+routes[i].rt_name+"</a>"+
									"</p>"+
									"<p class='col-md-2 margin-bottom-small'>"+
										"<i class='glyphicon glyphicon-thumbs-up'></i><strong>12</strong>"+
									"</p>"+
								"</div>"+
								"<p class='user-info'>"+
									"<a href='#'>"+routes[i].user.u_name +"</a>，<span>"+
										routes[i].user.u_desc+"</span>"+
								"</p>"+
							"</div>"+
						"</div>"+
						"<div class='route-desc'>"+
							routes[i].rt_desc + "<a href='/engineer/RouteServlet?method=find&rt_id="+routes[i].rt_id +"' " +
									" class='alert-link'>查看更多</a>"+
						"</div>"+
						"<p class='col-md-offset-1'>"+
							"<span class='time>"+routes[i].rt_time +"</span> " +
									"<span class='col-md-offset-1 time'>评论数：12</span>"+
						"</p>"+
					"</div>";
						
						
						
						
						$("#routeItems").append(html);
					}
				}//else
			}
		});//ajax
		
	});//click事件
});