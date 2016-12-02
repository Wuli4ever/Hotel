<%@ page language="java" import="hotel.category.* " %>
<%@ page language="java" import="java.util.* " %>
<%
	List<Category> categories = CategoryMgr.getMgr().getCategories();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML 
xmlns="http://www.w3.org/1999/xhtml"><HEAD><META content="IE=11.0000" 
http-equiv="X-UA-Compatible">
 
<META http-equiv="Content-Type" content="text/html; charset=utf-8"> 
<META name="keywords" content="关键字,关键字"> 
<META name="description" content="我们网站是干什么的，这里就是一大串的说明"> 
<SCRIPT src="more/jquery-1.9.1.min.js" type="text/javascript"></SCRIPT>
 
<SCRIPT src="more/jquery.imgBanner.js" type="text/javascript"></SCRIPT>
 
<SCRIPT src="more/jquery.datetimepicker.js" type="text/javascript"></SCRIPT>
 
<SCRIPT src="more/jquery-common-1.0.0.js" type="text/javascript"></SCRIPT>
 <LINK href="more/global.css" rel="stylesheet" type="text/css"> <LINK 
href="more/style.css" rel="stylesheet" type="text/css"> <LINK href="more/jquery.datetimepicker.css" 
rel="stylesheet" type="text/css"> <LINK href="/gw/w/images/kaiyuan.ico" rel="shortcut icon" 
type="image/x-icon"> <TITLE>数据库课程设计</TITLE> 
<STYLE>
#chooseCityArea div{
 display:none;
}
#chooseCityArea div.current{
 display:block;
}
.chooseInputBox .placeBox .destination_1 #chooseCityArea a {
	white-space:normal;
	float:left;
    width:48px;
}
</STYLE>

<META name="GENERATOR" content="MSHTML 11.00.9600.18231"></HEAD> 
<BODY>

<DIV class="navBg">
<DIV class="webMain clearfix">
<DIV class="nav">
<A href="index.jsp">首页</A>
</DIV>
<DIV class="userAbout">
<A href="login.jsp">登录</A>
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
 
<DIV class="privilege">
<DIV class="crumbs">
<A href="index.jsp">首页</A>&gt;<SPAN>全部类别</SPAN>    
 </DIV>
<DIV class="bannerAndSearch"><!--轮播开始-->         
<DIV id="imgSlider">
<DIV class="eachImg" style="display: block;">

<IMG width="100%" title="banner1" alt="banner1" src="more/1602170928533534.jpg"> 

</DIV>
<DIV class="eachImg">

<IMG width="100%" title="banner2" alt="banner2" src="more/1511241550535934.jpg"> 

</DIV>
<DIV class="clickIcon">
<DIV class="webMain"><A class="current" href="javascript:void(0)">安吉开元·曼居</A>    
            	                		 <A href="javascript:void(0)">千岛龙庭</A>            
    	                                     </DIV></DIV></DIV><!--轮播结束-->          
       
</DIV>
<DIV class="allBox">
<DIV class="allChoose">
<A class="current" href="MoreCategory.jsp">全部</A>
</DIV>
<DIV class="all" style="display: block;">
<DIV class="list clearfix">

<%
	for(int i=0;i<categories.size();i++) {
		Category c = categories.get(i);
%>
<DIV class="each">
<DIV class="imgShow"><IMG width="320" height="210" src="photo/<%=c.getId() %>.jpg">                         
<DIV class="detailInfo">
<P></P>
<DIV class="btnBox"><A href="ShowDetail.jsp?id=<%=c.getId() %>">了解详情</A> 
</DIV></DIV></DIV>
<P class="name"><%=c.getName() %></P></DIV>
<% } %>
</DIV></DIV></DIV></DIV>
<DIV class="footer">
<DIV class="footerBg">
<DIV class="footerMainBox">
<DIV class="footerMain clearfix">
<DIV class="each">
</DIV>
<STYLE>/*返回顶部*/
    #back_top{ width:40px; height:40px; position:fixed; right:5px; bottom:5px; z-index:999; display:none;}
    #back_top a{ display:block; width:40px; height:40px; cursor:pointer; text-indent:-9999px; outline:none; background:url(/gw/w/images/back-up.png) no-repeat;background-size: 40px 40px;}
    /*#back_top a:hover{ background-position:-32px 0;}*/
    *html #back_top{position:absolute;cursor:pointer;right:20px; display:none;top:expression(eval(document.documentElement.scrollTop+document.documentElement.clientHeight)-260+"px")}
