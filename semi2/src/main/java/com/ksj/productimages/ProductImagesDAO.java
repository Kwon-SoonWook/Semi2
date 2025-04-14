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
	/**해당하는 이미지 아이디를 제외한 나머지를 가져오는 메소드*/
	public ArrayList<ProductImagesDTO> ProductImagesList(int productId,ArrayList<String> product_images_id){
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			String placeholders = String.join(",", product_images_id.stream().map(m->"?").toList());
			String sql = "select * from product_images where product_id = ? and product_images_id not in ("+placeholders+")";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, productId);
			for(int i=0;i<product_images_id.size();i++) {
				ps.setString(i+2, product_images_id.get(i));
			}
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
	/**물품아이디에 저장되어있는 이미지 불러온뒤 변경할때 삭제하는 메서드*/
	public int deleteLoadProductImages(int productId,String product_images_id) {
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			String sql = "delete from product_images where product_id = ? and product_images_id = ? ";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, productId);
			ps.setString(2, product_images_id);
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
