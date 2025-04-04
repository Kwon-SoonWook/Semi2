package com.ksj.review;
import java.sql.*;

public class ReviewDTO {
	private String review_id;
	private String usere_id;
	private String user_id;
	private String products_id;
	private int rate;
	private String review_content;
	private int review_type;
	
	public ReviewDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public ReviewDTO(String review_id, String usere_id, String user_id, String products_id, int rate,
			String review_content, int review_type) {
		super();
		this.review_id = review_id;
		this.usere_id = usere_id;
		this.user_id = user_id;
		this.products_id = products_id;
		this.rate = rate;
		this.review_content = review_content;
		this.review_type = review_type;
	}

	public String getReview_id() {
		return review_id;
	}

	public void setReview_id(String review_id) {
		this.review_id = review_id;
	}

	public String getUsere_id() {
		return usere_id;
	}

	public void setUsere_id(String usere_id) {
		this.usere_id = usere_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getProducts_id() {
		return products_id;
	}

	public void setProducts_id(String products_id) {
		this.products_id = products_id;
	}

	public int getRate() {
		return rate;
	}

	public void setRate(int rate) {
		this.rate = rate;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public int getReview_type() {
		return review_type;
	}

	public void setReview_type(int review_type) {
		this.review_type = review_type;
	}
	
	
}

