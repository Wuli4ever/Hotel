package hotel.user;

import java.sql.*;

public class Vip {
	private int id;
	private long idcard;
	private String name;
	private int level;
	private Timestamp rdate;
	
	public Vip() {}
	
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public Timestamp getRdate() {
		return rdate;
	}
	public void setRdate(Timestamp rdate) {
		this.rdate = rdate;
	}
	
	
}
