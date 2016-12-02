<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="hotel.category.* " %>
<%
	List<Category> list = CategoryMgr.getMgr().getCategories();
%>
<html>
  <body>
  <div id="Layer1" style="position:absolute; width:100%; height:100%; z-index:-1">  
	<img src="../photo/background.jpg" height="100%" width="100%"/>  
	</div> 
    <table align="center" border="2">
    	<tr>
    		<td>名称</td><td>面积</td><td>床型</td><td>网络</td><td>价格</td><td>押金</td>
    	</tr>
    	<%
    		for(int i=0;i<list.size();i++) {
    			Category c = list.get(i);
    	%>
    	<tr>
    		<td><%=c.getName() %></td>
    		<td><%=c.getArea() %></td>
    		<td><%=c.getBed() %></td>
    		<td><%=c.getNetwork() %></td>
    		<td><%=c.getPrice() %></td>
    		<td><%=c.getDeposit() %></td>
    		<td><a href="CategoryModify.jsp?id=<%=c.getId() %>" target="right">修改</a></td>
    		<td><a href="Upload.jsp?id=<%=c.getId() %>" target="right">上传图片</a></td>
    		<td><a href="DeleteCategoryPhoto.jsp?id=<%=c.getId() %>" target="right">删除图片</a></td>
    	</tr>
    	<% } %>
    </table>
  </body>
</html>
