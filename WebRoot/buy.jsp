<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="hotel.room.* " %>
<%@ page language="java" import="hotel.food.* " %>
<%@ page language="java" import="hotel.user.* " %>
<%@ page language="java" import="hotel.cart.* " %>
<%
	request.setCharacterEncoding("UTF-8");
	int fid = Integer.parseInt(request.getParameter("fid"));
	int count = Integer.parseInt(request.getParameter("count"));
	double price = Double.parseDouble(request.getParameter("price"));
	User u = (User)session.getAttribute("User");
	if(u == null) {
		out.println("<center><a href='index.jsp'>返回首页</a></center>");
		
		return ;
	}
	Cart cart = (Cart)session.getAttribute("Cart");
	if(cart == null) {
		cart = Cart.getCart();
		session.setAttribute("Cart", cart);
	}
	CartItem ci = new CartItem();
	ci.setFid(fid);
	ci.setCount(count);
	ci.setPrice(price);
	cart.add(ci);
	List<CartItem> items = cart.getItems();
	List<Room> rooms = RoomMgr.getMgr().getRooms();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <body>
  <div id="Layer1" style="position:absolute; width:100%; height:100%; z-index:-1">  
	<img src="photo/back.jpg" height="100%" width="100%"/>  
	</div>  
  
    <form action="Confirm.jsp" method="post">
    <table align="center">
    <tr>
    	<td>名称</td>
    	<td>数量</td>
    	<td>价格</td>
    </tr>
    	<%
    		for(int i=0;i<items.size();i++) {
    			CartItem item = items.get(i);
    	%>
    		<tr>
    			<td><%=FoodMgr.getMgr().getFoodById(item.getFid()).getName() %></td>
    			<td><%=item.getCount() %></td>
    			<td><%=item.getPrice() %></td>
    		</tr>
    	<% } %>
    	<tr>
    		<td>
    			<select name="room">
    				<%
    					for(int i=0;i<rooms.size();i++) {
    						Room room = rooms.get(i);
    				%>
    					<option value="<%=room.getRid() %>"><%=room.getRid() %></option>
    				<% } %>
    			</select>
    		</td>
    	</tr>
    	<tr>
    		<td><input type="submit" value="购买"></td>
    		<td><a href="index.jsp">返回首页继续购买</a></td>
    	</tr>
    </table>
    </form>
  </body>
</html>
