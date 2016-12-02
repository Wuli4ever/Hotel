<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<%
	String action = request.getParameter("action");
	if(action!=null && action.trim().equals("OK")) {
		out.println("success");
	}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  
  
  <body>
  	<form action="/path.jsp" method="post">
  		<input type="hidden" name="action" value="OK">
  		<input type="submit">
 	</form>   
  </body>
 </html>
