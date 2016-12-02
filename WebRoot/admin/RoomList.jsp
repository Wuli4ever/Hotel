<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="hotel.room.* " %>
<%@ page language="java" import="hotel.category.* " %>
<%
	List<Room> rooms = RoomMgr.getMgr().getRooms();
%>
<html>
  <body>
  <div id="Layer1" style="position:absolute; width:100%; height:100%; z-index:-1">  
	<img src="../photo/background.jpg" height="100%" width="100%"/>  
	</div> 
    <table align="center" border="2">
    	<tr>
    		<td>房间号</td><td>房间类别</td><td>设施描述</td>
    	</tr>
    	<%
    		for(int i=0;i<rooms.size();i++) {
    			Room r = rooms.get(i);
    	%>
    	<tr>
    		<td><%=r.getRid() %></td>
    		<td><%=CategoryMgr.getMgr().getCategoryById(r.getCid()).getName() %></td>
    		<td><%=r.getFacility() %></td>
    		<td><a href="RoomModify.jsp?rid=<%=r.getRid() %>" target="right">修改</a></td>
    	</tr>
    	<% } %>
    </table>
  </body>
</html>
