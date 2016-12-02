package hotel.book;

import hotel.util.*;

import java.util.ArrayList;
import java.util.List;
import java.sql.*;

public class BookMySqlDAO implements BookDAO {

	
	public void save(Book b) {
		String sql = "insert into book values(null,?,?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DB.getConnection();
			pstmt = DB.getPreStmt(conn, sql);
			pstmt.setLong(1, b.getIdcard());
			pstmt.setInt(2, b.getCid());
			pstmt.setTimestamp(3, b.getCheckin());
			pstmt.setTimestamp(4, b.getCheckout());
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DB.close(pstmt);
			DB.close(conn);
		}
	}
	
	public void deleteById(long id) {
		String sql = "delete from book where idcard="+id;
		Connection conn = null;
		Statement stmt = null;
		try {
			conn = DB.getConnection();
			stmt = DB.getStmt(conn);
			stmt.executeUpdate(sql);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DB.close(stmt);
			DB.close(conn);
		}
		
	}

	
	public Book getBookByIdcard(long idcard) {
		String sql = "select * from book where idcard="+idcard;
		Connection conn = null;
		ResultSet rs = null;
		Book b = null;
		try {
			conn = DB.getConnection();
			rs = DB.getResultSet(conn, sql);
			if(rs.next()) {
				b = new Book();
				b.setId(rs.getInt(1));
				b.setIdcard(rs.getLong(2));
				b.setCid(rs.getInt(3));
				b.setCheckin(rs.getTimestamp(4));
				b.setCheckout(rs.getTimestamp(5));
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DB.close(rs);
			DB.close(conn);
		}
		return b;
	}

	public Book getBookById(int id) {
		String sql = "select * from book where id="+id;
		Connection conn = null;
		ResultSet rs = null;
		try {
			conn = DB.getConnection();
			rs = DB.getResultSet(conn, sql);
			rs.next();
			Book b = new Book();
			b.setId(rs.getInt(1));
			b.setIdcard(rs.getLong(2));
			b.setCid(rs.getInt(3));
			b.setCheckin(rs.getTimestamp(4));
			b.setCheckout(rs.getTimestamp(5));
			return b;
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public List<Book> getBooks() {
		String sql = "select * from book";
		Connection conn = null;
		ResultSet rs = null;
		List<Book> list = new ArrayList<Book>();
		try {
			conn = DB.getConnection();
			rs = DB.getResultSet(conn, sql);
			while(rs.next()) {
				Book b = new Book();
				b.setId(rs.getInt(1));
				b.setIdcard(rs.getLong(2));
				b.setCid(rs.getInt(3));
				b.setCheckin(rs.getTimestamp(4));
				b.setCheckout(rs.getTimestamp(5));
				list.add(b);
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