</STYLE>
 
<SCRIPT>
    $(document).ready(function(){
        $.fn.backtoTop = function(options) {
            var defaults = {
                showHeight : 150,
                speed : 1000
            };
            var options = $.extend(defaults,options);
            $("body").append("<div id='back_top'><a href='javascript:void(0)' class='to_top'>返回顶部</a></div>");
            $(this).scroll(function(){
                var scrolltop=$(this).scrollTop();
                if(scrolltop>=options.showHeight){
                    $("#back_top").show();
                }
                else{
                    $("#back_top").hide();
                }
            });
            $("#back_top a.to_top").click(function(){
                $("html,body").animate({scrollTop: 0}, options.speed);
            });
        }
        $(window).backtoTop({
            showHeight : 50,//设置滚动高度时显示
            speed : 500 //返回顶部的速度以毫秒为单位
        });
    });

</SCRIPT>
 
<DIV style="display: none;">
<SCRIPT type="text/javascript">
    var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
    document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F15515066fa52ea3346d80ce869fa3a2e' type='text/javascript'%3E%3C/script%3E"));
</SCRIPT>
 </DIV><!--弹窗开始--> 
<DIV id="gray"></DIV>
<DIV id="loginBox">
<DIV class="loginChoose"><A class="sBtn current" 
href="javascript:void(0)">登录</A><A class="sBtn" 
href="javascript:void(0)">免费注册</A><A class="close" 
href="javascript:void(0)">关闭</A></DIV>
<H3>商祺会登录</H3>
<FORM id="loginForm" action="#" method="post"><INPUT name="redirectUrl" type="hidden"> 
    
<DIV class="show" style="display: block;">
<DL class="clearfix">
  <DT>会员账号：</DT>
  <DD><INPUT name="userName" type="text" placeholder="输入会员卡号或手机号码" value="">     
          </DD></DL>
<DL class="clearfix">
  <DT>密 码：</DT>
  <DD><INPUT name="password" type="password" placeholder="输入密码" value="">        
           <A 
  href="http://www.kaiyuanhotels.com/web/index/toBeforeUpdPsw.htm">忘记密码</A>      
         </DD></DL>
<DL class="clearfix">
  <DT></DT>
  <DD><A class="loginBtn" id="loginBtn_2" style="height: 30px; line-height: 30px; margin-right: 10px; float: left;" 
  href="javascript:void(0)">登录</A><A href="http://www.kaiyuanhotels.com/web/about/aboutKaiyuan.htm?context.contextTypeEnum=PREFERENTIAL" 
  target="_blank">了解会员权益</A>             </DD></DL>
<DL class="clearfix">
  <DT></DT>
  <DD 
  style="color: rgb(255, 153, 0); font-size: 14px;"><SPAN>登录商祺会预订客房最高立减120元。</SPAN> 
              </DD></DL>
<DL class="clearfix" style="padding: 25px 0px 10px; border-top-color: rgb(228, 228, 228); border-top-width: 1px; border-top-style: solid;">
  <DT>快捷登录：</DT>
  <DD><A class="qq" 
  href="http://www.kaiyuanhotels.com/qqLogin/qqLogin.htm">qq</A><A class="alipay" 
  href="http://www.kaiyuanhotels.com/alipayLogin/alipayLogin.htm">支付宝</A></DD></DL></DIV></FORM>
<FORM id="registerForm" action="#" method="post">
<DIV class="show"><INPUT name="imgName" id="imgName" type="hidden">         
<INPUT name="reCheckCode" id="reCheckCode" type="hidden">         
<DL class="clearfix">
  <DT>手机或邮箱：</DT>
  <DD><INPUT name="mobile" id="mobile" type="text" placeholder="输入手机号码或邮箱" value=""> 
              </DD></DL>
<DL class="clearfix">
  <DT>验证码：</DT>
  <DD><INPUT name="checkCode" class="textIn textIn1214" id="checkCode" type="text" placeholder="输入验证码" value=""> 
                  <A class="psw" onclick="sendRegisterCheckCode(this)" href="javascript:void(0)">获取验证码</A> 
              </DD></DL>
