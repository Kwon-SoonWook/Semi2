package com.ksj.content;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;

public class ProductDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public ProductDAO() {
		// TODO Auto-generated constructor stub
	}
	
	public ArrayList<ProductDTO> productList(int select, String input){
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			String sql = "";
			switch(select) {
			case 0:
				sql = "select * from products order by products_id desc";
				ps = conn.prepareStatement(sql);
				break;
			case 1:
				sql = "select * from products where title like ? order by products_id desc";
				ps = conn.prepareStatement(sql);
				ps.setString(1, "%"+input+"%");
				break;
			case 2:
				sql = "select * from products where seller_id like ? order by products_id desc";
				ps = conn.prepareStatement(sql);
				ps.setString(1, "%"+input+"%");
			}
			rs = ps.executeQuery();
			ArrayList<ProductDTO> arr = new ArrayList<ProductDTO>();
			while(rs.next()) {
				int products_id = rs.getInt("products_id");
				int category_id = rs.getInt("category_id");
				String buyer_id = rs.getString("buyer_id");
				String seller_id = rs.getString("seller_id");
				int price = rs.getInt("price");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String location = rs.getString("location");
				int trade_state = rs.getInt("trade_state");
				int bbs_state = rs.getInt("bbs_state");
				String thumb_image = rs.getString("thumb_image");
				int view_cnt = rs.getInt("view_cnt");
				java.sql.Date create_date = rs.getDate("create_date");
				java.sql.Date update_date = rs.getDate("update_date");
				String image_uri = rs.getString("image_uri");
				ProductDTO dto = new ProductDTO(products_id, category_id, buyer_id, seller_id, price, title, content, location, trade_state, bbs_state, thumb_image, view_cnt, create_date, update_date, image_uri);
				arr.add(dto);
			}
			return arr;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				if(rs != null) rs.close();
				if(ps != null) ps.close();
				if(conn != null) conn.close();
			}catch(Exception e2) {
				
			}
		}	
	}
	
	public int productDelete(String products_id) {
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			String sql = "delete from products where products_id = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, products_id);
			int count = ps.executeUpdate();
			return count;
		}catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			}catch(Exception e2) {
				
			}
		}
	}
	
	public int getTodayProduct() {
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			String sql = "select count(*) from products where to_char(create_date, 'yy/mm/dd') = to_char(sysdate, 'yy/mm/dd')";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			int count = 0;
			if(rs.next()) {
				count = rs.getInt(1);
			}
			return count;
		}catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			}catch(Exception e2) {
				
			}
		}
	}
}
