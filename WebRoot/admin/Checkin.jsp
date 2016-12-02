<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="hotel.room.*" %>
<%@ page language="java" import="hotel.category.*" %>
<%@ page language="java" import="hotel.operator.*" %>
<%@ page language="java" import="java.sql.* " %>
<%	
	request.setCharacterEncoding("UTF-8");
	String action = request.getParameter("action");
	if(action !=null && action.trim().equals("OK")) {
		int rid = Integer.parseInt(request.getParameter("rid"));
		long idcard = Long.parseLong(request.getParameter("idcard"));
		String name = request.getParameter("name");
		double deposit = Double.parseDouble(request.getParameter("deposit"));
		String checkin = request.getParameter("checkin");
		String checkout = request.getParameter("checkout");
		int opeid = Integer.parseInt(request.getParameter("opeid"));
		Timestamp t1 = Timestamp.valueOf(checkin+" "+"12:00:00");
		Timestamp t2 = Timestamp.valueOf(checkout+" "+"12:00:00");
		RoomState rs =new RoomState();
		rs.setDeposit(deposit);
		rs.setIdcard(idcard);
		rs.setName(name);
		rs.setOpeid(opeid);
		rs.setRid(rid);
		rs.setUsedmoney(0.0);
		rs.setCheckin(t1);
		rs.setCheckout(t2);
		RoomMgr.getMgr().saveRoomState(rs);
		out.println("办理入住成功");
		return ;
	}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

  <body>
  <div id="Layer1" style="position:absolute; width:100%; height:100%; z-index:-1">  
	<img src="../photo/background.jpg" height="100%" width="100%"/>  
	</div> 
   	<form action="Checkin.jsp" method="post">
   	<table align="center" border="1">
   		<tr>
   			<td>房间ID:</td>
   			<td><%=request.getParameter("rid") %></td>
   		</tr>
   		<tr>
   			<td>身份证号:</td>
   			<td><input type="text" name="idcard"></td>
   		</tr>
   		<tr>
   			<td>姓名:</td>
   			<td><input type="text" name="name"></td>
   		</tr>
   		<tr>
   			<td>押金:</td>
   			<td><%=CategoryMgr.getMgr().getCategoryById(Integer.parseInt(request.getParameter("cid"))).getDeposit() %></td>
   		</tr>
   		<tr>
   			<td>入住日期</td>
   			<td><%=request.getParameter("checkin") %></td>
   		</tr>
   		<tr>
   			<td>退宿日期</td>
   			<td><%=request.getParameter("checkout") %></td>
   		</tr>
   		<tr>
   			<td><input type="submit" value="入住"></td>
   			<td><input type="hidden" name="action" value="OK"></td>
   		</tr>
   		<tr>
   			<td><input type="hidden" name="rid" value="<%=request.getParameter("rid") %>"></td>
   			<td><input type="hidden" name="deposit" value="<%=CategoryMgr.getMgr().getCategoryById(Integer.parseInt(request.getParameter("cid"))).getDeposit() %>"></td>
   		</tr>
   		<tr>
   			<td><input type="hidden" name="checkin" value="<%=request.getParameter("checkin") %>"></td>
   			<td><input type="hidden" name="checkout" value="<%=request.getParameter("checkout") %>"></td>
   		</tr>
   		<tr>
   			<%
   				Operator ope = (Operator)session.getAttribute("operator");
   			%>
   			<td><input type="hidden" name="opeid" value="<%=ope.getOpeid() %>"></td>
   		</tr>
   	</table>
   	</form>
  </body>
</html>
