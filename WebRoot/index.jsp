<%@ page language="java" import="java.util.*" %>
<%@ page language="java" import="hotel.category.*" %>
<%@ page language="java" import="hotel.user.*" %>
<%@ page language="java" import="hotel.food.*" %>
<%
	List<Category> categories = CategoryMgr.getMgr().getCategories();
	List<Category> list = CategoryMgr.getMgr().getLatestCategories();
	User u = (User)session.getAttribute("User");
	List<Food> foods = FoodMgr.getMgr().getFoods();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<!-- saved from url=(0042)http://www.kaiyuanhotels.com/web/index.htm -->
<HTML>
<HEAD>
<META content="IE=11.0000" http-equiv="X-UA-Compatible">
 
<META http-equiv="Content-Type" content="text/html; charset=utf-8"> 
<META name="keywords" content="商务酒店,豪华酒店,高档酒店,连锁酒店">
<META name="description" content="为您提供便捷的在线预订服务，让您尽享开元关怀。24小时服务热线：1010-5050。"> 
<SCRIPT src="source/jquery-1.9.1.min.js" type="text/javascript"></SCRIPT>
<SCRIPT src="source/jquery.imgBanner.js" type="text/javascript"></SCRIPT>

 
<SCRIPT src="source/jquery.datetimepicker.js" type="text/javascript"></SCRIPT>
 
<SCRIPT src="source/jquery-common-1.0.0.js" type="text/javascript"></SCRIPT>

<LINK href="source/global.css" rel="stylesheet" type="text/css"> 
<LINK href="source/style.css" rel="stylesheet" type="text/css">
<LINK href="source/jquery.datetimepicker.css" rel="stylesheet" type="text/css">

<TITLE>数据库课程设计</TITLE> 
<STYLE>
#chooseCityArea div{
 display:none;
}
#chooseCityArea div.current{
 display:block;
}
.bannerAndSearch .searchBg dl dd .destination_1 #chooseCityArea a{
    white-space:normal;
    float:left;
    width:48px;
}

</STYLE>

<META name="GENERATOR" content="MSHTML 11.00.9600.18231">
<script>
function getDay() {
		var id = document.form1.month.options[document.form1.month.selectedIndex].value;
		if(id==1||id==3||id==5||id==7||id==8||id==10||id==12) {
			document.form1.day.length = 31;
			document.form1.day.selectedIndex=0;
			for(var i=0;i<31;i++) {
				document.form1.day.options[i].text=""+(i+1)+"号";
				if(i+1<10) {
	  				document.form1.day.options[i].value="0"+(i+1);
				} else {
					document.form1.day.options[i].value=i+1;
				}
			}
		}
		if(id==4||id==6||id==9||id==11) {
			document.form1.day.length = 30;
			document.form1.day.selectedIndex=0;
			for(var i=0;i<30;i++) {
				document.form1.day.options[i].text=""+(i+1)+"号";
				if(i+1<10) {
	  				document.form1.day.options[i].value="0"+(i+1);
				} else {
					document.form1.day.options[i].value=i+1;
				}
			}
		}
		if(id == 2) {
			document.form1.day.length = 28;
			document.form1.day.selectedIndex=0;
			for(var i=0;i<28;i++) {
				document.form1.day.options[i].text=""+(i+1)+"号";
				if(i+1<10) {
	  				document.form1.day.options[i].value="0"+(i+1);
				} else {
					document.form1.day.options[i].value=i+1;
				}
			}
		}
	}
	
	function getDay1() {
		var id = document.form1.month1.options[document.form1.month1.selectedIndex].value;
		if(id==1||id==3||id==5||id==7||id==8||id==10||id==12) {
			document.form1.day1.length = 31;
			document.form1.day1.selectedIndex=0;
			for(var i=0;i<31;i++) {
				document.form1.day1.options[i].text=""+(i+1)+"号";
				if(i+1<10) {
	  				document.form1.day1.options[i].value="0"+(i+1);
				} else {
					document.form1.day1.options[i].value=i+1;
				}
			}
		}
		if(id==4||id==6||id==9||id==11) {
			document.form1.day1.length = 30;
			document.form1.day1.selectedIndex=0;
			for(var i=0;i<30;i++) {
				document.form1.day1.options[i].text=""+(i+1)+"号";
				if(i+1<10) {
	  				document.form1.day1.options[i].value="0"+(i+1);
				} else {
					document.form1.day1.options[i].value=i+1;
				}
			}
		}
		if(id == 2) {
			document.form1.day1.length = 28;
			document.form1.day1.selectedIndex=0;
			for(var i=0;i<28;i++) {
				document.form1.day1.options[i].text=""+(i+1)+"号";
				if(i+1<10) {
	  				document.form1.day1.options[i].value="0"+(i+1);
				} else {
					document.form1.day1.options[i].value=i+1;
				}
			}
		}
	}
