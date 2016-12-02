<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="hotel.room.* " %>
<%@ page language="java" import="java.sql.* " %>
<%@ page language="java" import="hotel.category.* " %>
<%
	request.setCharacterEncoding("UTF-8");
	int rid = Integer.parseInt(request.getParameter("rid"));
	String action = request.getParameter("action");
	RoomMgr mgr = RoomMgr.getMgr();
	Room r = mgr.getRoomById(rid);
	int cid = r.getCid();
	List<Category> categories = CategoryMgr.getMgr().getCategories();
	if(action !=null && action.trim().equals("OK")) {
		int newid = Integer.parseInt(request.getParameter("newrid"));
		int categoryid = Integer.parseInt(request.getParameter("category"));
		String facility = request.getParameter("facility");
		mgr.UpdateRoom(rid,newid, categoryid, facility);
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
  	<form action = "RoomModify.jsp" method="post">
    <table align="center" border="1" >
    	<tr>
    		<td>房间号</td>
    		<td><input type="text" name="newrid" value="<%=r.getRid() %>"></td>
    	</tr>
    	
    	<tr>
    		<td>房间种类</td>
    		<td>
    			<select name="category">
    				<%
    					for(int i=0;i<categories.size();i++) {
    						Category c = categories.get(i);	
    				%>
    				<option value="<%=c.getId() %>" <% if(cid==c.getId()) { %> selected="selected" <% } %>>
    					<%=c.getName() %>
    				</option>
    				<% } %>
    			</select>
    		</td>
    	</tr>
    	<tr>
    		<td>房间描述</td>
    		<td><textarea name="facility" rows="20" cols="15"><%=r.getFacility() %></textarea></td>
    	</tr>
    	
    	
    	<tr>
    		<td><input type="submit" value="修改"></td>
    		
    	</tr>
    	
    </table>
    	<input type="hidden" name ="action" value="OK">
    	<input type="hidden" name ="rid" value="<%=rid %>">
    </form>
  </body>
</html>
