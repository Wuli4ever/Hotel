<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="hotel.book.* " %>
<%@ page language="java" import="hotel.user.* " %>
<%@ page language="java" import="hotel.category.* " %>
<%
	request.setCharacterEncoding("UTF-8");
	User u = (User)session.getAttribute("User");
	
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <body>
  <div id="Layer1" style="position:absolute; width:100%; height:100%; z-index:-1">  
	<img src="photo/back.jpg" height="100%" width="100%"/>  
	</div>  
	<%
	if(u==null) {
		out.println("<center>请先登录</center>");
		out.println("<center><a href='login.jsp'>登录</a></center>");
		return;
	}
	Book b = BookMgr.getMgr().getBookByIdcard(u.getIdcard());
	if(b==null) {
		out.println("<center>暂时没有预定消息</center>");
		out.println("<center><a href='index.jsp'>返回首页</a></center>");
		return;
	}
	%>
   <table align="center" border="2">
    	<tr>
    		<td>预定ID</td><td>身份证号</td><td>房间类别</td><td>入住日期</td><td>退宿日期</td><td>取消预订</td>
    	</tr>
    	
    	<tr>
    		<td><%=b.getId() %></td>
    		<td><%=b.getIdcard() %></td>
    		<td><%=CategoryMgr.getMgr().getCategoryById(b.getCid()).getName() %></td>
    		<td><%=b.getCheckin() %></td>
    		<td><%=b.getCheckout() %></td>
    		<td><a href="admin/BookDelete.jsp?idcard=<%=b.getIdcard() %>" target="main">删除预定</a></td>
    		
    	</tr>
    
    </table>
  </body>
</html>