</script
></HEAD> 
<BODY>
<DIV class="headTop clearfix">
<DIV class="logo">
<IMG width="162" height="64" alt="" src="source/logo.jpg">
</DIV>
<DIV class="show">
<IMG width="322" height="57" src="source/1602170907465275.jpg"> 
</DIV>
<DIV class="rightIc clearfix">
<DL class="clearfix" style="cursor: pointer;" >
  <DT class="icon_1">手机专享</DT>
  <DD>
  	<%
	if(u!=null) {
		out.println("欢迎您:"+u.getName());
	}
%>
  </DD></DL>
</DIV></DIV>
<DIV class="navBg">
<DIV class="webMain clearfix">
<DIV class="nav">
<A href="index.jsp">首页</A>
<A href="BookDetail.jsp">预定信息</A>
</DIV>
<DIV class="userAbout">

<A href="login.jsp">登录</A>
<A href="admin/userReg.jsp">注册</A>
</DIV></DIV></DIV>
<SCRIPT type="text/javascript">
    $("#logOffBtn").click(function(){
       window.location.href = "/web/index/logOff.htm";
    });
    $("#loginBtn").click(function() {
        openLoginDialog();
    });

    function openLoginDialog() {
        $("#gray,#loginBox").show();
        $("#loginBox .loginChoose a.sBtn").removeClass("current");
        $("#loginBox .loginChoose a.sBtn").eq(0).addClass("current");
        $("#loginBox .loginChoose a.sBtn").parents("#loginBox").find(".show").hide();
        $("#loginBox .loginChoose a.sBtn").parents("#loginBox").find(".show").eq(0).show();
    }

    function toMobile() {
        window.location.href = "/web/about/context.htm?param=testese";
    }

    function toConnection() {
        window.location.href = "/web/about/context.htm?param=contact";
    }
</SCRIPT>
 
<DIV class="bannerAndSearch"><!--轮播开始-->     
<DIV id="imgSlider">
<DIV class="eachImg" style="display: block;"><IMG 
width="100%" title="约惠春天" alt="约惠春天" src="source/1603091924367793.jpg"> 
                </DIV>
<DIV class="eachImg"><IMG 
width="100%" title="银联支付立减" alt="银联支付立减" src="source/1602291101242697.jpg"> 
                </DIV>
<DIV class="eachImg"><IMG 
width="100%" title="猴年闹新春" alt="猴年闹新春" src="source/1602170856205084.jpg"> 
                </DIV>
<DIV class="eachImg"><IMG 
width="100%" title="感恩回馈" alt="感恩回馈" src="source/1512311751369901.jpg"> 
                </DIV>
<DIV class="eachImg"><IMG 
width="100%" title="开元掌价" alt="开元掌价" src="source/1601151750136274.jpg"> 
                </DIV>
<DIV class="clickIcon">
<DIV class="webMain">
<A class="current" href="javascript:void(0)">约惠春天</A>                                                                                        
<A href="javascript:void(0)">银联支付立减</A>                             
<A href="javascript:void(0)">猴年闹新春</A>                                                                                
<A href="javascript:void(0)">感恩回馈</A>                                         
<A href="javascript:void(0)">开元掌价</A>                                             
</DIV></DIV></DIV><!--轮播结束-->
<form action="RoomSearch.jsp" method="post" name="form1">       	     
<DIV class="searchBox">
<DIV class="searchBg">
<H2>酒店预订</H2>
<DL class="clearfix">
  <DT>类别</DT>
  <DD class="faBox_1">
  <select name="category">
  <%
  	for(int i=0;i<categories.size();i++) {
  		Category c = categories.get(i);
  %>
  	<option value="<%=c.getId() %>"><%=c.getName() %></option>
  <% } %>
  </select> 
                      
  </DD></DL>
