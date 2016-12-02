package hotel.operator;

public class Operator {
	private int opeid;
	private String account;
	private String password;
	private String name;
	
	public Operator() {}
	
	public Operator(int opeid,String account,String password,String name) {
		this.opeid = opeid;
		this.account = account;
		this.password = password;
		this.name = name;
	}
	
	public int getOpeid() {
		return opeid;
	}
	public void setOpeid(int opeid) {
		this.opeid = opeid;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
}
