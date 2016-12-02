package hotel.room;

public class Room {
	private int rid;
	private int cid;
	private String facility;
	
	public Room() {}
	
	public Room(int rid,int cid,String facility) {
		this.rid = rid;
		this.cid = cid;
		this.facility = facility;
	}
	
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getFacility() {
		return facility;
	}
	public void setFacility(String facility) {
		this.facility = facility;
	}
	
	
}
