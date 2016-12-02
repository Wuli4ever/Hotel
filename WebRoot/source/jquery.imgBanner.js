// JavaScript Document

// Date:2015-05-31			 
// Author:liyang           	 
// For:KY Index Banner            	 

$(document).ready(function(){
	var timers;
	var $eachImg = $("#imgSlider .eachImg");
	//var $clickIconA = $("#imgSlider .clickIcon a");
	var allShowImg = $eachImg.length;
	//$("#imgSlider").append("<div class='clickIcon'></div>");
	
	//将图片转换成背景
	$eachImg.each(function() {
		var img_src = $(this).find("img").attr("src");  
		//$(this).css("background-img",img_src);
		$(this).css("background","url("+img_src+") top center no-repeat")
	});
	
	//for(i = 0; i < allShowImg; i++){
//		var newNum = i + 1; 
//		if(i == 0){
//			$("#imgSlider .clickIcon").append("<a href='javascript:void(0)' class='current'>"+ newNum +"</a>");	
//		}else{
//			$("#imgSlider .clickIcon").append("<a href='javascript:void(0)'>"+ newNum +"</a>");
//		}
//	}
	timers = setInterval("automaticPlay()",4000);
	
	//鼠标划过选项按钮时根据用户需求展示图片
	$("#imgSlider .clickIcon a").bind("mouseover",function(){
		 var a_index = $("#imgSlider .clickIcon a").index(this);
		 var a_class = $(this).attr("class");
		 if(a_class !== "current"){
				$eachImg.fadeOut(600);
				$eachImg.eq(a_index).fadeIn(600);
			 }
		 $("#imgSlider .clickIcon a").removeClass("current");
		 $(this).addClass("current");
		 clearInterval(timers);
	});
	$("#imgSlider .clickIcon a").bind("mouseout",function(){
		 timers = setInterval("automaticPlay()",4000);
	});
	
	//鼠标划过图片时暂停自动播放
	$eachImg.hover(function(){
		clearInterval(timers);
	},function(){
		timers = setInterval("automaticPlay()",4000);
	});
	
});

/*自动播放*/
function automaticPlay(){
	var $eachImg = $("#imgSlider .eachImg");
	var $clickIconA = $("#imgSlider .clickIcon a");
	var oldlistItem = $clickIconA.index($("#imgSlider .clickIcon a.current"));
	var newlistItem = oldlistItem + 1;
	var allItem = $clickIconA.length;
	if(allItem === newlistItem){
			$eachImg.fadeOut(600);
			$eachImg.eq(0).fadeIn(600);
			$clickIconA.removeClass("current");
			$clickIconA.eq(0).addClass("current");
		}
	else{
			$eachImg.fadeOut(600);
			$eachImg.eq(newlistItem).fadeIn(600);
			$clickIconA.removeClass("current");
			$clickIconA.eq(newlistItem).addClass("current");
		}	
}