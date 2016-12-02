<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="hotel.book.* " %>
<%@ page language="java" import="hotel.category.* " %>
<%
	request.setCharacterEncoding("UTF-8");
	long idcard = Long.parseLong(request.getParameter("idcard"));
	BookMgr.getMgr().deleteById(idcard);
	out.println("<center>删除成功 </center>");
%>
