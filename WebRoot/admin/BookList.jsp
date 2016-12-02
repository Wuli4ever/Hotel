<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="hotel.book.* " %>
<%@ page language="java" import="hotel.category.* " %>
<%
	List<Book> books = BookMgr.getMgr().getBooks();
	CategoryMgr mgr = CategoryMgr.getMgr();
%>
<html>
  <body>
  <div id="Layer1" style="position:absolute; width:100%; height:100%; z-index:-1">  
	<img src="../photo/background.jpg" height="100%" width="100%"/>  
	</div> 
    <table align="center" border="2">
    	<tr>
    		<td>预定ID</td><td>身份证号</td><td>房间类别</td><td>入住日期</td><td>退宿日期</td><td>处理</td><td></td>
    	</tr>
    	<%
    		for(int i=0;i<books.size();i++) {
    			Book b = books.get(i);
    	%>
    	<tr>
    		<td><%=b.getId() %></td>
    		<td><%=b.getIdcard() %></td>
    		<td><%=mgr.getCategoryById(b.getCid()).getName() %></td>
    		<td><%=b.getCheckin() %></td>
    		<td><%=b.getCheckout() %></td>
    		<td><a href="BookResult.jsp?id=<%=b.getId() %>" target="right">查找房间</a></td>
    		<td><a href="BookDelete.jsp?idcard=<%=b.getIdcard() %>" target="right">删除预定</a></td>
    		
    	</tr>
    	<% } %>
    </table>
  </body>
</html>
