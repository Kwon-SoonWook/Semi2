package com.ksj.tempproduct;

public class TempProductDTO {
    private String id;
    private String title;
    private int category_id;
    private String content;
    private int price;
    private String wish_location;
    
    public TempProductDTO() {
		// TODO Auto-generated constructor stub
	}

	public TempProductDTO(String id, String title, int category_id, String content, int price, String wish_location) {
		super();
		this.id = id;
		this.title = title;
		this.category_id = category_id;
		this.content = content;
		this.price = price;
		this.wish_location = wish_location;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getCategory_id() {
		return category_id;
	}

	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getWish_location() {
		return wish_location;
	}

	public void setWish_location(String wish_location) {
		this.wish_location = wish_location;
	}
    

}
