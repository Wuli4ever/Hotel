package hotel.book;

import java.sql.*;

public class Book {
	private int id;
	private long idcard;
	private int cid;
	private Timestamp checkin;
	private Timestamp checkout;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public long getIdcard() {
		return idcard;
	}
	public void setIdcard(long idcard) {
		this.idcard = idcard;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public Timestamp getCheckin() {
		return checkin;
	}
	public void setCheckin(Timestamp checkin) {
		this.checkin = checkin;
	}
	public Timestamp getCheckout() {
		return checkout;
	}
	public void setCheckout(Timestamp checkout) {
		this.checkout = checkout;
	}
	
	public void setCheckin(String checkin) {
		this.checkin=Timestamp.valueOf(checkin+" 00:00:00");
	}
	
	public Timestamp getCheckin(String checkin) {
		return Timestamp.valueOf(checkin+" 00:00:00");
	}
	
	public void setCheckout(String checkout) {
		this.checkout=Timestamp.valueOf(checkout+" 00:00:00");
	}
}
