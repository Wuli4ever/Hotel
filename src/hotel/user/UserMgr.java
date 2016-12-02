package hotel.user;

import java.util.*;

public class UserMgr {
	private static UserMgr mgr=null;
	private UserDAO dao = new UserMysqlDAO();
	
	private UserMgr() {}
	
	public static UserMgr getMgr() {
		if(mgr == null) {
			mgr = new UserMgr();
		}
		return mgr;
	}
	
	public void save(User u) {
		dao.save(u);
	}
	
	public boolean checkUser(long idcard, String account) {
		return dao.checkUser(idcard, account);
	}
	
	public List<User> getUsers() {
		return dao.getUsers();
	}
	
	public Vip getVipById(long idcard) {
		return dao.getVipById(idcard);
	}
	
	public User getUserById(long id) {
		return dao.getUserById(id);
	}
	
	public void addVip(User u, int level) {
		dao.addVip(u, level);
	}
	
	public void UpdateUser(long idcard, String addr, String password, long phone) {
		dao.UpdateUser(idcard, addr, password, phone);
	}
	
	public List<Vip> getAllVip() {
		return dao.getAllVip();
	}
} 
