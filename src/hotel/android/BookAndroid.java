package hotel.android;

import java.io.IOException;
import java.io.PrintWriter;
import hotel.category.*;
import hotel.book.*;
import hotel.category.CategoryMgr;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import java.util.*;

public class BookAndroid extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public BookAndroid() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int idcard = Integer.parseInt(request.getParameter("idCard"));
		String cname = request.getParameter("cname");
		List<Category> categories = CategoryMgr.getMgr().getCategories();
		int cid=0;
		for(int i=0;i<categories.size();i++) {
			Category c = categories.get(i);
			if(c.getName().equals(cname)) {
				cid = c.getId();
				break;
			}
		}
		String checkin = request.getParameter("timein");
		String checkout = request.getParameter("timeout");
		//System.out.println(idcard);
		//System.out.println(cid);
		//System.out.println(cname);
		//System.out.println(checkin);
		//System.out.println(checkout);
		Book b = new Book();
		b.setCheckin(checkin);
		b.setCheckout(checkout);
		b.setCid(cid);
		b.setIdcard(idcard);
		BookMgr.getMgr().save(b);
		response.getWriter().write("success");
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//System.out.println("success");
		request.setCharacterEncoding("UTF-8");
		long idcard = Long.parseLong(request.getParameter("idCard"));
		Book proxy = BookMgr.getMgr().getBookByIdcard(idcard);
		if(proxy!=null) {
			response.getWriter().write("failed");
			return ;
		}
		String cname = request.getParameter("cname");
		List<Category> categories = CategoryMgr.getMgr().getCategories();
		int cid=0;
		for(int i=0;i<categories.size();i++) {
			Category c = categories.get(i);
			if(c.getName().equals(cname)) {
				cid = c.getId();
				break;
			}
		}
		String checkin = request.getParameter("timein");
		String checkout = request.getParameter("timeout");
		//System.out.println(idcard);
		//System.out.println(cid);
		//System.out.println(cname);
		//System.out.println(checkin);
		//System.out.println(checkout);
		Book b = new Book();
		
		b.setCheckin(checkin);
		b.setCheckout(checkout);
		b.setCid(cid);
		b.setIdcard(idcard);
		BookMgr.getMgr().save(b);
		response.getWriter().write("success");
	}

	
	public void init() throws ServletException {
		// Put your code here
	}

}
