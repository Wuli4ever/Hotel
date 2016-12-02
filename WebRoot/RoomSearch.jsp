<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="hotel.room.* " %>
<%@ page language="java" import="hotel.user.* " %>
<%@ page language="java" import="hotel.book.* " %>
<%@ page language="java" import="java.sql.*"%>

<html>
	<body bgcolor="yellow">
		<%
	User u = (User)session.getAttribute("User");
		int cid = Integer.parseInt(request.getParameter("cid"));
		//System.out.println(cid);
	if(u == null) {
		out.println("<center>请先登录</center>");
		out.println("<center><a href='index.jsp'>点击此处返回首页</a></center>");
		return;
	}
	Book proxy = BookMgr.getMgr().getBookByIdcard(u.getIdcard());
	if(proxy!=null) {
		out.println("<center>一个用户一次只可以预定一间房</center>");
		out.println("<center><a href='index.jsp'>点击此处返回首页</a></center>");
		return ;
	}
	RoomState rs = RoomMgr.getMgr().getRoomStateById(u.getIdcard());
	if(rs!=null) {
		out.println("<center>一个用户一次只可以预定一间房</center>");
		out.println("<center><a href='index1.jsp'>点击此处返回首页</a></center>");
		return ;
	}
	request.setCharacterEncoding("UTF-8");
	
	String[] dates = request.getParameter("check").split("_");
	//String month = request.getParameter("month");
	//String day = request.getParameter("day");
	//String month1 = request.getParameter("month1");
	//String day1 = request.getParameter("day1");
	String checkin = dates[0];
	String checkout = dates[1];
	//int pmonth = Integer.parseInt(month);
	//int pmonth1 = Integer.parseInt(month1);
	//int pday = Integer.parseInt(day);
	//int pday1 = Integer.parseInt(day1);
	//boolean test = true;
	//if(pmonth>pmonth1) {
	//	test = false;
	//}
	//if(pmonth == pmonth1) {
	//	if(pday>=pday1) {
	//		test = false;
	//	}
	//}
	//if(!test) {
	//	out.println("<center>入住日期不规范</center>");
	//	out.println("<center><a href='index.jsp'>点击此处返回首页</a></center>");
	//	return ;
	//}
	
	
	//System.out.println(checkin+"----"+checkout);
	Book b = new Book();
	if(b.getCheckin(checkin).getTime()<new Timestamp(System.currentTimeMillis()).getTime()) {
		out.println("<center>入住日期应当大于当前时间</center>");
		out.println("<center><a href='index1.jsp'>点击此处返回首页</a></center>");
		return ;
	}
	b.setIdcard(u.getIdcard());
	b.setCid(cid);
	b.setCheckin(checkin);
	b.setCheckout(checkout);
	BookMgr.getMgr().save(b);
	//System.out.println(checkin);
	out.println("<center>预定成功</center>");
%>
	</body>
</html>