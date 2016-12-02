package hotel.user;
import java.sql.*;
import java.util.*;

import hotel.util.*;

public class UserMysqlDAO implements UserDAO {

	public void save(User u) {
		String sql = "insert into user values(?,?,?,?,?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DB.getConnection();
			pstmt = DB.getPreStmt(conn, sql);
			pstmt.setLong(1, u.getIdcard());
			pstmt.setString(2, u.getAccount());
			pstmt.setString(3, u.getPassword());
			pstmt.setString(4, u.getName());
			pstmt.setString(5, u.getSex());
			pstmt.setLong(6, u.getPhone());
			pstmt.setString(7, u.getAddr());
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DB.close(pstmt);
			DB.close(conn);
		}

	}
	
	public boolean checkUser(long idcard, String account) {
		boolean target = true;
		User u = null;
		u = getUserById(idcard);
		if(u !=null) {
			target=false;
		}
		Connection conn = null;
		ResultSet rs = null;
		String sql = "select * from user where account='"+account+"'";
		try {
			conn = DB.getConnection();
			rs = DB.getResultSet(conn, sql);
			if(rs!=null&&rs.next()) {
				target=false;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			//DB.close(rs);
			DB.close(conn);
		}
		
		return target;
	}



	@Override
	public int hashCode() {
		// TODO Auto-generated method stub
		return super.hashCode();
	}



	@Override
	public boolean equals(Object obj) {
		// TODO Auto-generated method stub
		return super.equals(obj);
	}



	@Override
	protected Object clone() throws CloneNotSupportedException {
		// TODO Auto-generated method stub
		return super.clone();
	}



	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return super.toString();
	}



	@Override
	protected void finalize() throws Throwable {
		// TODO Auto-generated method stub
		super.finalize();
	}



	@Override
	public void deleteById(long id) {

	}
	
	public Vip getVipById(long idcard) {
		Connection conn = null;
		ResultSet rs = null;
		Vip v = null;
		String sql = "select * from vip where idcard="+idcard;
		try {
			conn = DB.getConnection();
			rs = DB.getResultSet(conn, sql);
			if(rs.next()) {
				v = new Vip();
				v.setId(rs.getInt(1));
				v.setIdcard(rs.getLong(2));
				v.setName(rs.getString(3));
				v.setLevel(rs.getInt(4));
				v.setRdate(rs.getTimestamp(5));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return v;
	}

	@Override
	public void UpdateUser(long idcard, String addr, String password, long phone) {
		String sql = "update user set addr=?,password=?,phone=? where idcard="+idcard;
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DB.getConnection();
			pstmt = DB.getPreStmt(conn, sql);
			pstmt.setString(1, addr);
			pstmt.setString(2, password);
			pstmt.setLong(3,phone);
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DB.close(pstmt);
			DB.close(conn);
		}
	}

	public void addVip(User u, int level) {
		String sql = "insert into vip values(null,?,?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null; 
		try {
			conn = DB.getConnection();
			pstmt = DB.getPreStmt(conn,sql);
			pstmt.setLong(1,u.getIdcard());
			pstmt.setString(2, u.getName());
			pstmt.setInt(3, level);
			pstmt.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DB.close(pstmt);
			DB.close(conn);
		}
	}
	
	public List<Vip> getAllVip() {
		String sql = "select * from vip";
		Connection conn = null;
		ResultSet rs = null;
		List<Vip> list = new ArrayList<Vip>();
		try {
			conn = DB.getConnection();
			rs = DB.getResultSet(conn, sql);
			while(rs.next()) {
				Vip v = new Vip();
				v.setId(rs.getInt("id"));
				v.setIdcard(rs.getLong("idcard"));
				v.setLevel(rs.getInt("level"));
				v.setName(rs.getString("name"));
				v.setRdate(rs.getTimestamp("rdate"));
				list.add(v);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DB.close(rs);
			DB.close(conn);
		}
		return list;
	}

	public User getUserById(long id) {
		String sql = "select * from user where idcard ="+id;
		Connection conn = null;
		User u = null;
		ResultSet rs = null;
		try {
			conn = DB.getConnection();
			rs = DB.getResultSet(conn,sql);
			if(rs.next()) {
				u = new User(rs.getLong(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getLong(6),rs.getString(7));
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DB.close(rs);
			DB.close(conn);
		}
		return u;
		
	}

	public List<User> getUsers() {
		String sql = "select * from user";
		Connection conn = null;
		ResultSet rs = null;
		List<User> users= new ArrayList<User>();
		try {
			conn = DB.getConnection();
			rs = DB.getResultSet(conn, sql);
			while(rs.next()) {
				User u = new User();
				u.setIdcard(rs.getLong(1));
				u.setAccount(rs.getString(2));
				u.setPassword(rs.getString(3));
				u.setName(rs.getString(4));
				u.setSex(rs.getString(5));
				u.setPhone(rs.getLong(6));
				u.setAddr(rs.getString(7));
				users.add(u);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DB.close(rs);
			DB.close(conn);
		}
		return users;
	}
	
	
}
