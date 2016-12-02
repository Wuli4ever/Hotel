package hotel.operator;

import java.sql.*;
import java.util.*;

import hotel.util.DB;

public class OperatorMySqlDAO implements OperatorDAO {

	public void save(Operator ope) {
		String sql = "insert into operator values (?,?,?,?)";
		Connection conn =null;
		PreparedStatement pstmt = null;
		try {
			conn = DB.getConnection();
			pstmt = DB.getPreStmt(conn, sql);
			pstmt.setInt(1, ope.getOpeid());
			pstmt.setString(2, ope.getAccount());
			pstmt.setString(3, ope.getPassword());
			pstmt.setString(4, ope.getName());
			System.out.println(ope.getName());
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(pstmt);
			DB.close(conn);
		}
	}

	public void update() {
	

	}

	public Operator getOperatorById(int id) {
		String sql = "select * from operator where opeid="+id;
		Connection conn =null;
		ResultSet rs = null;
		try {
			conn = DB.getConnection();
			rs = DB.getResultSet(conn, sql);
			if(rs.next()) {
				Operator ope = new Operator();
				ope.setOpeid(rs.getInt(1));
				ope.setAccount(rs.getString(2));
				ope.setPassword(rs.getString(3));
				ope.setName(rs.getString(4));
				return ope;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DB.close(rs);
			DB.close(conn);
		}
		return null;
	}
	
	

	public List<Operator> getOperators() {
		String sql = "select * from operator";
		Connection conn = null;
		ResultSet rs = null;
		List<Operator> lists = new ArrayList<Operator>();
		try {
			conn = DB.getConnection();
			rs = DB.getResultSet(conn,sql);
			while(rs.next()) {
				Operator ope = new Operator();
				ope.setOpeid(rs.getInt(1));
				ope.setAccount(rs.getString(2));
				ope.setPassword(rs.getString(3));
				ope.setName(rs.getString(4));
				lists.add(ope);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(rs);
			DB.close(conn);
		}
		return lists;
	}

	public void delete(int id) {
		

	}

}
