package hotel.food;

import java.io.File;
import java.util.List;

public class FoodMgr {
	private static FoodMgr mgr = null;
	private FoodDAO dao = new FoodMySqlDAO();
	
	private FoodMgr() {}
	
	public static FoodMgr getMgr() {
		if(mgr == null) {
			mgr = new FoodMgr();
		}
		return mgr;
	}
	
	public void DeletePhoto(int id) {
		String path = "D:/apache-tomcat-6.0.14/apache-tomcat-6.0.14/webapps/Hotel/photo/"+id+"food.jpg";
		File f = new File(path);
		//System.out.println("success");
		f.delete();
	}
	public void add(Food f) {
		//System.out.println("aaa");
		dao.add(f);
	}
	
	public List<Food> getFoods() {
		return dao.getFoods();
	}
	
	public Food getFoodById(int id) {
		return dao.getFoodById(id);
	}
	public void Update(Food f) {
		dao.Update(f);
	}
}
