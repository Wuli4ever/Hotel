package hotel.food;

import java.util.*;

public interface FoodDAO {
	void add(Food f);
	List<Food> getFoods();
	Food getFoodById(int id);
	void Update(Food f);
	
}
