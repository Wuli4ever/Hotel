package hotel.android;

public class Car {
	private String type;
	private String color;
	
	public Car() {
		this.color="red";
		this.type="½Î³µ";
	}
	
	public Car(String type,String color) {
		this.color=color;
		this.type=type;
	}
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	
	public static void main(String[] args) {
		Car car1 = new Car();
		Car car2 = new Car("¿¨³µ","blue");
		System.out.println("car1: type "+car1.getType()+"  color:"+car1.getColor());
		System.out.println("car2: type "+car2.getType()+"  color:"+car2.getColor());
	}
}
