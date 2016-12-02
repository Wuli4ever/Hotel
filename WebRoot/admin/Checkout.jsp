<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="hotel.room.* " %>
<%@ page language="java" import="java.sql.* " %>
<%@ page language="java" import="hotel.item.* " %>
<%@ page language="java" import="hotel.user.* " %>
<%
	request.setCharacterEncoding("UTF-8");
	long idcard = Long.parseLong(request.getParameter("idcard"));
	String action = request.getParameter("action");
	RoomMgr mgr = RoomMgr.getMgr();
	RoomState rstate = mgr.getRoomStateById(idcard);
	if(action !=null && action.trim().equals("OK")) {
		int rid = Integer.parseInt(request.getParameter("rid"));
		int opeid = Integer.parseInt(request.getParameter("opeid"));
		Timestamp checkin = Timestamp.valueOf(request.getParameter("checkin"));
		Timestamp checkout = Timestamp.valueOf(request.getParameter("checkout"));
		long days = (checkout.getTime()+200-checkin.getTime())/1000/60/60/24;
		//System.out.println(days);
		Double deposit = mgr.getDepositeByRoomId(rid);
		Vip v = null;
		v = UserMgr.getMgr().getVipById(idcard);
		if(v !=null) {
			if(v.getLevel()==1) {
				deposit *=days*0.9;
			} else if(v.getLevel()==2) {
				deposit *=days*0.8;
			} else if(v.getLevel()==3) {
				deposit *=days*0.5;
			}
		} else {
			deposit *=days;
		}
		deposit+=rstate.getUsedmoney();
		Item item = new Item();
		item.setMoney(deposit);
		item.setCheckin(checkin);
		item.setCheckout(checkout);
		item.setOpeid(opeid);
		item.setRid(rid);
		ItemMgr.getMgr().save(item);
		mgr.deleteRoomStateByIdcard(idcard);
		out.println("退宿成功");
		return;
	}
	
%>
<html>
  <head>
  	
  </head>
  <body>
  <div id="Layer1" style="position:absolute; width:100%; height:100%; z-index:-1">  
	<img src="../photo/background.jpg" height="100%" width="100%"/>  
	</div> 
  	<form action = "Checkout.jsp" method="post">
    <table align="center" border="1" >
    	<tr>
    		<td>房间ID</td><td>身份证号</td><td>姓名</td><td>操作员工号</td><td>押金</td><td>扣除金额</td><td>入住日期</td><td>退宿日期</td>
    	</tr>
    	
    	<tr>
    		<td><%=rstate.getRid() %></td>
    		<td><%=rstate.getIdcard() %></td>
    		<td><%=rstate.getName() %></td>
    		<td><%=rstate.getOpeid() %></td>
    		<td><%=rstate.getDeposit() %></td>
    		<td><%=rstate.getUsedmoney() %></td>
    		<td><%=rstate.getCheckin() %></td>
    		<td><%=rstate.getCheckout() %></td>
    	</tr>
    	<tr>
    		<td><input type="submit" value="退房"></td>
    		
    	</tr>
    	
    </table>
    	<input type="hidden" name ="action" value="OK">
    	<input type="hidden" name ="idcard" value="<%=rstate.getIdcard() %>">
    	<input type="hidden" name ="opeid" value="<%=rstate.getOpeid() %>">
    	<input type="hidden" name ="rid" value="<%=rstate.getRid() %>">
    	<input type="hidden" name ="checkin" value="<%=rstate.getCheckin() %>">
    	<input type="hidden" name ="checkout" value="<%=rstate.getCheckout() %>">
    </form>
  </body>
</html>
