/**
 * 判断开始日期和结束日期大小
 * 
 * @param String
 *            startDate 开始日期
 * @param String
 *            endDate 结束日期
 * @param String
 *            message 错误信息
 * @returns true:成功/false:失败
 */
function checkDate(startDate, endDate, message) {
	var startTime = $('#' + startDate).val();
	var endTime = $('#' + endDate).val();
	var start = new Date(startTime.replace(/-/g, "/"));
	var end = new Date(endTime.replace(/-/g, "/"));
	if (end < start) {
		alert(message);
		return false;
	} else {
		return true;
	}
}

/**
 * 是否删除确认框弹出
 * 
 * @param String
 *            id 修改的ID
 * @param String
 *            url 提交的ACTION的URL
 * @param String
 *            buttonId 搜索按钮的Id
 * @returns true:成功/false:失败
 */
function deleteById(id, url, buttonId) {
	if (confirm("确定删除吗?")) {
		url = url + "?id=" + id;
		$.ajax({
			type : "post",
			cache : false,
			dataType : "text",
			url : url,
			success : function(data) {
				if (data == '删除成功！') {
					alert("删除成功!");
					$("#" + buttonId).click();
					return true;
				} else {
					alert(data);
					return false;
				}
			}
		});
	}
}

/**
 * 强制保留2位小数，如：2，会在2后面补上00.即2.00    
 * 
 * @param String
 *            num 要修改的数值
 * @returns 强制保留2位小数后的数值
 */
function toDecimal2(num) {
	var f = parseFloat(num);
	if (isNaN(f)) {
		return false;
	}
	var f = Math.round(num * 100) / 100;
	var s = f.toString();
	var rs = s.indexOf('.');
	if (rs < 0) {
		rs = s.length;
		s += '.';
	}
	while (s.length <= rs + 2) {
		s += '0';
	}
	return s;
}

function myDialog(info,okmethod) {
	parent.myDialog(info,okmethod);
}

/**
 * 计算日期天数差(无视开始日期大于结束日期)
 * 
 * @param String
 *            sDate1 日期1 格式：2014-01-01 
 *  * @param String
 *            sDate2 日期2 格式：2014-12-11
 * @returns 日期天数差
 */
function dateDiff(sDate1,  sDate2){     
	s1 = new Date(sDate1.replace(/-/g, "/"));
	s2 = new Date(sDate2.replace(/-/g, "/"));

	var days = s2.getTime() - s1.getTime();
	var time = parseInt(days / (1000 * 60 * 60 * 24));
    return time;
}

/**
 * 日期加上天数得到新的日期
 * 
 * @param String
 *            dateTemp 需要参加计算的日期 格式：YYYY-MM-DD
 * @param String
 *            days 要添加的天数
 * @returns 返回新的日期，日期格式：YYYY-MM-DD
 */
function plusDays(dateTemp, days) {
    dateTemp = dateTemp.split("-");
    var nDate = new Date(dateTemp[0],dateTemp[1] -1,dateTemp[2]); //转换为YYYY-MM-DD-格式
    var millSeconds = Math.abs(nDate) + (days * 24 * 60 * 60 * 1000);
    var rDate = new Date(millSeconds);
    var year = rDate.getFullYear();
    var month = rDate.getMonth() + 1;
    if (month < 10) month = "0" + month;
    var date = rDate.getDate();
    if (date < 10) date = "0" + date;
    return year + "-" + month + "-" + date;
}

/**
 * 将(Thu Aug 21 00:00:00 CST 2014)日期格式转化成yyyy-MM-dd
 * 
 * @param Date
 *            date 要转化的日期
 * @returns 格式化后的日期(yyyy-MM-dd)
 */
function toYYYYMMDDFromDate(date){     
	var d = new Date(date);
	return d.getFullYear() + '-' + (d.getMonth() + 1) + '-' + d.getDate();
}

/**
 * 将(yyyy-MM-dd)日期格式转化成MM月dd日
 * 
 * @param Date
 *            date 要转化的日期
 * @returns 格式化后的日期(MM月dd日)
 */
function toMMDDFromDate(date){     
	var d = new Date(date);
	return (d.getMonth() + 1) + '月' + d.getDate() + "日";
}

/**
 * 去除空格
 * 
 * @param String
 *            str 要去除空格的字符串
 * @returns 去除空格后的字符串
 */
function trim(str){   
    str = str.replace(/^(\s|\u00A0)+/,'');   
    for(var i=str.length-1; i>=0; i--){   
        if(/\S/.test(str.charAt(i))){   
            str = str.substring(0, i+1);   
            break;   
        }   
    }   
    return str;   
}

