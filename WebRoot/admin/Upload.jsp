<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="hotel.category.* " %>
<%
	request.setCharacterEncoding("UTF-8");
	int id = Integer.parseInt(request.getParameter("id"));
	String action = request.getParameter("action");
	CategoryMgr mgr = CategoryMgr.getMgr();
	Category c = mgr.getCategoryById(id);
%>
<html>
  <head>
  	
  </head>
  <body>
  <div id="Layer1" style="position:absolute; width:100%; height:100%; z-index:-1">  
	<img src="../photo/background.jpg" height="100%" width="100%"/>  
	</div> 
  	<form action = "../FileUpload" method="post" ENCTYPE="multipart/form-data">
    <table align="center" border="1" >
    	<tr>
    		<td>名称</td><td>面积</td><td>床铺</td><td>网络</td><td>价格</td><td>押金</td>
    	</tr>
    	
    	<tr>
    		<td><%=c.getName() %></td>
    		<td><%=c.getArea() %></td>
    		<td><%=c.getBed() %></td>
    		<td><%=c.getNetwork() %></td>
    		<td><%=c.getPrice() %></td>
    		<td><%=c.getDeposit() %></td>
    	</tr>
    	<input type="hidden" name="id" value="<%=c.getId() %>">
    	<tr>
    		<td><input type="file" name="file"></td>
    		<td><input type="submit" value="上传图片"></td>
    	</tr>
    	
    </table>
    </form>
  </body>
</html>
