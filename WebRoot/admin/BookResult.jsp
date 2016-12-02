<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="hotel.room.*" %>
<%@ page language="java" import="hotel.book.*" %>
<%@ page language="java" import="java.text.SimpleDateFormat" %>
<%
	request.setCharacterEncoding("UTF-8");
	BookMgr mgr = BookMgr.getMgr();
	int id = Integer.parseInt(request.getParameter("id"));
	Book b = mgr.getBookById(id);
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	//System.out.println(b.getCheckin());
	String checkin = df.format(b.getCheckin());
	checkin = checkin.substring(0, 10);
	String checkout = df.format(b.getCheckout());
	checkout = checkout.substring(0, 10);
	int cid = b.getCid();
	List<Room> rooms = RoomMgr.getMgr().getProperRooms(cid, checkin, checkout);
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
    		<td><a href="Checkin1.jsp?rid=<%=room.getRid() %>&cid=<%=cid %>&checkin=<%=checkin %>&checkout=<%=checkout %>&id=<%=b.getIdcard() %>" target="main">登记</a></td>
    	</tr>
    <% } %>
    </table>
  </body>
</html>
