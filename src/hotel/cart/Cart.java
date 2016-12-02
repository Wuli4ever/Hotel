package hotel.cart;

import java.util.*;

public class Cart {
	List<CartItem> items = new ArrayList<CartItem>();
	private int id;
	
	private double totalprice;
	
	private static Cart cart = null;
	
	private Cart() {}
	
	public static Cart getCart() {
		if(cart == null) {
			cart = new Cart();
		}
		return cart;
	}
	
	public List<CartItem> getItems() {
		return items;
	}

	public void setItems(List<CartItem> items) {
		this.items = items;
	}

	public void add(CartItem item) {
		for(int i=0;i<items.size();i++) {
			if(items.get(i).getFid()==item.getFid()) {
				items.get(i).setCount(items.get(i).getCount()+item.getCount());
				return;
			}
		}
		items.add(item);
	}
	
	public double getTotalprice() {
		totalprice = 0.0;
		for(int i=0;i<items.size();i++) {
			CartItem item = items.get(i);
			totalprice+=item.getPrice()*item.getCount();
		}
		return totalprice;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

}
