<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="hotel.category.*" %>
<%	
	request.setCharacterEncoding("UTF-8");
	String action = request.getParameter("action");
	if(action !=null && action.trim().equals("OK")) {
		String name = request.getParameter("name");
		String bed = request.getParameter("bed");
		String network = request.getParameter("network");
		int area = Integer.parseInt(request.getParameter("area"));
		double price = Double.parseDouble(request.getParameter("price"));
		double deposit = Double.parseDouble(request.getParameter("deposit"));
		CategoryMgr.getMgr().save(new Category(name,network,bed,area,price,deposit));
	}
%>
<html>
  <body>
  <div id="Layer1" style="position:absolute; width:100%; height:100%; z-index:-1">  
	<img src="../photo/background.jpg" height="100%" width="100%"/>  
	</div> 
   	<form action="CategoryAdd.jsp" method="post">
   	<table align="center" border="1">
   		<tr>
   			<td>名称:</td>
   			<td><input type="text" name="name"></td>
   		</tr>
   		<tr>
   			<td>面积:</td>
   			<td><input type="text" name="area"></td>
   		</tr>
   		<tr>
   			<td>床    :</td>
   			<td><input type="text" name="bed"></td>
   		</tr>
   		<tr>
   			<td>网络:</td>
   			<td><input type="text" name="network"></td>
   		</tr>
   		<tr>
   			<td>价格:</td>
   			<td><input type="text" name="price"></td>
   		</tr>
   		<tr>
   			<td>押金:</td>
   			<td><input type="text" name="deposit"></td>
   		</tr>
   		<tr>
   			<td><input type="submit" value="添加种类"></td>
   			<td><input type="hidden" name="action" value="OK"></td>
   		</tr>
   	</table>
   	</form>
  </body>
</html>
