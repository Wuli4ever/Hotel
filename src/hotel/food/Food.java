package hotel.food;

public class Food {
	private int id;
	private String name;
	private double normal;
	private double now;
	private int number=0;
	
	
	public Food() {}
	public Food(String name,double normal,double now) {
		this.name = name;
		this.normal = normal;
		this.now = now;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getNormal() {
		return normal;
	}
	public void setNormal(double normal) {
		this.normal = normal;
	}
	public double getNow() {
		return now;
	}
	public void setNow(double now) {
		this.now = now;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	
	
}
