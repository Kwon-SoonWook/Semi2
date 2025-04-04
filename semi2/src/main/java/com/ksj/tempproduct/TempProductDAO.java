package com.ksj.tempproduct;

import java.util.*;

import com.ksj.productimages.ProductImagesDTO;

import java.sql.*;

public class TempProductDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public int addTempProdcuct(TempProductDTO dto) {
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			String sql = "insert into temp_products values(?,?,?,?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getTitle());
			ps.setInt(3, dto.getCategory_id());
			ps.setString(4, dto.getContent());
			ps.setInt(5, dto.getPrice());
			ps.setString(6, dto.getWish_location());
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
	public int updateTempProdcuct(TempProductDTO dto) {
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			String sql = "update temp_products set title=?, category_id=?, content=?, price=?, wish_location=? where id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getTitle());
			ps.setInt(2, dto.getCategory_id());
			ps.setString(3, dto.getContent());
			ps.setInt(4, dto.getPrice());
			ps.setString(5, dto.getWish_location());
			ps.setString(6, dto.getId());
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
	public TempProductDTO tempProductList(String id) {
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			String sql = "select * from temp_products where id = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			TempProductDTO dto = null;
			if(rs.next()) {
				String title = rs.getString("title")==null?"":rs.getString("title");
				int categoryId = rs.getInt("category_id");
				String content = rs.getString("content")==null?"":rs.getString("content");
				int price = rs.getInt("price");
				String wishLocation = rs.getString("wish_location")==null?"":rs.getString("wish_location");
				dto = new TempProductDTO(id, title, categoryId, content, price, wishLocation);
			}
			return dto;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();				
				if(rs!=null)rs.close();
			} catch (Exception e2) {}
		}
	}
	public int deleteTempProduct(String id) {
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			String sql = "delete from temp_products where id = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
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
