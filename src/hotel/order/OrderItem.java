package hotel.order;

import hotel.util.DB;
import hotel.food.*;
import java.sql.*;
import java.util.*;


public class OrderItem {
	private int id;
	private int oid;
	private Double price;
	private int count;
	private int fid;
	
	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getOid() {
		return oid;
	}

	public void setOid(int oid) {
		this.oid = oid;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getFid() {
		return fid;
	}

	public void setFid(int fid) {
		this.fid = fid;
	}

	public static List<OrderItem> getItemsById(int OrderId) {
		List<OrderItem> items = new ArrayList<OrderItem>();
		Connection conn = null;
		ResultSet rs = null;
		try {
			conn = DB.getConnection();
			String sql = "select * from salesitem where oid="+OrderId;
			//System.out.println(sql);
			rs = DB.getResultSet(conn, sql);
			while(rs.next()) {
				OrderItem oi = new OrderItem();
				oi.setCount(rs.getInt("count"));
				oi.setId(rs.getInt("id"));
				oi.setPrice(rs.getDouble("price"));
				oi.setOid(OrderId);
				oi.setFid(rs.getInt("fid"));
				items.add(oi);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(rs);
			DB.close(conn);
		}
		return items;
	}
	
	public static List<OrderItem> getItems() {
		List<OrderItem> items = new ArrayList<OrderItem>();
		String sql = "select * from salesitem";
		Connection conn = null;
		ResultSet rs = null;
		try {
			conn = DB.getConnection();
			rs = DB.getResultSet(conn, sql);
			while(rs.next()) {
				OrderItem oi = new OrderItem();
				oi.setCount(rs.getInt("count"));
				oi.setId(rs.getInt("id"));
				oi.setPrice(rs.getDouble("price"));
				oi.setOid(rs.getInt("oid"));
				oi.setFid(rs.getInt("fid"));
				items.add(oi);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DB.close(rs);
			DB.close(conn);
		}
		return items;
	}
	
	public static List<Food> getFoodsAndCount() {
		List<OrderItem> items = getItems();
		List<Food> foods = FoodMgr.getMgr().getFoods();
		for(int i=0;i<foods.size();i++) {
			for(int j=0;j<items.size();j++) {
				if(foods.get(i).getId()==items.get(j).getFid()) {
					foods.get(i).setNumber(foods.get(i).getNumber()+items.get(j).getCount());
				}
			}
		}
		return foods;
	}
	
	public void save() {
		
	}
}
