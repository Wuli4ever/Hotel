<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="hotel.user.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	long id = Long.parseLong(request.getParameter("id"));
	String action = request.getParameter("action");
	if(action!=null && action.trim().equals("OK")) {
		int level = Integer.parseInt(request.getParameter("level"));
		UserMgr mgr = UserMgr.getMgr();
		User u = mgr.getUserById(id);
		mgr.addVip(u,level);
		out.println("vip注册成功");
		return;
	}
%>
<html>
  <body>
    <form action="vip.jsp" method="post">
    <table align="center">
    <tr>
    	<td><select name="level">
    		<option value="1" selected = "selected">1级</option>
    		<option value="2">2级</option>
    		<option value="3">3级</option>
    		</select>
    	</td>
    </tr>
    <tr>
    	<td><input type="submit" value="确认升级"></td>
    	<td><input type="hidden" name="action" value="OK"></td>
    	<td><input type="hidden" name="id" value="<%=request.getParameter("id") %>"></td>
    </tr>
    </table>
    </form>
  </body>
</html>
