package hotel.category;

import java.util.*;

public interface CategoryDAO {
	void save(Category c);
	List<Category> getCategories();
	Category getCategoryById(int id);
	void CategoryUpdate(int id,String name,int area,String network,String bed,double price,double deposit);
	List<Category> getLatestCategories();
	List<Category> getLatestCategories1();
}
