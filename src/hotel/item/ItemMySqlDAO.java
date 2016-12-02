package hotel.item;

import hotel.util.DB;

import java.util.ArrayList;
import java.util.List;
import java.sql.*;

public class ItemMySqlDAO implements ItemDAO {


	public void save(Item item) {
		String sql = "insert into item values(null,?,?,?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DB.getConnection();
			pstmt = DB.getPreStmt(conn, sql);
			pstmt.setInt(1, item.getOpeid());
			pstmt.setInt(2,item.getRid());
			pstmt.setTimestamp(3, item.getCheckin());
			pstmt.setTimestamp(4, item.getCheckout());
			pstmt.setDouble(5, item.getMoney());
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DB.close(pstmt);
			DB.close(conn);
		}
	}

	
	public List<Item> getItems() {
		Connection conn = null;
		String sql = "select * from item";
		ResultSet rs = null;
		List<Item> items = new ArrayList<Item>();
		try {
			conn = DB.getConnection();
			rs = DB.getResultSet(conn,sql);
			while(rs.next()) {
				Item i = new Item();
				i.setId(rs.getInt(1));
				i.setOpeid(rs.getInt(2));
				i.setRid(rs.getInt(3));
				i.setCheckin(rs.getTimestamp(4));
				i.setCheckout(rs.getTimestamp(5));
				i.setMoney(rs.getDouble(6));
				items.add(i);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DB.close(rs);
			DB.close(conn);
		}
		return items;
	}

}
