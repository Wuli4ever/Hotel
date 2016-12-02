package hotel.item;

import java.util.*;

public interface ItemDAO {
	void save(Item item);
	List<Item> getItems();
}
