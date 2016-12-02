<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="hotel.user.* " %>
<%@ page language="java" import="hotel.cart.* " %>
<%@ page language="java" import="hotel.order.* " %>
<%
	request.setCharacterEncoding("UTF-8");
	User u = (User)session.getAttribute("User");
	Cart cart = (Cart)session.getAttribute("Cart");
	int rid = Integer.parseInt(request.getParameter("room"));
	Order or = new Order();
	or.setCart(cart);
	or.setRid(rid);
	or.setName(u.getName());
	or.setStatus(0);
	or.save();
	
%>
<html>
	<body bgcolor="yellow">
	<%
	out.println("<center>下单成功</center>");
	%>	
	</body>
</html>