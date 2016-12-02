<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="hotel.room.* " %>
<%
	request.setCharacterEncoding("UTF-8");
	int cid = Integer.parseInt(request.getParameter("category"));
	String month = request.getParameter("month");
	String day = request.getParameter("day");
	String month1 =request.getParameter("month1");
	String day1=request.getParameter("day1");
	String checkin="2016-"+month+"-"+day;
	String checkout = "2016-"+month1+"-"+day1;
	//System.out.println(checkin+" "+checkout);
	List<Room> rooms = RoomMgr.getMgr().getProperRooms(cid,checkin,checkout);
	
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <body>
  <div id="Layer1" style="position:absolute; width:100%; height:100%; z-index:-1">  
	<img src="../photo/background.jpg" height="100%" width="100%"/>  
	</div> 
    <table align = "center">
    <%
    	for(int i=0;i<rooms.size();i++) {
    		Room room = rooms.get(i);
    %>
    	<tr>
    		<td>房间号</td>
    		<td><%=room.getRid() %></td>
    		<td><a href="Checkin.jsp?rid=<%=room.getRid() %>&cid=<%=cid %>&checkin=<%=checkin %>&checkout=<%=checkout %>" target="main">登记</a></td>
    	</tr>
    <% } %>
    </table>
  </body>
</html>
