package hotel.category;

import hotel.util.DB;

import java.util.*;
import java.sql.*;

public class CategoryMysqlDAO implements CategoryDAO {

	public void save(Category c) {
		String sql = "insert category values(null,?,?,?,?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DB.getConnection();
			pstmt = DB.getPreStmt(conn, sql);
			pstmt.setString(1,c.getName());
			pstmt.setInt(2, c.getArea());
			pstmt.setString(3, c.getBed());
			pstmt.setString(4, c.getNetwork());
			pstmt.setDouble(5,c.getPrice());
			pstmt.setDouble(6,c.getDeposit());
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DB.close(pstmt);
			DB.close(conn);
		}
	}
	
	
	
	public List<Category> getLatestCategories() {
		String sql = "select * from category order by id desc limit 0,3";
		Connection conn = null;
		ResultSet rs = null;
		List<Category> list = new ArrayList<Category>();
		try {
			conn = DB.getConnection();
			rs = DB.getResultSet(conn, sql);
			while(rs.next()) {
				Category c = new Category();
				c.setId(rs.getInt("id"));
				c.setName(rs.getString("cname"));
				c.setArea(rs.getInt("area"));
				c.setBed(rs.getString("bed"));
				c.setNetwork(rs.getString("network"));
				c.setPrice(rs.getDouble("price"));
				c.setDeposit(rs.getDouble("deposit"));
				list.add(c);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DB.close(rs);
			DB.close(conn);
		}
		System.out.println(list.size());
		return list;
		
	}
	
	public List<Category> getLatestCategories1() {
		String sql = "select * from category order by id desc limit 0,4";
		Connection conn = null;
		ResultSet rs = null;
		List<Category> list = new ArrayList<Category>();
		try {
			conn = DB.getConnection();
			rs = DB.getResultSet(conn, sql);
			while(rs.next()) {
				Category c = new Category();
				c.setId(rs.getInt("id"));
				c.setName(rs.getString("cname"));
				c.setArea(rs.getInt("area"));
				c.setBed(rs.getString("bed"));
				c.setNetwork(rs.getString("network"));
				c.setPrice(rs.getDouble("price"));
				c.setDeposit(rs.getDouble("deposit"));
				list.add(c);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DB.close(rs);
			DB.close(conn);
		}
		
		return list;
		
	}


	public Category getCategoryById(int id) {
		String sql = "select * from category where id="+id;
		Connection conn = null;
		ResultSet rs = null;
		Category c = new Category();
		try {
			conn = DB.getConnection();
			rs = DB.getResultSet(conn, sql);
			//rs.next();
			if(rs.next()) {
				c.setId(rs.getInt("id"));
				c.setName(rs.getString("cname"));
				c.setArea(rs.getInt("area"));
				c.setBed(rs.getString("bed"));
				c.setNetwork(rs.getString("network"));
				c.setPrice(rs.getDouble("price"));
				c.setDeposit(rs.getDouble("deposit"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DB.close(rs);
			DB.close(conn);
		}
		return c;
	}

	
	public void CategoryUpdate(int id,String name,int area,String network,String bed,double price,double deposit) {
		String sql = "update category set cname=?,area=?,price=?,deposit=?,bed=?,network=? where id="+id;
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DB.getConnection();
			pstmt = DB.getPreStmt(conn, sql);
			pstmt.setString(1, name);
			pstmt.setInt(2, area);
			pstmt.setDouble(3, price);
			pstmt.setDouble(4,deposit);
			pstmt.setString(5, bed);
			pstmt.setString(6, network);
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DB.close(pstmt);
			DB.close(conn);
		}
		
	}


	public List<Category> getCategories() {
		String sql = "select * from category";
		Connection conn = null;
		ResultSet rs = null;
		List<Category> list = new ArrayList<Category>();
		try {
			conn = DB.getConnection();
			rs = DB.getResultSet(conn, sql);
			while(rs.next()) {
				Category c = new Category();
				c.setId(rs.getInt("id"));
				c.setName(rs.getString("cname"));
				c.setArea(rs.getInt("area"));
				c.setBed(rs.getString("bed"));
				c.setNetwork(rs.getString("network"));
				c.setPrice(rs.getDouble("price"));
				c.setDeposit(rs.getDouble("deposit"));
				list.add(c);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DB.close(rs);
			DB.close(conn);
		}
		return list;
	}

}
