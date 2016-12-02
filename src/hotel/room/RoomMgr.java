package hotel.room;

import java.util.*;



public class RoomMgr {
	
	private static RoomMgr mgr = null;
	RoomDAO dao = new RoomMySqlDAO();
	
	private RoomMgr() {}
	
	public static RoomMgr getMgr() {
		if(mgr == null) {
			mgr = new RoomMgr();
		}
		return mgr;
	}
	
	public double getDepositeByRoomId(int rid) {
		return dao.getDepositeByRoomId(rid);
	}
	public void saveRoomState(RoomState rstate) {
		dao.saveRoomState(rstate);
	}
	
	public List<Room> getProperRooms(int cid,String checkin,String checkout) {
		return dao.getProperRooms(cid, checkin, checkout);
	}
	
	public void deleteRoomStateByIdcard(long idcard) {
		dao.deleteRoomStateByIdcard(idcard);
	}
	public void save(Room r) {
		dao.save(r);
	}
	
	public void UpdateRoomState(long idcard, int days, double usedmoney) {
		dao.UpdateRoomState(idcard, days, usedmoney);
	}
	public List<Room> getRooms() {
		return dao.getRooms();
	}
	
	public void UpdateRoom(int rid,int newrid, int cid, String facility) {
		dao.UpdateRoom(rid,newrid, cid, facility);
	}
	public Room getRoomById(int id) {
		return dao.getRoomById(id);
	}
	
	public RoomState getRoomStateById(long idcard) {
		return dao.getRoomStateById(idcard);
	}
	
	public List<RoomState> getAllRoomState() {
		return dao.getAllRoomState();
	}
}
