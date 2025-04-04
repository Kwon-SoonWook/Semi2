package com.ksj.productimages;
import java.util.*;
import java.sql.*;
public class ProductImagesDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	/**이미지 추가하기*/
	public int addProductImages(ProductImagesDTO dto) {
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			String sql = "insert into product_images values(?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getProductImagesId());
			ps.setInt(2, dto.getProductId());
			int result = ps.executeUpdate();
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {}
		}
	}
	/**물품아이디에 해당하는 이미지 불러오기*/
	public ArrayList<ProductImagesDTO> ProductImagesList(int productId){
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			String sql = "select * from product_images where product_id = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, productId);
			rs = ps.executeQuery();
			ArrayList<ProductImagesDTO> arr = new ArrayList<ProductImagesDTO>();
			while(rs.next()) {
				String productImagesId = rs.getString("product_images_id");
				ProductImagesDTO dto = new ProductImagesDTO(productImagesId, productId);
				arr.add(dto);
			}
			return arr;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();												
			} catch (Exception e2) {}
		}
	}
	/**물품아이디에 저장되어있는 이미지 삭제하기*/
	public int deleteProductImages(int productId) {
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			String sql = "delete from product_images where product_id = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, productId);
			int result = ps.executeUpdate();
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();																
			} catch (Exception e2) {}
		}
	}

}
