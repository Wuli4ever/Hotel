<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="hotel.food.* " %>
<%
	request.setCharacterEncoding("UTF-8");
	int id = Integer.parseInt(request.getParameter("id"));
	Food f = FoodMgr.getMgr().getFoodById(id);
	//json
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <body bgcolor="yellow">
 
    <center>
    	<img src="photo/<%=id %>food.jpg"></img>
    </center>
    <center>名称:<%=f.getName() %></center>
    <center>原价:<%=f.getNormal() %></center>
    <center>现价:<%=f.getNow() %></center>
    <form action="buy.jsp" method="post">
    <table align="center">
    	<tr>
    		<td>数量:
    			<select name="count">
    				<option value="1">1</option>
    				<option value="2">2</option>
    				<option value="3">3</option>
    				<option value="4">4</option>
    				<option value="5">5</option>
    			</select>
    		</td>
    	</tr>
    	<tr>
    		<td><input type="submit" value="确定"></td>
    	</tr>
    </table>
    <input type="hidden" name="price" value="<%=f.getNow() %>">
    <input type="hidden" name="fid" value="<%=f.getId() %>">
    </form>
  </body>
</html>