<DL class="clearfix">
  <DT>姓名：</DT>
  <DD><INPUT name="registerMemberInfo.nameCN" id="nameCN" type="text" placeholder="输入姓名" value=""> 
              </DD></DL>
<DL class="clearfix">
  <DT>性别：</DT>
  <DD><INPUT name="registerMemberInfo.sex" style="width: auto;" type="radio" 
  value="M">男                 <INPUT name="registerMemberInfo.sex" style="width: auto;" 
  type="radio" value="F">女             </DD></DL>
<DL class="clearfix">
  <DT>出生日期：</DT>
  <DD><SELECT name="year" id="year"><OPTION></OPTION>                          
               </SELECT>&nbsp;年                 <SELECT name="month" 
    id="month"><OPTION></OPTION>                     <OPTION 
    value="1">01</OPTION>                     <OPTION value="2">02</OPTION>      
                   <OPTION value="3">03</OPTION>                     <OPTION 
    value="4">03</OPTION>                     <OPTION value="5">05</OPTION>      
                   <OPTION value="6">06</OPTION>                     <OPTION 
    value="7">07</OPTION>                     <OPTION value="8">08</OPTION>      
                   <OPTION value="9">09</OPTION>                     <OPTION 
    value="10">10</OPTION>                     <OPTION value="11">11</OPTION>    
                     <OPTION value="12">12</OPTION>                 
  </SELECT>&nbsp;月                 <SELECT name="day" id="day"></SELECT>&nbsp;日  
             </DD></DL>
<DL class="clearfix">
  <DT></DT>
  <DD><A class="loginBtn" id="registerBtn_2" style="height: 30px; line-height: 30px; margin-right: 10px; float: left;" 
  href="javascript:void(0)">注册</A><A href="http://www.kaiyuanhotels.com/web/about/aboutKaiyuan.htm?context.contextTypeEnum=PREFERENTIAL" 
  target="_blank">了解会员权益</A>             </DD></DL>
<DL class="clearfix">
  <DT></DT>
  <DD><A style="padding-left: 80px;" href="http://www.kaiyuanhotels.com/web/index/toRegisterPartner.htm">合作伙伴注册</A> 
              </DD></DL></DIV></FORM></DIV>
<DIV class="copyrightDetail" style="width: 360px; height: 215px; margin-top: -160px; margin-left: -170px; display: none;">
<DIV class="posR"><A class="close" href="javascript:void(0)">关闭</A>
<DIV class="detailMain clearfix" style="width: 340px; height: 215px;">
<DIV style="padding-bottom: 10px; border-bottom-color: rgb(37, 119, 227); border-bottom-width: 1px; border-bottom-style: solid;"><STRONG><SPAN 
style="color: rgb(100, 69, 29);">这是个机器人猖狂的年代，输入以下验证码来验明正身吧！~</SPAN>              
   </STRONG>             </DIV>
<DIV style="text-align: center; margin-top: 20px;"><IMG width="120" height="40" 
id="checkCodePic" onclick="getRegisterCodeImage()" src=""><A id="checkCodeGet" 
style="left: 10px; top: 10px; padding-top: 10px; font-size: 14px; position: relative;" 
href="http://www.kaiyuanhotels.com/web/recommend/index.htm#">看不清</A>             
</DIV>
<DIV style="text-align: center; padding-top: 10px;">
<DIV 
style="margin-left: -50px;">请输入验证码：<INPUT id="webCheckCode" type="text"></DIV>
<DIV style="margin-left: 32px;"><A class="sure" href="http://www.kaiyuanhotels.com/web/recommend/index.htm#">确定</A></DIV></DIV></DIV></DIV></DIV>
<SCRIPT>

    $(".copyrightDetail .close").click(function(){
        $(".copyrightDetail").hide();
    });
</SCRIPT>
 
