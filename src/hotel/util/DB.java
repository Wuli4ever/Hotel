package hotel.util;

import java.sql.*;

public class DB {
	static {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public static Connection getConnection() {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost/Hotel","root","");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public static Statement getStmt(Connection conn) {
		Statement stmt = null;
		if(conn!=null) {
			try {
				stmt = conn.createStatement();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return stmt;
	}
	
	public static PreparedStatement getPreStmt(Connection conn,String sql) {
		PreparedStatement pstmt = null;
		if(conn !=null) {
			try {
				pstmt = conn.prepareStatement(sql);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return pstmt;
	}
	
	public static PreparedStatement getPreStmt(Connection conn,String sql,boolean generatedKey) {
		PreparedStatement pstmt = null;
		if(conn !=null) {
			try {
				pstmt = conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return pstmt;
	}
	
	public static ResultSet getResultSet(Connection conn,String sql) {
		ResultSet rs = null;
		Statement stmt = null;
		if(conn==null) {
			conn = getConnection(); 
		}
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		
		return rs;
	}
	
	public static void close(Connection conn) {
		try {
			if(conn!=null) {
				conn.close();
				conn = null;
			}	
		} catch (SQLException e) {
				e.printStackTrace();
		}
	}
	
	public static void close(Statement stmt) {
		try {
			if(stmt!=null) {
				stmt.close();
				stmt=null;
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close(ResultSet rs) {
		try {
			if(rs!=null) {
				rs.close();
				rs = null;
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.0.101/Hotel","user","123");
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from user");
		while(rs.next()) {
			System.out.println(rs.getLong(1)+" "+rs.getString(4));
		}
		//Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Hotel","root","");
	}
}
