<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page language="java" import = "hotel.user.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	String action = request.getParameter("action");
	if(action!=null && action.trim().equals("OK")) {
		String username = request.getParameter("username");
		String account = request.getParameter("account");
		String pwd = request.getParameter("pwd");
		String sex = request.getParameter("sex");
		long phone = Long.parseLong(request.getParameter("phone"));
		String addr = request.getParameter("addr");
		long idcard = Long.parseLong(request.getParameter("idcard"));
		if(UserMgr.getMgr().checkUser(idcard, username)) {
			User u = new User(idcard,username,pwd,account,sex,phone,addr);
			UserMgr.getMgr().save(u);
			out.println("<center>注册成功</center>");
			return ;
		} else {
			out.println("<center>注册失败</center>");
			return;
		}
	}
%>
<html>
	<head>
		<title>用户注册</title>
		
	</head>
	<body>
	<div id="Layer1" style="position:absolute; width:100%; height:100%; z-index:-1">  
	<img src="../photo/background.jpg" height="100%" width="100%"/>  
	</div> 
		<form name="form" action="userReg.jsp" method="post" onSubmit="return checkdata()" target="main">
			<table width="750" align="center" border="2">
				<tr>
					<td colspan="2" align="center">用户注册</td>
				</tr>
				<tr>
					<td>账号：</td>
					<td>
						<input type=text name="username" size="30" maxlength="10">
					</td>
				</tr>
				<tr>
					<td>用户名:：</td>
					<td>
						<input type=text name="account" size="30" maxlength="10">
					</td>
				</tr>
				<tr>
					<td>密码：</td>
					<td>
						<input type=password name="pwd" size="15" maxlength="12">
					</td>
				</tr>
				<tr>
					<td>密码确认</td>
					<td>
						<input type=password name="pwd2" size="15" maxlength="12">
					</td>
				</tr>
				
				<tr>
					<td>性别</td>
					<td>
						<input type=radio name="sex" value="男">男
						<input type=radio name="sex" value="女">女
					</td>
				</tr>
				
				<tr>
					<td>电话号码</td>
					<td>
						<input type="text" name="phone" size="30" maxlength="15">
					</td>
				</tr>
				
				<tr>
					<td>家庭住址</td>
					<td>
						<textarea rows="12" cols="80" name="addr"></textarea>
					</td>
				</tr>
				
				<tr>
					<td>证件号码</td>
					<td>
						<input type="text" name="idcard">
					</td>
				</tr>
				
				
				<tr>
					<td>
						<input type="submit" value="提交">
						<input type="reset" value="重置">
						<input type="hidden" name="action" value="OK">
					</td>
				</tr>
				
			</table>
		</form>
	</body>
</html>