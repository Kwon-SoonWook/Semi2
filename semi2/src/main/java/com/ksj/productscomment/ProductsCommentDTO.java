package com.ksj.productscomment;
import java.sql.*;

public class ProductsCommentDTO {
    private int products_comment_idx;
    private int products_id;
    private String buyer_id;
    private String seller_id;
    private String comment_content;
    private java.sql.Timestamp create_date;
    private int ref;//대댓글
    private int lev;
    private int sunbun;
    private int comment_div;
    
    public ProductsCommentDTO() {
		// TODO Auto-generated constructor stub
	}

	public ProductsCommentDTO(int products_comment_idx, int products_id, String buyer_id, String seller_id,
			String comment_content, java.sql.Timestamp create_date, int ref, int lev, int sunbun, int comment_div) {
		super();
		this.products_comment_idx = products_comment_idx;
		this.products_id = products_id;
		this.buyer_id = buyer_id;
		this.seller_id = seller_id;
		this.comment_content = comment_content;
		this.create_date = create_date;
		this.ref = ref;
		this.lev = lev;
		this.sunbun = sunbun;
		this.comment_div = comment_div;
	}

	public int getProducts_comment_idx() {
		return products_comment_idx;
	}

	public void setProducts_comment_idx(int products_comment_idx) {
		this.products_comment_idx = products_comment_idx;
	}

	public int getProducts_id() {
		return products_id;
	}

	public void setProducts_id(int products_id) {
		this.products_id = products_id;
	}

	public String getComment_content() {
		return comment_content;
	}

	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}

	public java.sql.Timestamp getCreate_date() {
		return create_date;
	}

	public void setCreate_date(java.sql.Timestamp create_date) {
		this.create_date = create_date;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getLev() {
		return lev;
	}

	public void setLev(int lev) {
		this.lev = lev;
	}

	public int getSunbun() {
		return sunbun;
	}

	public void setSunbun(int sunbun) {
		this.sunbun = sunbun;
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


	public int getComment_div() {
		return comment_div;
	}


	public void setComment_div(int comment_div) {
		this.comment_div = comment_div;
	}

}
