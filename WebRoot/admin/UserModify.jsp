<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="hotel.user.* " %>
<%
	request.setCharacterEncoding("UTF-8");
	long id = Long.parseLong(request.getParameter("id"));
	String action = request.getParameter("action");
	UserMgr mgr =  UserMgr.getMgr();
	if(action !=null && action.trim().equals("OK")) {
		String password = request.getParameter("password");
		String addr = request.getParameter("addr");
		Long phone = Long.parseLong(request.getParameter("phone"));
		mgr.UpdateUser(id, addr, password, phone);
	}
	User u = mgr.getUserById(id);
%>
<html>
  <head>
  	
  </head>
  <body>
  <div id="Layer1" style="position:absolute; width:100%; height:100%; z-index:-1">  
	<img src="../photo/background.jpg" height="100%" width="100%"/>  
	</div> 
  	<form action = "UserModify.jsp" method="post">
    <table align="center" border="1" >
    	<tr>
    		<td>账号</td><td>密码</td><td style="width:20%">姓名</td><td>性别</td><td>电话</td><td>地址</td>
    	</tr>
    	
    	<tr>
    		<td><%=u.getAccount() %></td>
    		<td><input type="text" name="password" value="<%=u.getPassword() %>"></td>
    		<td><%=u.getName() %></td>
    		<td><%=u.getSex() %></td>
    		<td><input type="text" name="phone" value="<%=u.getPhone() %>"></td>
    		<td><input type="text" name="addr" value="<%=u.getAddr() %>"></td>
    	</tr>
    	<tr>
    		<td><input type="submit" value="修改"></td>
    		<td><a href="vip.jsp?id=<%=u.getIdcard() %>" target="main">升级vip</a></td>
    	</tr>
    	
    </table>
    	<input type="hidden" name ="action" value="OK">
    	<input type="hidden" name ="id" value="<%=u.getIdcard() %>">
    </form>
  </body>
</html>
