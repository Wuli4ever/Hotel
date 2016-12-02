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

public class UserAndroid extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public UserAndroid() {
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
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		response.setHeader("Content-type", "json;charset=UTF-8");  
		//System.out.println(username);
		//System.out.println(password);
		List<User> users = UserMgr.getMgr().getUsers();
		int target=0;
		for(int i=0;i<users.size();i++) {
			User u = users.get(i);
			//System.out.println(u.getName());
			//System.out.println(u.getPassword());
			if(u.getAccount().equals(username)) {
				target=1;
				if(u.getPassword().equals(password)) {
					Gson gson = new Gson();
					String json = gson.toJson(u);
					//System.out.println(json);
					response.getWriter().write(json);
					return ;
				}
			}
		}
		if(target == 0) {
			response.getWriter().write("a");
		}
		if(target == 1) {
			response.getWriter().write("b");
		}
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
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		response.setHeader("Content-type", "json;charset=UTF-8");  
		//System.out.println(username);
		//System.out.println(password);
		List<User> users = UserMgr.getMgr().getUsers();
		int target=0;
		for(int i=0;i<users.size();i++) {
			User u = users.get(i);
			//System.out.println(u.getName());
			//System.out.println(u.getPassword());
			if(u.getAccount().equals(username)) {
				target=1;
				if(u.getPassword().equals(password)) {
					Gson gson = new Gson();
					String json = gson.toJson(u);
					//System.out.println(json);
					response.getWriter().write(json);
					return ;
				}
			}
		}
		if(target == 0) {
			response.getWriter().write("a");
		}
		if(target == 1) {
			response.getWriter().write("b");
		}
	}

	
	public void init() throws ServletException {
		// Put your code here
	}

}
