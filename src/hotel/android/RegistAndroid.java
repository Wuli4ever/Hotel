package hotel.android;

import java.io.IOException;
import java.io.PrintWriter;
import hotel.user.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import java.util.*;

public class RegistAndroid extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public RegistAndroid() {
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
		//System.out.println("doget");
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
		//System.out.println("getData");
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		int phone = Integer.parseInt(request.getParameter("phone"));
		int idcard = Integer.parseInt(request.getParameter("id"));
		String addr = request.getParameter("address");
		String sex = request.getParameter("sex");
		String account = request.getParameter("account");
		User u = new User();
		u.setAddr(addr);
		u.setIdcard(idcard);
		u.setName(name);
		u.setPassword(password);
		u.setPhone(phone);
		u.setSex(sex);
		u.setAccount(account);
		UserMgr.getMgr().save(u);
		response.getWriter().write("success");
	}

	
	public void init() throws ServletException {
		// Put your code here
	}

}
