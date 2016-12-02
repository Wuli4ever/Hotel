package hotel.user;

import java.util.*;

public interface UserDAO {
	void save(User u);
	void deleteById(long id);
	List<User> getUsers();
	User getUserById(long id);
	void UpdateUser(long idcard,String addr,String password,long phone);
	void addVip(User u,int level);
	List<Vip> getAllVip();
	Vip getVipById(long idcard);
	boolean checkUser(long idcard,String account);
}
