package hotel.category;

import java.io.File;
import java.util.*;

public class CategoryMgr {
	
	private static CategoryMgr mgr = null;
	private CategoryMgr() {}
	private CategoryDAO dao = new CategoryMysqlDAO();
	
	public static CategoryMgr getMgr() {
		if(mgr ==null) {
			mgr = new CategoryMgr();
		}
		
		return mgr;
	}
	
	public void save(Category c) {
		dao.save(c);
	}
	
	public void DeletePhoto(int id) {
		String path = "D:/apache-tomcat-6.0.14/apache-tomcat-6.0.14/webapps/Hotel/photo/"+id+".jpg";
		File f = new File(path);
		//System.out.println("success");
		f.delete();
	}
	
	public void CategoryUpdate(int id,String name,int area,String network,String bed,double price,double deposit) {
		dao.CategoryUpdate(id,name,area,network,bed,price,deposit);
	}
	
	public Category getCategoryById(int id) {
		return dao.getCategoryById(id);
	}
	
	public List<Category> getLatestCategories() {
		return dao.getLatestCategories();
	}
	
	public List<Category> getLatestCategories1() {
		return dao.getLatestCategories1();
	}
	
	public List<Category> getCategories() {
		return dao.getCategories();
	}
}
