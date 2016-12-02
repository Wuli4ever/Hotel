<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="hotel.item.* " %>
<%@ page language="java" import="hotel.category.* " %>
<%
	List<Item> items = ItemMgr.getMgr().getItems();
%>
<html>
  <body>
  <div id="Layer1" style="position:absolute; width:100%; height:100%; z-index:-1">  
	<img src="../photo/background.jpg" height="100%" width="100%"/>  
	</div> 
    <table align="center" border="2">
    	<tr>
    		<td>员工号</td><td>房间号</td><td>入住日期</td><td>入住日期</td><td>金额</td>
    	</tr>
    	<%
    		for(int i=0;i<items.size();i++) {
    			Item item = items.get(i);
    	%>
    	<tr>
    		<td><%=item.getOpeid() %></td>
    		<td><%=item.getRid() %></td>
    		<td><%=item.getCheckin() %></td>
    		<td><%=item.getCheckout() %></td>
    		<td><%=item.getMoney() %></td>
    		
    	</tr>
    	<% } %>
    </table>
  </body>
</html>
