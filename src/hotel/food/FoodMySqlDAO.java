package hotel.food;
import hotel.util.DB;

import java.sql.*;
import java.util.*;

public class FoodMySqlDAO implements FoodDAO {

	
	public void add(Food f) {
		String sql = "insert into food values(null,?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DB.getConnection();
			pstmt = DB.getPreStmt(conn, sql);
			pstmt.setString(1, f.getName());
			pstmt.setDouble(2,f.getNormal());
			pstmt.setDouble(3, f.getNow());
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DB.close(pstmt);
			DB.close(conn);
		}
	}

	public List<Food> getFoods() {
		String sql = "select * from food order by id desc limit 0,3";
		Connection conn = null;
		ResultSet rs = null;
		List<Food> food = new ArrayList<Food>();
		try {
			conn = DB.getConnection();
			rs = DB.getResultSet(conn, sql);
			while(rs.next()) {
				Food f = new Food();
				f.setId(rs.getInt(1));
				f.setName(rs.getString(2));
				f.setNormal(rs.getDouble(3));
				f.setNow(rs.getDouble(4));
				food.add(f);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DB.close(rs);
			DB.close(conn);
		}
		return food;
	}

	public Food getFoodById(int id) {
		String sql = "select * from food where id="+id;
		Connection conn = null;
		ResultSet rs = null;
		try {
			conn = DB.getConnection();
			rs = DB.getResultSet(conn, sql);
			rs.next();
			Food f = new Food();
			f.setId(rs.getInt(1));
			f.setName(rs.getString(2));
			f.setNormal(rs.getDouble(3));
			f.setNow(rs.getDouble(4));
			return f;
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DB.close(rs);
			DB.close(conn);
		}
		return null;
	}

	public void Update(Food f) {
		String sql = "update food set name=?,normal=?,now=? where id="+f.getId();
		Connection conn = null;
		PreparedStatement pstmt =null;
		try {
			conn = DB.getConnection();
			pstmt = DB.getPreStmt(conn, sql);
			pstmt.setString(1, f.getName());
			pstmt.setDouble(2, f.getNormal());
			pstmt.setDouble(3, f.getNow());
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DB.close(pstmt);
			DB.close(conn);
		}

	}

}
