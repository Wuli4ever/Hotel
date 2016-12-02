<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="hotel.room.*" %>
<%@ page language="java" import="hotel.order.*" %>
<%@ page language="java" import="java.text.SimpleDateFormat" %>
<%
	request.setCharacterEncoding("UTF-8");
	List<Order> orders = Order.getOrders();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <body>
  <div id="Layer1" style="position:absolute; width:100%; height:100%; z-index:-1">  
	<img src="../photo/background.jpg" height="100%" width="100%"/>  
	</div> 
    <table align = "center">
   		<tr>
   			<td>房间号</td><td>姓名</td><td>订单明细</td>
   		</tr>
   		<%
   			for(int i=0;i<orders.size();i++) {
   				Order or = orders.get(i);
   		%>
   			<tr>
   				<td><%=or.getRid() %></td>
   				<td><%=or.getName() %></td>
   				<td><a href="OrderDetail.jsp?id=<%=or.getId() %>" target="right">查看</a></td>
   			</tr>
   		<% } %>
    </table>
  </body>
</html>
