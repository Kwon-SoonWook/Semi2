package com.ksj.favoriteproducts;

import java.util.*;

import com.ksj.product.ProductDTO;
import com.ksj.review.ReviewDTO;

import java.sql.*;

public class FavoriteProductsDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public int addFavoriteProducts(FavoriteProductsDTO dto) {
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			String sql = "insert into favorite_products values(?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getUser_id());
			ps.setInt(2, dto.getProducts_id());
			ps.setInt(3, dto.getIs_valid());
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
	public int updateFavoriteProducts(FavoriteProductsDTO dto) {
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			String sql = "update favorite_products set is_valid=? where products_id=? and user_id = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, dto.getIs_valid());
			ps.setInt(2, dto.getProducts_id());
			ps.setString(3, dto.getUser_id());
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
