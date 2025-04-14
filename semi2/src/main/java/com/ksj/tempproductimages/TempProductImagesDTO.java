package com.ksj.tempproductimages;

public class TempProductImagesDTO {
    private String temp_product_images_id; 
    private String temp_product_id;
    
    public TempProductImagesDTO() {
		// TODO Auto-generated constructor stub
	}
    
	public TempProductImagesDTO(String temp_product_images_id, String temp_product_id) {
		super();
		this.temp_product_images_id = temp_product_images_id;
		this.temp_product_id = temp_product_id;
	}

	public String getTemp_product_images_id() {
		return temp_product_images_id;
	}

	public void setTemp_product_images_id(String temp_product_images_id) {
		this.temp_product_images_id = temp_product_images_id;
	}

	public String getTemp_product_id() {
		return temp_product_id;
	}

	public void setTemp_product_id(String temp_product_id) {
		this.temp_product_id = temp_product_id;
	}

}
