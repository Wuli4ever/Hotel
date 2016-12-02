<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="hotel.user.* " %>
<%
	List<User> users = UserMgr.getMgr().getUsers();
%>
<html>
  <body>
  <div id="Layer1" style="position:absolute; width:100%; height:100%; z-index:-1">  
	<img src="../photo/background.jpg" height="100%" width="100%"/>  
	</div> 
    <table align="center" border="2">
    	<tr>
    		<td>账号</td><td>密码</td><td>姓名</td><td>性别</td><td>电话</td><td>地址</td>
    	</tr>
    	<%
    		for(int i=0;i<users.size();i++) {
    			User u = users.get(i);
    	%>
    	<tr>
    		<td><%=u.getAccount() %></td>
    		<td><%=u.getPassword() %></td>
    		<td><%=u.getName() %></td>
    		<td><%=u.getSex() %></td>
    		<td><%=u.getPhone() %></td>
    		<td><%=u.getAddr() %></td>
    		<td><a href="UserModify.jsp?id=<%=u.getIdcard() %>" target="right">修改</a></td>
    	</tr>
    	<% } %>
    </table>
  </body>
</html>