<DL class="clearfix">
  <DT>入住</DT>
  <DD>
  <select name="month" onChange="getDay()">
    					<option value="0" selected="selected">选择月份</option>
    					<option value="01">1月</option>
    					<option value="02">2月</option>
    					<option value="03">3月</option>
    					<option value="04">4月</option>
    					<option value="05">5月</option>
    					<option value="06">6月</option>
    					<option value="07">7月</option>
    					<option value="08">8月</option>
    					<option value="09">9月</option>
    					<option value="10">10月</option>
    					<option value="11">11月</option>
    					<option value="12">12月</option>
   </select> 
   <select name="day">
   </select>
  <SPAN class="tui">退房</SPAN>                     
	<select name="month1" onChange="getDay1()">
    					<option value="0" selected="selected">选择月份</option>
    					<option value="01">1月</option>
    					<option value="02">2月</option>
    					<option value="03">3月</option>
    					<option value="04">4月</option>
    					<option value="05">5月</option>
    					<option value="06">6月</option>
    					<option value="07">7月</option>
    					<option value="08">8月</option>
    					<option value="09">9月</option>
    					<option value="10">10月</option>
    					<option value="11">11月</option>
    					<option value="12">12月</option>
    </select>
     <select name="day1">
    </select>
  </DD>
</DL>

<DL class="clearfix">
  <DT></DT>
  <DD><input type="submit" value="搜索"></DD></DL></DIV></DIV></form>
<DIV class="webMain">
<DIV class="youLikeBox clearfix">
<DIV class="youLikeMain">
<H2>以下为食品信息&gt;&gt;
<SPAN>食品列表</SPAN></H2>
<DIV id="slider">
<DIV class="slider_content">
<%
	for(int i=0;i<foods.size();i++) {
		Food f = foods.get(i);
%>
<DIV class="each">
<A class="aImg" href="FoodDetail.jsp?id=<%=f.getId() %>">
<IMG width="153" height="153" src="photo/<%=f.getId() %>food.jpg">
</A>
<P class="name"><A href="javascript:void(0)"><%=f.getName() %></A></P>
<P class="price">
<SPAN>
原价:<EM style="text-decoration: line-through;">￥<%=f.getNormal() %></EM>
</SPAN>￥<%=f.getNow() %></P>
<A class="buy" href="FoodDetail.jsp?id=<%=f.getId() %>">立即购买</A></DIV>
<% } %>
</DIV></DIV>
<DIV class="prAndNe"><A title="上一页" class="prev" href="javascript:void(0)">‹</A> 
                <A title="下一页" class="next" href="javascript:void(0)">›</A>      
       </DIV></DIV>
</DIV></DIV>
<DIV class="newAct">
<H2><A 
href="MoreCategory.jsp">更多&gt;&gt;</A>房间类别</H2>
<DIV class="actBox">
<DIV class="actCon clearfix">
<%
	for(int i=0;i<list.size();i++) {
		Category c = list.get(i);	
%>
<DIV class="actEach">
<A href="ShowDetail.jsp?id=<%=c.getId() %>">
<IMG width="243" height="156" src="photo/<%=c.getId() %>.jpg">
</A> 
                    
<P><%=c.getName() %></P>
</DIV>
<% } %>
</DIV></DIV></DIV>
<DIV class="whyChoose">

</DIV>
<DIV class="fexdBox"></DIV>
 
<DIV style="display: none;">

 
<SCRIPT type="text/javascript">
	$(document).ready(function(){
		var timerProduct;
		var imgLength = $("#slider .slider_content .each").length;
		var boxWidth = 195 * imgLength;
		$("#slider .slider_content").css("width",boxWidth);
		timerProduct = setInterval("next();",4000);
		//点击向右翻转
		$(".prAndNe a.next").click(function(){
			next();
		});
		//点击向左翻转
		$(".prAndNe a.prev").click(function(){
			prev();
		});

		$("#slider .slider_content,.prAndNe a").hover(function() {
			clearInterval(timerProduct);
		}, function() {
			timerProduct = setInterval("next();",4000);
		});

        var toLeft = ($(window).width() - 1024)/2;
        $(".bannerAndSearch .searchBox").css("left",toLeft);

	});
		//向右翻动函数
		function next(){
			$("#slider .slider_content").animate({left:"-780px"}, 1000,function(){
				$("#slider .slider_content").css("left","0");
				$("#slider .slider_content .each:lt(4)").appendTo("#slider .slider_content");
			});
		}
		//向左翻动函数
		function prev(){	
			$("#slider .slider_content").css("left","-780px");	
			$("#slider .slider_content .each:gt(-4)").prependTo("#slider .slider_content");			
			$("#slider .slider_content").animate({left:"0"}, 600);				
		}
</SCRIPT>
 </DIV></BODY></HTML>
