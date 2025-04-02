package com.ksj.product;

import java.util.*;
import java.sql.*;

public class ProductDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	public static final int ERROR=-1;

	
	public int productInsert(ProductDTO dto) {
		try {
			conn = com.ksj.connectionpull.SoonDB.getConn();
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
			conn = com.ksj.connectionpull.SoonDB.getConn();
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
}
