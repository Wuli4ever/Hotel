<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="hotel.category.* " %>
<%
	request.setCharacterEncoding("UTF-8");
	int id = Integer.parseInt(request.getParameter("id"));
	Category c = CategoryMgr.getMgr().getCategoryById(id);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <body bgcolor="yellow">
    <center>
    	<img src="photo/<%=id %>.jpg"></img>
    </center>
    <center>名称:<%=c.getName() %></center>
    <center>价格:<%=c.getPrice() %></center>
    <center>押金:<%=c.getDeposit() %></center>
    <center>面积:<%=c.getArea() %></center>
    <center>床铺:<%=c.getBed() %></center>
    <center>网络:<%=c.getNetwork() %></center>
    <center><a href="index.jsp">返回主页预定</a></center>
  </body>
</html>
