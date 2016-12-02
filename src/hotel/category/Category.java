package hotel.category;

public class Category {
	private int id;
	private String name;
	private int area;
	private String network;
	private String bed;
	private double price;
	private double deposit;
	
	public Category () {
		
	}
	
	public Category(String name,String network,String bed,int area,double price,double deposit) {
		 this.name = name;
		 this.bed=bed;
		 this.area = area;
		 this.network = network;
		 this.price = price;
		 this.deposit = deposit;
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

	public int getArea() {
		return area;
	}

	public void setArea(int area) {
		this.area = area;
	}

	public String getNetwork() {
		return network;
	}

	public void setNetwork(String network) {
		this.network = network;
	}

	public String getBed() {
		return bed;
	}

	public void setBed(String bed) {
		this.bed = bed;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public double getDeposit() {
		return deposit;
	}

	public void setDeposit(double deposit) {
		this.deposit = deposit;
	}
	
	
}
