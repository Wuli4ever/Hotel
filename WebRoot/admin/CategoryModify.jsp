<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="hotel.category.* " %>
<%
	request.setCharacterEncoding("UTF-8");
	int id = Integer.parseInt(request.getParameter("id"));
	String action = request.getParameter("action");
	CategoryMgr mgr = CategoryMgr.getMgr();
	if(action !=null && action.trim().equals("OK")) {
		String name = request.getParameter("name");
		String bed = request.getParameter("bed");
		String network = request.getParameter("network");
		int area = Integer.parseInt(request.getParameter("area"));
		double price = Double.parseDouble(request.getParameter("price"));
		double deposit = Double.parseDouble(request.getParameter("deposit"));
		mgr.CategoryUpdate(id, name, area,bed,network, price, deposit);
	}
	Category c = mgr.getCategoryById(id);
%>
<html>
  <head>
  	
  </head>
  <body>
  <div id="Layer1" style="position:absolute; width:100%; height:100%; z-index:-1">  
	<img src="../photo/background.jpg" height="100%" width="100%"/>  
	</div> 
  	<form action = "CategoryModify.jsp" method="post">
    <table align="center" border="1" >
    	<tr>
    		<td>名称</td><td>面积</td><td>床型</td><td>网络</td><td>价格</td><td>押金</td>
    	</tr>
    	
    	<tr>
    		<td><input type="text" name="name" value="<%=c.getName() %>"></td>
    		<td><input type="text" name="area" value="<%=c.getArea() %>"></td>
    		<td><input type="text" name="bed" value="<%=c.getBed() %>"></td>
    		<td><input type="text" name="network" value="<%=c.getNetwork() %>"></td>
    		<td><input type="text" name="price" value="<%=c.getPrice() %>"></td>
    		<td><input type="text" name="deposit" value="<%=c.getDeposit() %>"></td>
    	</tr>
    	<tr>
    		<td><input type="submit" value="修改"></td>
    	</tr>
    	
    </table>
    	<input type="hidden" name ="action" value="OK">
    	<input type="hidden" name ="id" value="<%=c.getId() %>">
    </form>
  </body>
</html>
