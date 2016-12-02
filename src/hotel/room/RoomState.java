package hotel.room;

import java.sql.*;

public class RoomState {
	private int rid;
	private long idcard;
	private String name;
	private int opeid;
	private double deposit;
	private double usedmoney;
	private Timestamp checkin;
	private Timestamp checkout;
	
	public  RoomState() {}
	public RoomState(int rid,long idcard,String name,int opeid,double deposit,double usedmoney,Timestamp checkin,Timestamp checkout) {
		this.rid = rid;
		this.idcard = idcard;
		this.name = name;
		this.opeid = opeid;
		this.deposit = deposit;
		this.usedmoney = usedmoney;
		this.checkin = checkin;
		this.checkout = checkout;
	}
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
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
	public int getOpeid() {
		return opeid;
	}
	public void setOpeid(int opeid) {
		this.opeid = opeid;
	}
	public double getDeposit() {
		return deposit;
	}
	public void setDeposit(double deposit) {
		this.deposit = deposit;
	}
	public double getUsedmoney() {
		return usedmoney;
	}
	public void setUsedmoney(double usedmoney) {
		this.usedmoney = usedmoney;
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
	
	
}
