package com.ksj.productimages;
import java.util.*;
import java.sql.*;
public class ProductImagesDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
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
}