<SCRIPT type="text/javascript">
    $("#loginBox .loginChoose a.sBtn").click(function(){
        var thisIndex = $("#loginBox .loginChoose a.sBtn").index(this);
        $("#loginBox .loginChoose a.sBtn").removeClass("current");
        $(this).addClass("current");
        $(this).parents("#loginBox").find(".show").hide();
        $(this).parents("#loginBox").find(".show").eq(thisIndex).show();
        var type = $(this).text();
        if (type == "登录") {
            $("#loginBox h3").text("商祺会登录");
        } else if (type == "免费注册") {
            $("#loginBox h3").text("免费注册");
        }
    });

    $("#loginBox a.close").click(function(){
        $("#gray,#loginBox").hide();
    });
    $("#loginBox #registerBtn_2").click(function() {

        if (!isNotEmpty($("#loginBox #mobile").val())) {
            alert("请输入手机号码或邮箱！");
            $("#loginBox #mobile").focus();
            return false;
        }

        if (!isNotEmpty($("#loginBox #checkCode").val())) {
            alert("请输入验证码！");
            $("#loginBox #checkCode").focus();
            return false;
        }

        if (!isNotEmpty($("#loginBox #nameCN").val())) {
            alert("请输入姓名！");
            $("#loginBox #nameCN").focus();
            return false;
        }

        if (!isNotEmpty($("#loginBox #year").val())) {
            alert("请输入生日！");
            $("#loginBox #year").focus();
            return false;
        }

        if (!isNotEmpty($("#loginBox #month").val())) {
            alert("请输入生日！");
            $("#loginBox #month").focus();
            return false;
        }

        if (!isNotEmpty($("#loginBox #day").val())) {
            alert("请输入生日！");
            $("#loginBox #day").focus();
            return false;
        }

        url ="/web/index/register.htm";
        $.ajax({
            type: "post",
            cache:false,
            dataType: "text",
            data:$("#loginBox #registerForm").serialize(),
            url: url,
            success: function(data){
                var data = $.parseJSON(data);
                if (data.statusCode == '200') {
                    if(isNotEmpty(data.message)) {
                        alert(data.message);
                    }
                    window.location.href = "/web/index/toLogin.htm";
                } else if (data.statusCode == '300') {
                    alert(data.message);
                    return true;
                } else {
                    alert("请求出错！");
                    return false;
                }
            }
        });
    });
    $("#loginBox #loginBtn_2").click(function() {
        
        
            var loginTxt = $(this).text();
            if (loginTxt == "登录") {
                $(this).text("登录中……");
                loginNoRepeat("/web/index/login.htm","loginForm","/web/index.htm");
            }
        

    });

    function loginNoRepeat(url,formId,forwardUrl) {
        $.ajax({
            type: "post",
            cache:false,
            dataType: "text",
            data:$("#loginBox #"+formId).serialize(),
            url: url,
            success: function(data){
                var data = $.parseJSON(data);
                if (data.statusCode == '200') {
                    if(isNotEmpty(data.message)) {
                        alert(data.message);
                    }
                    $("#loginBox #loginBtn_2").text("登录");
                    window.location.href= forwardUrl;
                    return true;
                } else if (data.statusCode == '300') {
                    alert(data.message);
                    $("#loginBox #loginBtn_2").text("登录");
                    return true;
                } else {
                    $("#loginBox #loginBtn_2").text("登录");
                    alert("请求出错！");
                    return false;
                }
            },
            error:function(data) {
                alert("哎哟喂，服务器被挤爆了，请稍后再试！");
                $("#loginBox #loginBtn_2").text("登录");
            }
        });
    }
    $("#loginBox #month").change(function() {
        refreshDayList();
    });
    $("#loginBox #year").change(function() {
        refreshDayList();
    });
    function refreshDayList() {
        url = "/web/index/dayList.htm?month="+ $("#loginBox #month").val() + "&year=" + $("#loginBox #year").val();
        $.ajax({
            type: "post",
            cache:false,
            dataType: "text",
            url: url,
            success: function(data){
                if(data) {
                    $("#loginBox #day").empty();
                    $("#loginBox #day").append(data);
                }
            }
        });
    }

    var wait = 60;
    function sendRegisterCheckCode(ojb) {
        var senTo = $("#loginBox #mobile");
        var sendToValue = senTo.val();
        if (!isNotEmpty(sendToValue)) {
            senTo.focus();
            alert("请输入手机号码或邮箱!");
            return false;
        }
        var ifTrue = false;
        if (isPhone(sendToValue)) {
            ifTrue = true;
        }

        if (isEmail(sendToValue)) {
            ifTrue = true;
        }

        if (!ifTrue) {
            senTo.focus();
            alert("请输入正确的手机号码或邮箱!");
            return false;
        }
        $(".copyrightDetail #webCheckCode").val("");
        url = "/web/index/sendrrRegisterCheckCode.htm"
        $.ajax({
            type: "post",
            cache:false,
            dataType: "text",
            data:$("#loginBox #registerForm").serialize(),
            url: url,
            success: function(data){
                data = $.parseJSON(data);
                if (data.statusCode == '200') {
                    $("#loginBox input[name='checkCode']").focus();
                    $(".copyrightDetail").css("display", "none");
                    wait = 60;
                    time(ojb);
                } else if (data.statusCode == '300') {
                    senTo.focus();
                    alert(data.message);
                    $(".copyrightDetail").css("display", "none");
                    return false;
                } else if (data.statusCode == '110') {
                    getRegisterCodeImage();
                    $(".copyrightDetail").css("display", "block");
                } else {
                    alert("请求出错！");
                    $(".copyrightDetail").css("display", "none");
                    return false;
                }
            },
            error: function(data){
                alert("哎哟喂，服务器被挤爆了，请稍后再试！");
                $(".copyrightDetail").css("display", "none");
            }
        });

    }
    function time(ojb) {
        if (wait == 0) {
            $(ojb).attr("href","javascript:void(0)");
            $(ojb).attr("onclick","sendRegisterCheckCode(this);");
            $(ojb).text("获取验证码");
            wait = 60;
        } else if (wait <= 60) {
            $(ojb).removeAttr("href");
            $(ojb).removeAttr("onclick");
            $(ojb).text("重新发送(" + wait + ")");
            wait--;
            setTimeout(function() {
                        time(ojb);
                    },
                    1000)
        } else {
            return;
        }
    }

    $(".copyrightDetail .sure").click(function() {
        $("#loginBox #reCheckCode").val($(".copyrightDetail #webCheckCode").val());
        sendRegisterCheckCode($("#loginBox .psw"));
        $(".copyrightDetail #webCheckCode").val("");
    });

    $(".copyrightDetail #checkCodeGet").click(function() {
        getRegisterCodeImage();
    });

    function getRegisterCodeImage() {
        $(".copyrightDetail #checkCodePic").attr("src","/validateCode/getCodeImage?session_code_key=REGISTER_CODE_KEY&t=" + new Date().getTime());
        $(".copyrightDetail #webCheckCode").val("");
    }

