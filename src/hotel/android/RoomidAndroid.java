package hotel.android;

import java.io.IOException;
import java.io.PrintWriter;

import hotel.room.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import java.util.*;

public class RoomidAndroid extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public RoomidAndroid() {
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
		response.setHeader("Content-type", "json;charset=UTF-8");
		List<Room> rooms = RoomMgr.getMgr().getRooms();
		Gson gson = new Gson();
		String result = gson.toJson(rooms);
		response.getWriter().write(result);
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
		response.setHeader("Content-type", "json;charset=UTF-8");
		List<Room> rooms = RoomMgr.getMgr().getRooms();
		Gson gson = new Gson();
		String result = gson.toJson(rooms);
		response.getWriter().write(result);
		
	}

	
	public void init() throws ServletException {
		// Put your code here
	}

}
