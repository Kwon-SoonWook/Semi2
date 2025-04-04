package com.ksj.productscomment;

public class ProductsCommentDTO {
    private int products_comment_idx;
    private int products_id;
    private String comment_content;
    private String frist_comment;
    private int ref;//대댓글
    private int lev;
    private int sunbun;
    
    public ProductsCommentDTO() {
		// TODO Auto-generated constructor stub
	}

	public ProductsCommentDTO(int products_comment_idx, int products_id, String comment_content, String frist_comment, int ref, int lev,
			int sunbun) {
		super();
		this.products_comment_idx = products_comment_idx;
		this.products_id = products_id;
		this.comment_content = comment_content;
		this.frist_comment = frist_comment;
		this.ref = ref;
		this.lev = lev;
		this.sunbun = sunbun;
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

	public String getFrist_comment() {
		return frist_comment;
	}

	public void setFrist_comment(String frist_comment) {
		this.frist_comment = frist_comment;
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

}
