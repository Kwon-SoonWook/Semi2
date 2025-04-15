package com.ksj.review;
import java.sql.*;
import java.util.*;

public class ReviewDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	//mypage-피평가자가 작성한 리뷰 리스트
	public ArrayList<ReviewDTO> ReviewList(String userid){
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
	/**mypage-피평가자가 작성한 리뷰 리스트 게시물수 관련 메서드*/
	public int getReviewCnt(String sid) {
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
	        String sql = "select distinct count(*) from user_review where user_id = ?";
	        ps = conn.prepareStatement(sql);
	        ps.setString(1, sid);
	        rs = ps.executeQuery();
	        rs.next();
	        int count = rs.getInt(1);
	        return count;
		}catch (Exception e) {
			e.printStackTrace();
			return 1;
		}finally {
			try {
				if (rs != null) rs.close();
	            if (ps != null) ps.close();
	            if (conn != null) conn.close();
				
			}catch (Exception e) {
			}
		}
	}
	/**판매자가 작성한 등록한 물품에 후기를 가져오는 메서드*/
	public ReviewDTO getReviewSeller(String usere_id,String products_id) {
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			String sql = "select * from user_review where usere_id= ? and products_id= ? ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, usere_id);
			ps.setString(2, products_id);
			rs = ps.executeQuery();
			ReviewDTO dto = null;
			if(rs.next()) {
				String review_id = rs.getString("review_id");
				String user_id = rs.getString("user_id");
				int rate = rs.getInt("rate");
				String review_content = rs.getString("review_content");
				int review_type = rs.getInt("review_type");
				dto = new ReviewDTO(review_id, usere_id, user_id, products_id, rate, review_content, review_type);
			}
			return dto;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				if (rs != null) rs.close();
	            if (ps != null) ps.close();
	            if (conn != null) conn.close();				
			} catch (Exception e2) {}
		}
	}
	/**해당 리뷰id로 dto값 가져오는 메소드*/
	public ReviewDTO reviewlist(String review_id) {
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			String sql = "select * from user_review where review_id= ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, review_id);
			rs = ps.executeQuery();
			ReviewDTO dto = null;
			if(rs.next()) {
				String usere_id = rs.getString("usere_id");
				String user_id = rs.getString("user_id");
				String products_id = rs.getString("products_id");
				int rate = rs.getInt("rate");
				String review_content = rs.getString("review_content");
				int review_type = rs.getInt("review_type");
				dto = new ReviewDTO(review_id, usere_id, user_id, products_id, rate, review_content, review_type);
			}
			return dto;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				if (rs != null) rs.close();
	            if (ps != null) ps.close();
	            if (conn != null) conn.close();				
			} catch (Exception e2) {}
		}
	}
	/**review에서 리뷰작성 메서드*/
	public int addReview(ReviewDTO dto) {
		try {
			conn=com.ksj.db.ConnectionDB.getConn();
			String sql = "insert into user_review values(review_idx.nextval,?,?,?,?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getUsere_id());
			ps.setString(2, dto.getUser_id());
			ps.setString(3, dto.getProducts_id());
			ps.setInt(4, dto.getRate());
			ps.setString(5, dto.getReview_content());
			ps.setInt(6, dto.getReview_type());
			int result = ps.executeUpdate();
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
	            if (ps != null) ps.close();
	            if (conn != null) conn.close();				
			} catch (Exception e2) {}
		}
	}
	
}
