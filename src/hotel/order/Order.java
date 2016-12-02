package hotel.order;
import hotel.util.DB;
import hotel.cart.*;
import java.util.*;
import java.sql.*;

public class Order {
	private int id;
	private int rid;
	private String name;
	private int status;
	private Cart cart;
	public Order() {}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getRid() {
		return rid;
	}

	public void setRid(int rid) {
		this.rid = rid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Cart getCart() {
		return cart;
	}

	public void setCart(Cart cart) {
		this.cart = cart;
	}
	
	public static List<Order> getOrders() {
		List<Order> orders = new ArrayList<Order>();
		String sql = "select * from salesorder where status=0";
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn = DB.getConnection();
			rs = DB.getResultSet(conn, sql);
			while(rs.next()) {   
				Order or = new Order();
				or.setId(rs.getInt("id"));
				or.setRid(rs.getInt(2));
				or.setStatus(rs.getInt("status"));
				or.setName(rs.getString("name"));
				orders.add(or);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(rs);
			DB.close(stmt);
			DB.close(conn);
		}
		return orders;
	}
	
	public static Order getOrderById(int id) {
		String sql = "select * from salesorder where id="+id;
		Connection conn =null;
		ResultSet rs = null;
		Order or = null;
		try {
			conn = DB.getConnection();
			rs = DB.getResultSet(conn, sql);
			if(rs.next()) {
				or = new Order();
				or.setId(rs.getInt(1));
				or.setRid(rs.getInt(2));
				or.setName(rs.getString(3));
				or.setStatus(rs.getInt(4));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DB.close(rs);
			DB.close(conn);
		}
		return or;
	}
	
	public void deleteOrderById(int id) {
		String sql = "delete from salesorder where id="+id;
		Connection conn = null;
		Statement stmt = null;
		try {
			conn = DB.getConnection();
			stmt = DB.getStmt(conn);
			stmt.execute(sql);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DB.close(stmt);
			DB.close(conn);
		}
	}
	
	public void UpdateStatus(int status) {
		Connection conn = DB.getConnection();
		Statement stmt = DB.getStmt(conn);
		String sql = "update salesorder set status="+status+" where id ="+this.id;
		try {
			stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(stmt);
			DB.close(conn);
		}
	}

	public void save() {
		Connection conn = DB.getConnection();
		String sql = "insert into salesorder values(null,?,?,?)";
		
		PreparedStatement Pstmt = null;
		ResultSet rsKey = null;
		try {
			conn.setAutoCommit(false);
			Pstmt = DB.getPreStmt(conn, sql,true);
			Pstmt.setInt(1, this.rid);
			Pstmt.setString(2,this.name);
			Pstmt.setInt(3,this.status);
			Pstmt.executeUpdate();
			rsKey = Pstmt.getGeneratedKeys();
			rsKey.next();
			int key = rsKey.getInt(1);
			
			String sqlItem = "insert into salesitem values (null,?,?,?,?)";
			Pstmt = DB.getPreStmt(conn,sqlItem);
			List<CartItem> items = cart.getItems();
			for(int i=0;i<items.size();i++) {
				CartItem ci = items.get(i);
				Pstmt.setInt(1,key);
				Pstmt.setDouble(2,ci.getFid());
				Pstmt.setDouble(3,ci.getPrice());
				Pstmt.setInt(4, ci.getCount());
				Pstmt.addBatch();
			}
			Pstmt.executeBatch();
			
			conn.commit();
			conn.setAutoCommit(true);
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				conn.setAutoCommit(true);
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		} finally {
			DB.close(rsKey);
			DB.close(Pstmt);
			DB.close(conn);
		}
	}
	
}
