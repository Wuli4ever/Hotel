<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="hotel.food.* " %>
<%
	request.setCharacterEncoding("UTF-8");
	int id = Integer.parseInt(request.getParameter("id"));
	String action = request.getParameter("action");
	Food f = FoodMgr.getMgr().getFoodById(id);
	if(action !=null && action.trim().equals("OK")) {
		String name = request.getParameter("name");
		double normal = Double.parseDouble(request.getParameter("normal"));
		double now = Double.parseDouble(request.getParameter("now"));
		f.setName(name);
		f.setNormal(normal);
		f.setNow(now);
		FoodMgr.getMgr().Update(f);
		out.println("<center>修改成功</center>");
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
  	<form action = "FoodModify.jsp" method="post">
    <table align="center" border="1" >
    	<tr>
    		<td>名称</td><td>原价</td><td>现价</td>
    	</tr>
    	
    	<tr>
    		<td><input type="text" name="name" value="<%=f.getName() %>"></td>
    		<td><input type="text" name="normal" value="<%=f.getNormal() %>"></td>
    		<td><input type="text" name="now" value="<%=f.getNow() %>"></td>
    	</tr>
    	<tr>
    		<td><input type="submit" value="修改"></td>
    	</tr>
    	
    </table>
    	<input type="hidden" name ="action" value="OK">
    	<input type="hidden" name ="id" value="<%=f.getId() %>">
    </form>
  </body>
</html>
