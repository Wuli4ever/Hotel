package hotel.item;

import java.util.*;

public class ItemMgr {
	private static ItemMgr mgr = null;
	private ItemDAO dao = new ItemMySqlDAO();
	
	private ItemMgr() {}
	
	public static ItemMgr getMgr() {
		if(mgr == null) {
			mgr = new ItemMgr();
		}
		return mgr;
	}
	
	public void save(Item item) {
		dao.save(item);
	}
	
	public List<Item> getItems() {
		return dao.getItems();
	}
}
