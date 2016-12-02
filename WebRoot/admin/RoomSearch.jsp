<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="hotel.category.* " %>

<%
	List<Category> categories = CategoryMgr.getMgr().getCategories();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
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
  </script>
  </head>
  <body>
  <div id="Layer1" style="position:absolute; width:100%; height:100%; z-index:-1">  
	<img src="../photo/background.jpg" height="100%" width="100%"/>  
	</div> 
    <form action ="RoomResult.jsp" method="post" name="form1" target="main">
    	<table align="center">
    		<tr>
    			<td>房间类别</td>
    			<td>
    				<select name="category">
    				
    				<%
    					for(int i=0;i<categories.size();i++) {
    						Category c = categories.get(i);
    				%>
    					<option value="<%=c.getId() %>"><%=c.getName() %></option>
    				<% } %>
    				</select>
    			</td>
    		</tr>
    		<tr>
    			<td>入住日期:</td>
    			<td>月</td>
    			<td>
    				<select name="month" onchange="getDay()">
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
    			</td>
    			<td>日:</td>
    			<td>
    				<select name="day">
    				</select>
    			</td>
    		</tr>
    		<tr>
    			<td>退宿日期:</td>
    			<td>月</td>
    			<td>
    				<select name="month1" onchange="getDay1()">
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
    			</td>
    			<td>日:</td>
    			<td>
    				<select name="day1">
    				</select>
    			</td>
    		</tr>
    		<tr>
    			<td><input type="submit" value="查找"></td>
    		</tr>
    	</table>
    </form>
  </body>
</html>
