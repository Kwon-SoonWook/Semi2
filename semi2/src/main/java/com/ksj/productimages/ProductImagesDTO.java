package com.ksj.productimages;

public class ProductImagesDTO {
	private String productImagesId;
	private int productId;
	
	public ProductImagesDTO() {
		// TODO Auto-generated constructor stub
	}

	public ProductImagesDTO(String productImagesId, int productId) {
		super();
		this.productImagesId = productImagesId;
		this.productId = productId;
	}

	public String getProductImagesId() {
		return productImagesId;
	}

	public void setProductImagesId(String productImagesId) {
		this.productImagesId = productImagesId;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}
}
