package com.ksj.product;
import java.util.*;
import java.sql.*;
import java.sql.Date;
public class ProductDTO {
	private int products_id;
	private int category_id;
	private String buyer_id;
	private String seller_id;
	private int price;
	private String title;
	private String content;
	private String location;
	private int trade_state;
	private int bbs_state;
	private String thumb_image;
	private int view_cnt;
	private Date create_date;
	private Date update_date;
	private String image_uri;
	public ProductDTO() {
		// TODO Auto-generated constructor stub
	}

	public ProductDTO(int products_id, int category_id, String buyer_id, String seller_id, int price, String title,
			String content, String location,int trade_state, int bbs_state, String thumb_image, int view_cnt, Date create_date,
			Date update_date, String image_uri) {
		super();
		this.products_id = products_id;
		this.category_id = category_id;
		this.buyer_id = buyer_id;
		this.seller_id = seller_id;
		this.price = price;
		this.title = title;
		this.content = content;
		this.location = location;
		this.trade_state = trade_state;
		this.bbs_state = bbs_state;
		this.thumb_image = thumb_image;
		this.view_cnt = view_cnt;
		this.create_date = create_date;
		this.update_date = update_date;
		this.image_uri = image_uri;
	}

	public int getProducts_id() {
		return products_id;
	}

	public void setProducts_id(int products_id) {
		this.products_id = products_id;
	}

	public int getCategory_id() {
		return category_id;
	}

	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}

	public String getBuyer_id() {
		return buyer_id;
	}

	public void setBuyer_id(String buyer_id) {
		this.buyer_id = buyer_id;
	}

	public String getSeller_id() {
		return seller_id;
	}

	public void setSeller_id(String seller_id) {
		this.seller_id = seller_id;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public int getTrade_state() {
		return trade_state;
	}

	public void setTrade_state(int trade_state) {
		this.trade_state = trade_state;
	}

	public int getBbs_state() {
		return bbs_state;
	}

	public void setBbs_state(int bbs_state) {
		this.bbs_state = bbs_state;
	}

	public String getThumb_image() {
		return thumb_image;
	}

	public void setThumb_image(String thumb_image) {
		this.thumb_image = thumb_image;
	}

	public int getView_cnt() {
		return view_cnt;
	}

	public void setView_cnt(int view_cnt) {
		this.view_cnt = view_cnt;
	}

	public Date getCreate_date() {
		return create_date;
	}

	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}

	public Date getUpdate_date() {
		return update_date;
	}

	public void setUpdate_date(Date update_date) {
		this.update_date = update_date;
	}

	public String getImage_uri() {
		return image_uri;
	}

	public void setImage_uri(String image_uri) {
		this.image_uri = image_uri;
	}
	
}
