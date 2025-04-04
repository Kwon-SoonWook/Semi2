package com.ksj.favoriteproducts;

public class FavoriteProductsDTO {
	private String user_id;
	private int products_id;
	private int is_valid;
	
	public FavoriteProductsDTO() {
		// TODO Auto-generated constructor stub
	}

	public FavoriteProductsDTO(String user_id, int products_id, int is_valid) {
		super();
		this.user_id = user_id;
		this.products_id = products_id;
		this.is_valid = is_valid;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getProducts_id() {
		return products_id;
	}

	public void setProducts_id(int products_id) {
		this.products_id = products_id;
	}

	public int getIs_valid() {
		return is_valid;
	}

	public void setIs_valid(int is_valid) {
		this.is_valid = is_valid;
	}
	
}
