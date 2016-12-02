<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="hotel.user.* " %>
<%
	List<Vip> list = UserMgr.getMgr().getAllVip();
%>
<html>
  <body>
  <div id="Layer1" style="position:absolute; width:100%; height:100%; z-index:-1">  
	<img src="../photo/background.jpg" height="100%" width="100%"/>  
	</div> 
    <table align="center" border="2">
    	<tr>
    		<td>姓名</td><td>vip级别</td><td>升级时间</td>
    	</tr>
    	<%
    		for(int i=0;i<list.size();i++) {
    			Vip v = list.get(i);
    	%>
    	<tr>
    		<td><%=v.getName() %></td>
    		<td><%=v.getLevel() %></td>
    		<td><%=v.getRdate() %></td>
    	</tr>
    	<% } %>
    </table>
  </body>
</html>
