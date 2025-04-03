package com.ksj.product;

import java.util.*;
import java.sql.*;
import java.sql.Date;

public class ProductDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	public static final int ERROR=-1;

	
	public int productInsert(ProductDTO dto) {
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			String sql = "insert into products values(products_idx.nextval,?,?,?,?,?,?,?,?,?,?,?,sysdate,sysdate,?)";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, dto.getCategory_id());
			ps.setString(2, dto.getBuyer_id());
			ps.setString(3, dto.getSeller_id());
			ps.setInt(4, dto.getPrice());
			ps.setString(5, dto.getTitle());
			ps.setString(6, dto.getContent());
			ps.setString(7, dto.getLocation());
			ps.setInt(8, dto.getTrade_state());
			ps.setInt(9, dto.getBbs_state());
			ps.setString(10, dto.getThumb_image());
			ps.setInt(11, dto.getView_cnt());
			ps.setString(12, dto.getImage_uri());
			int result = ps.executeUpdate();
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {}
		}
	}
	public int searchProductIdx() {
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			String sql = "select max(products_id) from products";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			int productsId=0;
			if(rs.next()) {
				productsId= rs.getInt(1);
			}
			return productsId;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();				
			} catch (Exception e2) {}
		}
	}
	public ProductDTO ProductList(int productId) {
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			String sql = "select * from products where products_id = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, productId);
			ProductDTO dto = null;
			while(rs.next()) {
				int products_id = rs.getInt("products_id");
				int category_id = rs.getInt("category_id");
				String buyer_id = rs.getString("buyer_id");
				String seller_id = rs.getString("seller_id");
				int price = rs.getInt("price");
				String title = rs.getString("title");
				String content =rs.getString("content");
				String location = rs.getString("location");
				int trade_state = rs.getInt("trade_state");
				int bbs_state =rs.getInt("bbs_state");
				String thumb_image = rs.getString("thumb_image");
				int view_cnt = rs.getInt("view_cnt");
				java.sql.Date create_date = rs.getDate("create_date");
				java.sql.Date update_date = rs.getDate("update_date");
				String image_uri = rs.getString("image_uri");
				dto = new ProductDTO(products_id, category_id, buyer_id, seller_id, price, title, content, location, trade_state, bbs_state, thumb_image, view_cnt, create_date, update_date, image_uri);
			}
			return dto;
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
	//mypage-saleList
	public ArrayList<ProductDTO> saleList(String sellerid){
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			String sql = "select * from products where seller_id = ? order by create_date desc";
			ps = conn.prepareStatement(sql);
			ps.setString(1, sellerid);
			rs = ps.executeQuery();
			ArrayList<ProductDTO> arr = new ArrayList<ProductDTO>();
			while(rs.next()) {
				int products_id = rs.getInt("products_id");
				int category_id = rs.getInt("category_id");
				String buyer_id = rs.getString("buyer_id");
				String seller_id = rs.getString("seller_id");
				int price = rs.getInt("price");
				String title = rs.getString("title");
				String content =rs.getString("content");
				String location = rs.getString("location");
				int trade_state = rs.getInt("trade_state");
				int bbs_state =rs.getInt("bbs_state");
				String thumb_image = rs.getString("thumb_image");
				int view_cnt = rs.getInt("view_cnt");
				java.sql.Date create_date = rs.getDate("create_date");
				java.sql.Date update_date = rs.getDate("update_date");
				String image_uri = rs.getString("image_uri");
				ProductDTO dto = new ProductDTO(products_id, category_id, buyer_id, seller_id, price, title, content, location, trade_state, bbs_state, thumb_image, view_cnt, create_date, update_date, image_uri);
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
}