/**
 * 判断大小写键盘是否已经开启
 *
 * @param String
 *            alertArea 要弹出区域的id
 */
function  detectCapsLock(event, alertArea){
	var theEvent = window.event || event;
	var keyCode = theEvent.keyCode || theEvent.which;
	var isShift = event.shiftKey || (keyCode == 16 ) || false; // shift键是否按住
	if (((keyCode >= 65 && keyCode <= 90 ) && !isShift) // Caps Lock 打开，且没有按住shift键
		|| ((keyCode >= 97 && keyCode <= 122 ) && isShift)) {// Caps Lock 打开，且按住shift键)
		$("#"+alertArea).css("display","block");
		return true;
	} else {
		$("#"+alertArea).css("display","none");
		return false;
	}
}

/**
 * 异步提交表单
 *
 * @param String
 *            url 异步提交的URL
 * @param String
 *            formId 提交的表单ID
 * @param String
 *            forwardUrl 重新跳转的URL
 * @returns
 */
function ajaxFormSubmit(url, formId, forwardUrl) {
	$.ajax({
		type: "post",
		cache:false,
		dataType: "text",
		data:$("#"+formId).serialize(),
		url: url,
		success: function(data){
			var data = $.parseJSON(data);
			if (data.statusCode == '200') {
				if(isNotEmpty(data.message)) {
					alert(data.message);
				}
				window.location.href= forwardUrl;
				return true;
			} else if (data.statusCode == '300') {
				alert(data.message);
				return true;
			} else {
				alert("请求出错！");
				return false;
			}
		}
	});
}

/**
 * 异步提交表单
 *
 * @param String
 *            url 异步提交的URL
 * @param String
 *            id 提交的ID
 * @param String
 *            forwardUrl 重新跳转的URL
 * @returns
 */
function ajaxFormSubmitById(url, id, forwardUrl) {
	$.ajax({
		type: "post",
		cache:false,
		dataType: "text",
		data:{'id':id},
		url: url,
		success: function(data){
			var data = $.parseJSON(data);
			if (data.statusCode == '200') {
				if(isNotEmpty(data.message)) {
					alert(data.message);
				}
				window.location.href= forwardUrl;
				return true;
			} else if (data.statusCode == '300') {
				alert(data.message);
				return false;
			} else {
				alert("请求出错！");
				return false;
			}
		}
	});
}

/**
 * 异步提交表单
 *
 * @param String
 *            url 异步提交的URL
 * @param String
 *            ids 提交的ids
 * @param String
 *            forwardUrl 重新跳转的URL
 * @returns
 */
function ajaxFormSubmitByIds(url, ids, forwardUrl) {
	$.ajax({
		type: "post",
		cache:false,
		dataType: "text",
		data:{'strIds':ids},
		url: url,
		success: function(data){
			var data = $.parseJSON(data);
			if (data.statusCode == '200') {
				if(isNotEmpty(data.message)) {
					alert(data.message);
				}
				window.location.href= forwardUrl;
				return true;
			} else if (data.statusCode == '300') {
				alert(data.message);
				return false;
			} else {
				alert("请求出错！");
				return false;
			}
		}
	});
}

/**
 * 判断字符串是不是空字符串
 *
 * @param String
 *            str 要判断的字符串
 * @returns false:是空字符串/true:不是空字符串
 */
function isNotEmpty(str) {
	if(str == '' || str == undefined || str == null) {
		return false;
	}
	return true;
}

/**
 * 判断字符串是不是数字
 *
 * @param String
 *            str 要判断的字符串
 * @returns false:不是数字/true:是数字
 */
function isNotNum(str) {
	var reg = new RegExp("^[0-9]*$");
	if(!reg.test(str)){
		return false;
	}
	return true;
}

/**
 * 让字符串转成金额,并且保留2位小数点
 *
 * @param String
 *            price 要判断的字符串的id
 * @returns
 */
function strToAmount(price,msg) {
	var amount = $("#"+price).val();
	if(amount != '' || amount != null) {
		amount = parseFloat(amount);
		if (isNaN(amount)) {
			$("#"+price).val("");
			$("#"+price).focus();
			alert(msg);
			return false;
		}
	}
	$("#"+price).val(toDecimal2(amount));
	return true;
}

/**
 * 判断是不是手机号码
 *
 * @param String
 *            price 要判断的手机号码
 * @returns false:不是手机号码/true:是手机号码
 */
