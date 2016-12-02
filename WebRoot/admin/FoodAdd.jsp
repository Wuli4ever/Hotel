<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="hotel.food.*" %>
<%	
	request.setCharacterEncoding("UTF-8");
	String action = request.getParameter("action");
	if(action !=null && action.trim().equals("OK")) {
		String name = request.getParameter("name");
		Double normal = Double.parseDouble(request.getParameter("normal"));
		Double now = Double.parseDouble(request.getParameter("now"));
		Food f = new Food(name,normal,now);
		//System.out.println("aaa");
		FoodMgr.getMgr().add(f);
		out.println("<center>食品添加成功</center>");
		return ;
	}
%>
<html>
  <body>
  <div id="Layer1" style="position:absolute; width:100%; height:100%; z-index:-1">  
	<img src="../photo/background.jpg" height="100%" width="100%"/>  
	</div> 
   	<form action="FoodAdd.jsp" method="post">
   	<table align="center" border="1">
   		<tr>
   			<td>名称:</td>
   			<td><input type="text" name="name"></td>
   		</tr>
   		<tr>
   			<td>原价:</td>
   			<td><input type="text" name="normal"></td>
   		</tr>
   		<tr>
   			<td>现价:</td>
   			<td><input type="text" name="now"></td>
   		</tr>
   		<tr>
   			<td><input type="submit" value="添加食品"></td>
   			<td><input type="hidden" name="action" value="OK"></td>
   		</tr>
   	</table>
   	</form>
  </body>
</html>
