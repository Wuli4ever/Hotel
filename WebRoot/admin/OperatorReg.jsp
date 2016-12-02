<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="hotel.operator.* " %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	request.setCharacterEncoding("UTF-8");
	String action = request.getParameter("action");
	if(action !=null && action.trim().equals("OK")) {
		int opeid = Integer.parseInt(request.getParameter("opeid"));
		if(opeid == 8001) {
			String account = request.getParameter("account");
			String password = request.getParameter("password");
			String name = request.getParameter("name");
			Operator ope = new Operator(opeid,account,password,name);
			OperatorMgr mgr = OperatorMgr.getMgr();
			mgr.save(ope);
			//System.out.println(name);
		}
	}
%>
<html>
  <body>
    <center>管理员注册</center>
    <form action="OperatorReg.jsp" method="post">
    <table	align="center">
    	<tr>
    		<td>员工号</td>
    		<td><input type="text" name="opeid"></td>
    	</tr>
    	<tr>
    		<td>账号</td>
    		<td><input type="text" name="account"></td>
    	</tr>
    	<tr>
    		<td>密码</td>
    		<td><input type="password" name="password"></td>
    	</tr>
    	<tr>
    		<td>姓名</td>
    		<td><input type="text" name="name"></td>
    	</tr>
    	<tr>
    		<td><input type="submit" value="注册"></td>
    		<td><input type="hidden" name="action" value="OK"></td>
    	</tr>
    </table>
    </form>
  </body>
</html>