function isPhone(phone) {
	if(!phone.match(/^1[0-9]{10}$/)){
		return false;
	} else {
		return true;
	}
}

/**
 * 打印
 *
 * @param String
 *            printDiv 要打印的div
 */
function printit(printDiv) {
	if (confirm('确定打印吗？')) {
		var newstr = document.getElementById(printDiv).innerHTML;
		var oldstr = document.body.innerHTML;
		document.body.innerHTML = newstr;
		window.print();
		document.body.innerHTML = oldstr;
		return false;
	}
}

function toPage(pageNo) {
	$("#pageNo").val(pageNo);
	$("#paginationForm").submit();
}

//function showLoadDiv(){ $('#loading').css('display','block');}
//function closeLoadDiv(){ $('#loading').css('display','none');}
//$.ajaxSetup({
//	beforeSend: function (XMLHttpRequest) { showLoadDiv();},
//　　　　success: function (data,status) { closeLoadDiv(); },
//　　　　error: function (xhr, status, e) { closeLoadDiv(); },
//　　　　complete: function (xhr, status) { closeLoadDiv(); }
//});

function showLoadDiv(){ parent.$('#loading').css('display','block');}
function closeLoadDiv(){ parent.$('#loading').css('display','none');}
$.ajaxSetup({
	beforeSend: function (XMLHttpRequest) { showLoadDiv();},
	success: function (data,status) { closeLoadDiv(); },
	error: function (xhr, status, e) { closeLoadDiv(); },
	complete: function (xhr, status) { closeLoadDiv(); }
});

/**
 * 判断是不是邮箱地址
 *
 * @param String
 *            price 要判断的邮箱地址
 * @returns false:不是邮箱地址/true:是邮箱地址
 */
function isEmail(str){
	//var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
	//var reg = /^[A-Za-zd]+([-_.][A-Za-zd]+)*@([A-Za-zd]+[-.])+[A-Za-zd]{2,5}$/;
	//var reg=/^[A-Za-zd]+([-_.][A-Za-zd]+)*@([A-Za-zd]+[-.])+[A-Za-zd]{2,5}$/;
	var reg = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/
	return reg.test(str);

}

/**
 * 异步提交表单
 *
 * @param String
 *            url 异步提交的URL
 * @param String
 *            formId 提交的表单ID
 * @param String
 *            forwardUrl 重新跳转的URL
 * @returns
 */
function ajaxFormSubmitWithMessage(url, formId, forwardUrl) {
	$.ajax({
		type: "post",
		cache:false,
		dataType: "text",
		data:$("#"+formId).serialize(),
		url: url,
		success: function(data){
			var data = $.parseJSON(data);
			if (data.statusCode == '200') {
				if (isNotEmpty(data.message)) {
					alert(data.message);
				}
				if (isNotEmpty(forwardUrl)) {
					window.location.href= forwardUrl;
				}
			} else if (data.statusCode == '300') {
				if (isNotEmpty(data.message)) {
					alert(data.message);
				}
				return true;
			} else {
				alert("请求出错！");
				return false;
			}
		}
	});
}

function is_weixn(){
	try{
		var ua = navigator.userAgent.toLowerCase();
		if(ua.match(/MicroMessenger/i)=="micromessenger") {
			return true;
		} else {
			return false;
		}
	}catch(e){
		return false;
	}
}

//格式化金额
function changeTwoDecimal_f(x)
{
   var f_x = parseFloat(x);
  if (isNaN(f_x))
   {
      return x;
   }
   var f_x = Math.round(x*100)/100;
   var s_x = f_x.toString();
   var pos_decimal = s_x.indexOf('.');
   if (pos_decimal < 0)
   {
      pos_decimal = s_x.length;
      s_x += '.';
   }
   while (s_x.length <= pos_decimal + 2)
   {
      s_x += '0';
   }
   return s_x;
}

/**
 * 判断是否为空
 *
 * @param String
 *            id 判断是否为空的字段的id
 * @param String
 *            msg 当前字段为空的错误信息
 * @returns
 */
function ifEmptyCheckById(id, msg) {
	var arrId = id.split(',');
	var arrMsg = msg.split(',');
	if (arrId.length != arrMsg.length) {
		alert("参数不正确!");
		return false;
	}
	for(var i =0;i < arrId.length;i++) {
		var currentCheckObj = $("#"+arrId[i]);
		if (!isNotEmpty(currentCheckObj.val())) {
			alert(arrMsg[i]);
			currentCheckObj.focus();
			return false;
		}
	}

	return true;
}


