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

}
