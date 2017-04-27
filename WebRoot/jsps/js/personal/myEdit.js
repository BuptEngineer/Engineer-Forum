	// 遮罩层start
	jQuery(document).ready(function($) {
			$('.theme-login').click(function(){
				$('.theme-popover-mask').fadeIn(100);
				$('.theme-popover').slideDown(200);
			})
			$('.theme-poptit .close').click(function(){
				$('.theme-popover-mask').fadeOut(100);
				$('.theme-popover').slideUp(200);
			})
		
		});
		//遮罩层end
	//<!-- 上传js-start -->
	function PreviewImage(imgFile) 
	   { 
	    var pattern = /(\.*.jpg$)|(\.*.png$)|(\.*.jpeg$)|(\.*.gif$)|(\.*.bmp$)/;      
	    if(!pattern.test(imgFile.value)) 
	    { 
	     alert("系统仅支持jpg/jpeg/png/gif/bmp格式的照片！");  
	     imgFile.focus(); 
	     
	    } 
	    else 
	    { 
	     var path; 
	     if(document.all)//IE 
	     { 
	      imgFile.select(); 
	      path = document.selection.createRange().text; 
	      
	      document.getElementById("imgPreview").style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enabled='true',sizingMethod='scale',src=\"" + path + "\")";//使用滤镜效果 
	     } 
	     else//FF 
	     { 
	      path = URL.createObjectURL(imgFile.files[0]);
	      document.getElementById("imgPreview").innerHTML = "<img src='"+path+"'/>"+"<div class=\"uploadImage\"> <input id=\"upload\" class=\"upload\"  type=\"file\" onchange='PreviewImage(this)'/><label>上传图片</label> </div>"; 
	     } 
	    } 
	   }
	//<!-- upload-end -->