package hotel.user;

public class User {
	private long idcard;
	private String account;
	private String password;
	private String name;
	private String sex;
	private long phone;
	private String addr;
	
	public User() {}
	
	public User(long idcard,String account,String password,String name,String sex,long phone,String addr) {
		this.idcard = idcard;
		this.account = account;
		this.password = password;
		this.name = name;
		this.sex = sex;
		this.phone = phone;
		this.addr = addr;
	}
	
	public long getIdcard() {
		return idcard;
	}
	public void setIdcard(long idcard) {
		this.idcard = idcard;
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
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public long getPhone() {
		return phone;
	}
	public void setPhone(long phone) {
		this.phone = phone;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	
}
