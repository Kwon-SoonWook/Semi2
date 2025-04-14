package com.ksj.tempproductimages;
import java.util.*;

import com.ksj.productimages.ProductImagesDTO;

import java.sql.*;
public class TempProductImagesDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;

	/**이미지 추가하기*/
	public int addTempProductImages(TempProductImagesDTO dto) {
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			String sql = "insert into temp_product_images values(?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getTemp_product_images_id());
			ps.setString(2, dto.getTemp_product_id());
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
	/**임시저장 물품아이디에 해당하는 이미지 불러오기*/
	public ArrayList<TempProductImagesDTO> TempProductImagesList(String temp_product_id){
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			String sql = "select * from product_images where temp_product_id = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, temp_product_id);
			rs = ps.executeQuery();
			ArrayList<TempProductImagesDTO> arr = new ArrayList<TempProductImagesDTO>();
			while(rs.next()) {
				String temp_product_images_id = rs.getString("temp_product_images_id");
				TempProductImagesDTO dto = new TempProductImagesDTO(temp_product_images_id, temp_product_id);
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
	/**임시저장에 해당하는 이미지 아이디를 제외한 나머지를 가져오는 메소드*/
	public ArrayList<TempProductImagesDTO> ProductImagesList(String temp_product_id,ArrayList<String> temp_product_images_id){
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			String placeholders = String.join(",", temp_product_images_id.stream().map(m->"?").toList());
			String sql = "select * from temp_product_images where temp_product_id = ? and temp_product_images_id not in ("+placeholders+")";
			ps = conn.prepareStatement(sql);
			ps.setString(1, temp_product_id);
			for(int i=0;i<temp_product_images_id.size();i++) {
				ps.setString(i+2, temp_product_images_id.get(i));
			}
			rs = ps.executeQuery();
			ArrayList<TempProductImagesDTO> arr = new ArrayList<TempProductImagesDTO>();
			while(rs.next()) {
				String tempProductImagesId = rs.getString("temp_product_images_id");
				TempProductImagesDTO dto = new TempProductImagesDTO(tempProductImagesId, temp_product_id);
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
	/**임시저장 물품아이디에 저장되어있는 이미지 삭제하기*/
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
	/**임시저장 물품아이디에 저장되어있는 이미지 불러온뒤 변경할때 삭제하는 메서드*/
	public int deleteLoadProductImages(String temp_product_id,String temp_product_images_id) {
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			String sql = "delete from temp_product_images where temp_product_id = ? and temp_product_images_id = ? ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, temp_product_id);
			ps.setString(2, temp_product_images_id);
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
