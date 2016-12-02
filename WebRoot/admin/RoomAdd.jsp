<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="hotel.category.* " %>
<%@ page language="java" import="hotel.room.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	request.setCharacterEncoding("UTF-8");
	List<Category> categories = CategoryMgr.getMgr().getCategories();
	String action = request.getParameter("action");
	if(action !=null && action.trim().equals("OK")) {
		int rid = Integer.parseInt(request.getParameter("roomid"));
		int cid = Integer.parseInt(request.getParameter("cid"));
		String facility = request.getParameter("facility");
		Room room = new Room(rid,cid,facility);
		RoomMgr.getMgr().save(room);
	}
%>
<html>
  <body>
  <div id="Layer1" style="position:absolute; width:100%; height:100%; z-index:-1">  
	<img src="../photo/background.jpg" height="100%" width="100%"/>  
	</div> 
   <form action="RoomAdd.jsp" method="post">
   	<table align="center">
   		<tr>
   			<td>房间ID</td>
   			<td><input type="text" name="roomid"></td>
   		</tr>
   		<tr>
   			<td>类别名</td>
   			<td><select name="cid">
   			<%
   				for(int i=0;i<categories.size();i++) {
   					Category c = categories.get(i);	
   				
   			%>
   				<option value="<%=c.getId() %>"><%=c.getName() %></option>
   			<% } %>
   				</select>
   			</td>
   		</tr>
   		<tr>
   			<td>房间设施</td>
   			<td><textarea name="facility" cols="20" rows="30"></textarea></td>
   		</tr>
   		<tr>
   			<td><input type="submit" value="添加房间"></td>
   			<td><input type="hidden" name="action" value="OK"></td>
   		</tr>
   	</table>
   </form>
  </body>
</html>
