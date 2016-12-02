package hotel.room;

import java.util.*;

public interface RoomDAO {
	void save(Room room);
	List<Room> getRooms();
	Room getRoomById(int id);
	void saveRoomState(RoomState rstate);
	List<Room> getProperRooms(int cid,String checkin,String checkout);
	List<RoomState> getAllRoomState();
	RoomState getRoomStateById(long idcard);
	void deleteRoomStateByIdcard(long idcard);
	double getDepositeByRoomId(int rid);
	void UpdateRoomState(long idcard,int days,double usedmoney);
	void UpdateRoom(int rid,int newrid,int cid,String facility);
}
