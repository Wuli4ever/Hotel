<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="hotel.food.* " %>
<%
	request.setCharacterEncoding("UTF-8");
	int id = Integer.parseInt(request.getParameter("id"));
	Food f = FoodMgr.getMgr().getFoodById(id);
%>
<html>
  <head>
  	
  </head>
  <body>
  <div id="Layer1" style="position:absolute; width:100%; height:100%; z-index:-1">  
	<img src="../photo/background.jpg" height="100%" width="100%"/>  
	</div> 
  	<form action = "/Hotel/FoodUpload" method="post" ENCTYPE="multipart/form-data">
    <table align="center" border="1" >
    	<tr>
    		<td>名称</td><td>原价</td><td>现价</td>
    	</tr>
    	
    	<tr>
    		<td><%=f.getName() %></td>
    		<td><%=f.getNormal() %></td>
    		<td><%=f.getNow() %></td>
    	</tr>
    	<input type="hidden" name="id" value="<%=f.getId() %>">
    	<tr>
    		<td><input type="file" name="file"></td>
    		<td><input type="submit" value="上传图片"></td>
    	</tr>
    	
    </table>
    </form>
  </body>
</html>
