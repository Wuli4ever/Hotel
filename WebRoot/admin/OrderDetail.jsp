<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="hotel.order.* " %>
<%@ page language="java" import="hotel.food.* " %>
<%
	request.setCharacterEncoding("UTF-8");
	int id = Integer.parseInt(request.getParameter("id"));
	List<OrderItem> items = OrderItem.getItemsById(id);
	String action = request.getParameter("action");
	if(action!=null&&action.trim().equals("OK")) {
		Order or = Order.getOrderById(id);
		or.UpdateStatus(1);
		out.println("<center>处理成功</center>");
		return ;
	}
%>
<html>
  <head>
  	
  </head>
  <body>
  <div id="Layer1" style="position:absolute; width:100%; height:100%; z-index:-1">  
	<img src="../photo/background.jpg" height="100%" width="100%"/>  
	</div> 
  	<form action = "OrderDetail.jsp" method="post">
    <table align="center" border="1" >
    	<tr>
    		<td>食品</td><td>价格</td><td>数量</td>
    	</tr>
    	<%
    		for(int i=0;i<items.size();i++) {
    			OrderItem item = items.get(i);
    	%>
    	<tr>
    		<td><%=FoodMgr.getMgr().getFoodById(item.getFid()).getName() %></td>
    		<td><%=item.getPrice() %></td>
    		<td><%=item.getCount() %></td>
    	</tr>
    	<% } %>
    	<tr>
    		<td><input type="submit" value="处理订单"></td>
    	</tr>
    	
    </table>
    	<input type="hidden" name="action" value="OK">
    	<input type="hidden" name="id" value="<%=id %>">
    </form>
  </body>
</html>
