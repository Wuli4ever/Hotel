<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="hotel.category.*" %>

<%
	int id = Integer.parseInt(request.getParameter("id"));
	List<Category> list = CategoryMgr.getMgr().getCategories();
%>
<!DOCTYPE html>
 <html> 
<head>
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><!--定义文档渲染兼容模式-->
  <title>所有类别</title><!--//设置标题-->
  <link rel="stylesheet" href="source/style1.css"><!--引用样式表-->
</head>
<body>

  <div class="plans"><!--组合块级元素，div就是块级元素，以便通过样式表来对这些元素进行格式化-->
    <%
    	for(int i=0;i<list.size();i++) {
    		Category c = list.get(i);
    	
    %>
    <div class="plan">
  
      <h3 class="plan-title"><%=c.getName() %></h3><!--<h1> - <h6> 标签可定义标题。<h1> 定义最大的标题。<h6> 定义最小的标题-->
      <!--p为段落标记,上面也换行，下面也换行-->
	  <p class="plan-price">&yen<%=c.getPrice() %> 
	  <span class="plan-unit">per day</span><!--<span>在行内定义一个区域，也就是一行内可以被<span>划分成好几个区域，从而实现某种特定效果。-->
	  </p>
      <ul class="plan-features"><!--HTML列表-->
       
      </ul>
      <a href="index1.jsp" class="plan-button">返回首页订阅</a><!--将href="#"是指联接到当前页面，其实是无意义的，页面也不会刷新,就是页面没变化-->
    </div>
   <% 
   		if((i+1)%4==0) {
   			out.println("</div>");
   			out.println("<div class='plans'>");
   		}
   		}
    %>
  </div>
  
  

  
</body>
</html>
