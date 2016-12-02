<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="hotel.room.* " %>
<%@ page language="java" import="java.sql.* " %>
<%
	request.setCharacterEncoding("UTF-8");
	long idcard = Long.parseLong(request.getParameter("idcard"));
	String action = request.getParameter("action");
	RoomMgr mgr = RoomMgr.getMgr();
	RoomState rstate = mgr.getRoomStateById(idcard);
	if(action !=null && action.trim().equals("OK")) {
		Double usedmoney = Double.parseDouble(request.getParameter("usedmoney"));
		int days = Integer.parseInt(request.getParameter("days"));
		mgr.UpdateRoomState(idcard,days,usedmoney);
		out.println("修改成功");
		return ;
	}
	
%>
<html>
  <head>
  	
  </head>
  <body>
  <div id="Layer1" style="position:absolute; width:100%; height:100%; z-index:-1">  
	<img src="../photo/background.jpg" height="100%" width="100%"/>  
	</div> 
  	<form action = "RoomStateModify.jsp" method="post">
    <table align="center" border="1" >
    	<tr>
    		<td>房间号</td>
    		<td><%=rstate.getRid() %></td>
    	</tr>
    	
    	<tr>
    		<td>用户</td>
    		<td><%=rstate.getName() %></td>
    	</tr>
    	<tr>
    		<td>剩余押金</td>
    		<td><%=rstate.getDeposit() %></td>
    	</tr>
    	<tr>
    		<td>扣除押金</td>
    		<td><input type="text" name="usedmoney"></td>
    	</tr>
    	<tr>
    		<td>退宿日期</td>
    		<td><%=rstate.getCheckout() %></td>
    	</tr>
    	<tr>
    		<td>续住天数</td>
    		<td>
    			<select name="days">
    				<option value="0">0</option>
    				<option value="1">1</option>
    				<option value="2">2</option>
    				<option value="3">3</option>
    				<option value="4">4</option>
    				<option value="5">5</option>
    				<option value="6">6</option>
    				<option value="7">7</option>
    			</select>
    		</td>
    	</tr>
    	<tr>
    		<td><input type="submit" value="修改"></td>
    		
    	</tr>
    	
    </table>
    	<input type="hidden" name ="action" value="OK">
    	<input type="hidden" name ="idcard" value="<%=idcard %>">
    </form>
  </body>
</html>
