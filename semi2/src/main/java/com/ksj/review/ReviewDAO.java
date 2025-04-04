package com.ksj.review;
import java.sql.*;
import java.util.*;

public class ReviewDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	//mypage-피평가자가 작성한 리뷰 리스트
	public ArrayList<ReviewDTO> reviewList(String userid){
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			String sql = "select * from user_review where user_id = ? order by rate desc";
			ps = conn.prepareStatement(sql);
			ps.setString(1, userid);
			rs = ps.executeQuery();
			ArrayList<ReviewDTO> arr = new ArrayList<ReviewDTO>();
			while(rs.next()) {
				String review_id = rs.getString("review_id");
				String usere_id = rs.getString("usere_id");
				String user_id = rs.getString("user_id");
				String products_id = rs.getString("products_id");
				int rate = rs.getInt("rate");
				String review_content = rs.getString("review_content");
				int review_type = rs.getInt("review_type");
				ReviewDTO dto = new ReviewDTO(review_id, usere_id, user_id, products_id, rate, review_content, review_type);
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
