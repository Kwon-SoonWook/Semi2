package com.ksj.productscomment;

public class ProductsCommentDTO {
    private int products_comment_idx;
    private int products_id;
    private String buyer_id;
    private String seller_id;
    private String comment_content;
    private int ref;//대댓글
    private int lev;
    private int sunbun;
    private int comment_div;
    
    public ProductsCommentDTO() {
		// TODO Auto-generated constructor stub
	}


	public ProductsCommentDTO(int products_comment_idx, int products_id, String buyer_id, String seller_id,
			String comment_content, int ref, int lev, int sunbun, int comment_div) {
		super();
		this.products_comment_idx = products_comment_idx;
		this.products_id = products_id;
		this.buyer_id = buyer_id;
		this.seller_id = seller_id;
		this.comment_content = comment_content;
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
