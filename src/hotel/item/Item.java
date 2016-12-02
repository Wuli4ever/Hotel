package hotel.item;

import java.sql.*;
import java.util.Calendar;

public class Item {
	private int id;
	private int opeid;
	private int rid;
	private Timestamp checkin;
	private Timestamp checkout;
	private double money;
	
	public Item() {}
	public Item(int id,int opeid,int rid,Timestamp checkin,Timestamp checkout,double money) {
		this.id=id;
		this.opeid=opeid;
		this.rid=rid;
		this.checkin=checkin;
		this.checkout=checkout;
		this.money=money;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getOpeid() {
		return opeid;
	}
	public void setOpeid(int opeid) {
		this.opeid = opeid;
	}
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
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
	public double getMoney() {
		return money;
	}
	public void setMoney(double money) {
		this.money = money;
	}
}
