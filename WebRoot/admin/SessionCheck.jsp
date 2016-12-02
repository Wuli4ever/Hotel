<%@ page language="java" import="hotel.operator.*" %>
<%
	Operator ope = (Operator)session.getAttribute("operator");
	if(ope==null) {
		response.sendRedirect("login.jsp");
		return;
	}
%>