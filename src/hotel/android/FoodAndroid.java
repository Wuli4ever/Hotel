package hotel.android;

import java.io.IOException;
import java.io.PrintWriter;
import hotel.category.*;
import hotel.cart.*;
import hotel.food.*;
import hotel.order.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import java.util.*;

public class FoodAndroid extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public FoodAndroid() {
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
		int rid = Integer.parseInt(request.getParameter("rid"));
		String username = request.getParameter("username");
		Cart cart = Cart.getCart();
		int count = Integer.parseInt(request.getParameter("count"));
		CartItem ci1 = new CartItem();
		CartItem ci2 = new CartItem();
		ci1.setFid(1);
		ci1.setCount(count);
		ci1.setPrice(FoodMgr.getMgr().getFoodById(1).getNow());
		ci2.setFid(2);
		ci2.setCount(count);
		ci2.setPrice(FoodMgr.getMgr().getFoodById(2).getNow());
		cart.add(ci1);
		cart.add(ci2);
		Order or = new Order();
		or.setCart(cart);
		or.setName(username);
		or.setRid(rid);
		or.save();
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
		request.setCharacterEncoding("UTF-8");
		int rid = Integer.parseInt(request.getParameter("rid"));
		String username = request.getParameter("username");
		Cart cart = Cart.getCart();
		int count = Integer.parseInt(request.getParameter("count"));
		CartItem ci1 = new CartItem();
		CartItem ci2 = new CartItem();
		ci1.setFid(1);
		ci1.setCount(count);
		ci1.setPrice(FoodMgr.getMgr().getFoodById(1).getNow());
		ci2.setFid(2);
		ci2.setCount(count);
		ci2.setPrice(FoodMgr.getMgr().getFoodById(2).getNow());
		cart.add(ci1);
		cart.add(ci2);
		Order or = new Order();
		or.setCart(cart);
		or.setName(username);
		or.setRid(rid);
		or.save();
		response.getWriter().write("success");
	}

	
	public void init() throws ServletException {
		// Put your code here
	}

}
