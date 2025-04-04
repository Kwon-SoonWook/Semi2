package com.ksj.productscomment;
import java.util.*;
import java.sql.*;

public class ProductsCommentDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	/**판매자 댓글목록보기*/
	public ArrayList<ProductsCommentDTO> productsCommentList(){
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			String sql = "select * from products_comment ";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			ArrayList<ProductsCommentDTO> arr = new ArrayList<ProductsCommentDTO>();
			while(rs.next()) {
				int productsCommentIdx = rs.getInt("products_comment_idx");
				int productsId = rs.getInt("products_id");
				String fristComment = rs.getString("frist_comment");
				String commentContent = rs.getString("comment_content");
				int ref = rs.getInt("ref");
				int lev = rs.getInt("lev");
				int sunbun = rs.getInt("sunbun");
				ProductsCommentDTO dto = new ProductsCommentDTO(productsId, productsId, fristComment, commentContent, ref, lev, sunbun);
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
	
	/**댓글작성자 댓글목록보기*/
	public ArrayList<ProductsCommentDTO> buyerProductsCommentList(String fristComment){
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			String sql = "select * from products_comment where frist_comment=? ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, fristComment);
			rs = ps.executeQuery();
			ArrayList<ProductsCommentDTO> arr = new ArrayList<ProductsCommentDTO>();
			while(rs.next()) {
				int productsCommentIdx = rs.getInt("products_comment_idx");
				int productsId = rs.getInt("products_id");
				String commentContent = rs.getString("comment_content");
				int ref = rs.getInt("ref");
				int lev = rs.getInt("lev");
				int sunbun = rs.getInt("sunbun");
				ProductsCommentDTO dto = new ProductsCommentDTO(productsId, productsId, fristComment, commentContent, ref, lev, sunbun);
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
