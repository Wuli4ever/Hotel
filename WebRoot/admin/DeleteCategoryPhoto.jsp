<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="hotel.category.* " %>
<%
	request.setCharacterEncoding("UTF-8");
	int id = Integer.parseInt(request.getParameter("id"));
	CategoryMgr.getMgr().DeletePhoto(id);
	out.println("<center>删除成功</center>");
%>
