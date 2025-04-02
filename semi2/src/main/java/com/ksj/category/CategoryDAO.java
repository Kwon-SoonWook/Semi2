package com.ksj.category;

import java.util.*;
import java.sql.*;

public class CategoryDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public ArrayList<CategoryDTO> categoryList(){
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			String sql = "select * from category order by category_id desc";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			ArrayList<CategoryDTO> arr = new ArrayList<CategoryDTO>();
			while(rs.next()) {
				int categoryId = rs.getInt("category_id");
				String categoryName = rs.getString("category_name");
				CategoryDTO dto = new CategoryDTO(categoryId, categoryName);
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
