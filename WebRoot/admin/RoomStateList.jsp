<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="hotel.room.* " %>
<%
	List<RoomState> list = RoomMgr.getMgr().getAllRoomState();
%>
<html>
  <body>
  <div id="Layer1" style="position:absolute; width:100%; height:100%; z-index:-1">  
	<img src="../photo/background.jpg" height="100%" width="100%"/>  
	</div> 
    <table align="center" border="2">
    	<tr>
    		<td>房间号</td><td>身份证号</td><td>姓名</td><td>操作员工号</td><td>押金</td><td>使用金额</td><td>入住日期</td><td>退宿日期</td>
    	</tr>
    	<%
    		for(int i=0;i<list.size();i++) {
    			RoomState rstate = list.get(i);
    	%>
    	<tr>
    		<td><%=rstate.getRid() %></td>
    		<td><%=rstate.getIdcard() %></td>
    		<td><%=rstate.getName() %></td>
    		<td><%=rstate.getOpeid() %></td>
    		<td><%=rstate.getDeposit() %></td>
    		<td><%=rstate.getUsedmoney() %></td>
    		<td><%=rstate.getCheckin() %></td>
    		<td><%=rstate.getCheckout() %></td>
    		<td><a href="Checkout.jsp?idcard=<%=rstate.getIdcard() %>" target="detail">退宿</a></td>
    		<td><a href="RoomStateModify.jsp?idcard=<%=rstate.getIdcard() %>" target="detail">修改</a></td>
    	</tr>
    	<% } %>
    </table>
  </body>
</html>
