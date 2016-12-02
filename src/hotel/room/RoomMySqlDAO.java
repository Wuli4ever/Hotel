package hotel.room;

import java.util.ArrayList;
import java.util.List;
import hotel.util.*;

import java.sql.*;

public class RoomMySqlDAO implements RoomDAO {

	public void save(Room room) {
		String sql = "insert into room values(?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DB.getConnection();
			pstmt = DB.getPreStmt(conn, sql);
			pstmt.setInt(1, room.getRid());
			pstmt.setInt(2, room.getCid());
			pstmt.setString(3, room.getFacility());
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DB.close(pstmt);
			DB.close(conn);
		}
	}
	
	public void UpdateRoom(int rid,int newrid, int cid, String facility) {
		String sql = "update room set rid=?,cid=?,facility=? where rid="+rid;
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DB.getConnection();
			pstmt = DB.getPreStmt(conn, sql);
			pstmt.setInt(1, newrid);
			pstmt.setInt(2, cid);
			pstmt.setString(3, facility);
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DB.close(pstmt);
			DB.close(conn);
		}
	}


	public void UpdateRoomState(long idcard, int days, double usedmoney) {
		RoomState rstate = getRoomStateById(idcard);
		Timestamp t = rstate.getCheckout();
		t = new Timestamp(t.getTime()+days*3600*24*1000);
		String sql ="update roomstate set deposit = deposit-"+usedmoney+",usedmoney=usedmoney+"+usedmoney+","
				+ "checkout=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DB.getConnection();
			pstmt = DB.getPreStmt(conn, sql);
			pstmt.setTimestamp(1, t);
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DB.close(pstmt);
			DB.close(conn);
		}
	}



	public double getDepositeByRoomId(int rid) {
		String sql = "select c.price from category as c,room as r where r.cid=c.id and r.rid="+rid;
		Connection conn = null;
		ResultSet rs = null;
		Double deposit=0.0;
		try {
			conn = DB.getConnection();
			rs = DB.getResultSet(conn, sql);
			rs.next();
			deposit = rs.getDouble(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return deposit;
	}


	public RoomState getRoomStateById(long idcard) {
		String sql = "select * from roomstate where idcard="+idcard;
		Connection conn =null;
		ResultSet rs = null;
		try {
			conn = DB.getConnection();
			rs = DB.getResultSet(conn, sql);
			if(rs.next()) {
				RoomState rstate = new RoomState();
				rstate.setIdcard(rs.getLong("idcard"));
				rstate.setName(rs.getString("name"));
				rstate.setOpeid(rs.getInt("opeid"));
				rstate.setRid(rs.getInt("rid"));
				rstate.setDeposit(rs.getDouble("deposit"));
				rstate.setUsedmoney(rs.getDouble("usedmoney"));
				rstate.setCheckin((rs.getTimestamp("checkin")));
				rstate.setCheckout(rs.getTimestamp("checkout"));
				return rstate;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DB.close(rs);
			DB.close(conn);
		}
		return null;
		
	}

	public void deleteRoomStateByIdcard(long idcard) {
		String sql = "delete from roomstate where idcard="+idcard;
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


	public List<RoomState> getAllRoomState() {
		String sql = "select * from roomstate";
		Connection conn = null;
		ResultSet rs = null;
		List<RoomState> list = new ArrayList<RoomState>();
		try {
			conn = DB.getConnection();
			rs = DB.getResultSet(conn, sql);
			while(rs.next()) {
				RoomState rstate = new RoomState();
				rstate.setIdcard(rs.getLong("idcard"));
				rstate.setName(rs.getString("name"));
				rstate.setOpeid(rs.getInt("opeid"));
				rstate.setUsedmoney(rs.getDouble("usedmoney"));
				rstate.setCheckin(rs.getTimestamp("checkin"));
				rstate.setCheckout(rs.getTimestamp("checkout"));
				rstate.setRid(rs.getInt("rid"));
				rstate.setDeposit(rs.getDouble("deposit"));
				list.add(rstate);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DB.close(rs);
			DB.close(conn);
		}
		return list;
	}

	public List<Room> getProperRooms(int cid,String checkin,String checkout) {
		String sql = null;
		Connection conn = null;
		ResultSet rs = null;
		List<Room> list = new ArrayList<Room>();
		try {
			sql = "select * from room where cid="+cid+" and room.rid not in (select rs.rid from room as r,roomstate as rs where r.rid=rs.rid and rs.checkin<'"+checkout+"' and rs.checkout > '"+checkin+"' group by rs.rid)";
			conn = DB.getConnection();
			rs = DB.getResultSet(conn, sql);
			
			while(rs.next()) {
				Room room = new Room(rs.getInt(1),rs.getInt(2),rs.getString(3));
				list.add(room);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DB.close(rs);
			DB.close(conn);
			
		}
		return list;
	}


	public void saveRoomState(RoomState rstate) {
		String sql = "insert into roomstate values(?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt = null;
		Connection conn = null;
		try {
			conn = DB.getConnection();
			pstmt = DB.getPreStmt(conn, sql);
			pstmt.setInt(1, rstate.getRid());
			pstmt.setLong(2,rstate.getIdcard());
			pstmt.setString(3, rstate.getName());
			pstmt.setInt(4,rstate.getOpeid());
			pstmt.setDouble(5, rstate.getDeposit());
			pstmt.setDouble(6, rstate.getUsedmoney());
			pstmt.setTimestamp(7, rstate.getCheckin());
			pstmt.setTimestamp(8, rstate.getCheckout());
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DB.close(pstmt);
			DB.close(conn);
		}
	}

	public List<Room> getRooms() {
		String sql = "select * from room";
		Connection conn = null;
		ResultSet rs = null;
		List<Room> lists = new ArrayList<Room>();
		try {
			conn = DB.getConnection();
			rs = DB.getResultSet(conn,sql);
			while(rs.next()) {
				Room room = new Room();
				room.setRid(rs.getInt(1));
				room.setCid(rs.getInt(2));
				room.setFacility(rs.getString(3));
				lists.add(room);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(rs);
			DB.close(conn);
		}
		return lists;
	}

	public Room getRoomById(int id) {
		String sql = "select * from room where rid="+id;
		Connection conn =null;
		ResultSet rs = null;
		try {
			conn = DB.getConnection();
			rs = DB.getResultSet(conn, sql);
			if(rs.next()) {
				Room room = new Room();
				room.setRid(rs.getInt(1));
				room.setCid(rs.getInt(2));
				room.setFacility(rs.getString(3));
				return room;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DB.close(rs);
			DB.close(conn);
		}
		return null;
		
	}

}
