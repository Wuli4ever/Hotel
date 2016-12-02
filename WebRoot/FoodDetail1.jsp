<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="hotel.food.* " %>

<%
	request.setCharacterEncoding("UTF-8");
	int id = Integer.parseInt(request.getParameter("id"));
	Food f = FoodMgr.getMgr().getFoodById(id);
	//json
%>

<!DOCTYPE html>
<html lang="en"> 
<head>
  <meta charset="utf-8"><!--编码格式 告诉给浏览器用什么方式来都这页代码-->
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><!--定义文档渲染兼容模式-->
  <title>食品详情</title><!--//设置标题-->
  <link rel="stylesheet" href="source/style1.css"><!--引用样式表-->
</head>
<body>
  <div class="plans"><!--组合块级元素，div就是块级元素，以便通过样式表来对这些元素进行格式化-->
   
    
    <div class="plan">
      <h3 class="plan-title">名称:<%=f.getName() %></h3>
      <p class="plan-price">&yen<%=f.getNow() %>  <span class="plan-unit">现价</span></p>
      <ul class="plan-features">
        <li class="plan-feature">&infin; <span class="plan-feature-name">websites</span></li>
        
      </ul>
      <a href="#" class="plan-button">Pay</a>
    </div>
  </div>

  
</body>
</html>