</SCRIPT>
 <!--弹窗结束--> 
<SCRIPT type="text/javascript">
	$(document).ready(function(){

        //界面初始化
        $("#citySearch").val("杭州市");
        var myDate = new Date();
        var month = myDate.getMonth() + 1;
        if (month < 10) month = "0" + month;
        var date = myDate.getDate();
        if (date < 10) date = "0" + date;
        myDate = myDate.getFullYear()+"-" + month + "-"+ date;
        $("#startTime").val(myDate);
        myDate = plusDays(myDate, 1);
        $("#endTime").val(myDate);

		//获取历史搜索记录
        var storage = window.localStorage;
        if (storage) {
            var historyCity1 = window.localStorage.getItem("historyCity1");
            var historyCity2 = window.localStorage.getItem("historyCity2");
            var historyCity3 = window.localStorage.getItem("historyCity3");
            $(".histroy").empty();
            if (isNotEmpty(historyCity1) && historyCity1 != "null") {
                $(".history").append("<a href='javascript:void(0)' onclick='historyCityClick(this)'>"+ historyCity1 + "</a>");
            }
            if (isNotEmpty(historyCity2) && historyCity2 != "null") {
                $(".history").append("<a href='javascript:void(0)' onclick='historyCityClick(this)'>"+ historyCity2 + "</a>");
            }
            if (isNotEmpty(historyCity3)  && historyCity3 != "null") {
                $(".history").append("<a href='javascript:void(0)' onclick='historyCityClick(this)'>"+ historyCity3 + "</a>");
            }
        }
        
		$('#startTime').datetimepicker({
			timepicker:false,
			format:'Y-m-d',	
			lang:'ch',
			onChangeDateTime:function(){
                calcRoomNight(true);
			}
		});
		$('#endTime').datetimepicker({
			timepicker:false,
			format:'Y-m-d',
			lang:'ch',
			onChangeDateTime:function(){
                calcRoomNight(false);
			}
		});
		
		$("#citySearch").focus(function(){
            var destination_1 = $(this).parent("div").find(".destination_1");
            var destination_2 = $(this).parent("div").find(".destination_2");
            var ifOpen = false;
            if (destination_1.css("display") == "block") {
                destination_1.show();
                destination_2.hide();
                ifOpen = true;
            } else if (destination_2.css("display") == "block") {
                destination_2.show();
                destination_1.hide();
                ifOpen = true;
            }
            if (!ifOpen) {
                destination_1.show();
                destination_2.hide();
            }

        });
		$("#citySearch").keyup(function(){
			var thisVal = $(this).val().length;
			if(thisVal == 0){
				$(this).parent("div").find(".destination_1").show();	
				$(this).parent("div").find(".destination_2").hide();	
			}else{
				$(this).parent("div").find(".destination_1").hide();
				$(this).parent("div").find(".destination_2").show();
                refreshDestination($(this).val());
			}	
		});
		$(".posBox a.close").click(function(){
			$(this).parents(".posBox").hide();
		});
		$(".choose a").click(function(){
			var thisIndex = $(".choose a").index(this);
			$(".choose a").removeClass("current");
			$(this).addClass("current");
			$("#chooseCityArea div").removeClass("current");
			$("#city"+ thisIndex).addClass("current");
		});
		$(".allBox .allChoose a").click(function(){
			/* var thisIndex = $(".allBox .allChoose a").index(this);
			$(".allBox .allChoose a").removeClass("current");
			$(this).addClass("current");
			$(this).parents(".allBox").find(".all").hide();	
			$(this).parents(".allBox").find(".all").eq(thisIndex).show(); */
		});
	});
	
	function citySearchClick(obj){
        $("#citySearch").val($(obj).text().split('，')[0]);
        if(!isNotEmpty($("#startTime").val())) {
            $("#startTime").focus();
        }
        $(".destination_2").hide();
        $(".destination_1").hide();
        refreshKeyword($("#citySearch").val());
    }

    function historyCityClick(obj){
        $("#citySearch").val($(obj).text());
        if(!isNotEmpty($("#startTime").val())) {
            $("#startTime").focus();
        }
        $(".destination_2").hide();
        $(".destination_1").hide();
        //refreshKeyword($("#citySearch").val());
    }
    
    function refreshDestination(destination) {
        $(".destination_2 h4").empty();
        $(".destination_2 ul").empty();
        url = "/web/index/findDestinationByDestination.htm";
        //获取目的地
        $.ajax({
            type: "post",
            cache:false,
            dataType: "text",
            data:{'destination':destination},
            url: url,
            success: function(data){
                if(data) {
                    $(".destination_2 ul").empty();
                    $(".destination_2 ul").append(data);
                }

            }
        });
        $(".destination_2 h4").html("<a href='javascript:close()' class='close'>×</a>" + destination + "，若需缩小范围，请输入更多条件。");
    }

    //计算间夜
    function calcRoomNight(flg) {
        var arrDate = $("#startTime").val();
        var depDate = $("#endTime").val();
        var start = new Date(arrDate.replace(/-/g, "/"));
        var end = new Date(depDate.replace(/-/g, "/"));
        if (end <= start || !isNotEmpty(depDate) || !isNotEmpty(arrDate)) {
            if (flg) {
                depDate = plusDays(arrDate, 1);
                $("#endTime").val(depDate);
            } else {
                arrDate = plusDays(depDate, -1);
                $("#startTime").val(arrDate);
            }
        }

        var days = dateDiff($("#startTime").val(), $("#endTime").val());
        if (days > 14) {
            if (flg) {
                depDate = plusDays($("#startTime").val(), 14);
                $("#endTime").val(depDate);
            } else {
                depDate = plusDays($("#endTime").val(), -14);
                $("#startTime").val(depDate);
            }
        }
    }
    
    function close() {
        //$(".searchBg dl dd").removeClass("newZindex");
        $(".posBox").hide();
    }
</SCRIPT>
 </BODY></HTML>
