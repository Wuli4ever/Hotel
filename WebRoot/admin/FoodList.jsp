<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="hotel.food.* " %>
<%
	List<Food> foods = FoodMgr.getMgr().getFoods();
%>
<html>
  <body>
  <div id="Layer1" style="position:absolute; width:100%; height:100%; z-index:-1">  
	<img src="../photo/background.jpg" height="100%" width="100%"/>  
	</div> 
    <table align="center" border="2">
    	<tr>
    		<td>名称</td><td>原价</td><td>现价格</td>
    	</tr>
    	<%
    		for(int i=0;i<foods.size();i++) {
    			Food f = foods.get(i);
    	%>
    	<tr>
    		<td><%=f.getName() %></td>
    		<td><%=f.getNormal() %></td>
    		<td><%=f.getNow() %></td>
    		
    		<td><a href="FoodModify.jsp?id=<%=f.getId() %>" target="right">修改</a></td>
    		<td><a href="FoodUpload.jsp?id=<%=f.getId() %>" target="right">上传图片</a></td>
    		<td><a href="DeleteFoodPhoto.jsp?id=<%=f.getId() %>" target="right">删除图片</a></td>
    	</tr>
    	<% } %>
    </table>
  </body>
</html>
