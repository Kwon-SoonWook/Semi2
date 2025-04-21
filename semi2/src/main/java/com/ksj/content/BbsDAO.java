package com.ksj.content;
import java.sql.*;
import java.util.*;
import java.util.Date;

public class BbsDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	public BbsDAO() {
		// TODO Auto-generated constructor stub
	}
	
	public ArrayList<BbsDTO> bbsList(int select, String input){
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			String sql = "";
			switch(select) {
			case 0:
				sql = "select * from bbs order by bbs_idx desc";
				ps = conn.prepareStatement(sql);
				break;
			case 1:
				if(input.equals("0")) {
					sql = "select * from bbs where bbs_div like ? order by bbs_idx desc";
				}else if(input.equals("1")) {
					sql = "select * from bbs where bbs_div like ? order by bbs_idx desc";
				}else if(input.equals("2")) {
					sql = "select * from bbs where bbs_div like ? order by bbs_idx desc";
				}
				ps = conn.prepareStatement(sql);
				ps.setString(1, "%"+input+"%");
				break;
			case 2:
				sql = "select * from bbs where title like ? order by bbs_idx desc";
				ps = conn.prepareStatement(sql);
				ps.setString(1, "%"+input+"%");
				break;
			case 3:
				sql = "select * from bbs where bbs_id like ? order by bbs_idx desc";
				ps = conn.prepareStatement(sql);
				ps.setString(1, "%"+input+"%");
			}
			rs = ps.executeQuery();
			ArrayList<BbsDTO> arr = new ArrayList<BbsDTO>();
			while(rs.next()) {
				int bbs_idx = rs.getInt("bbs_idx");
				String bbs_id = rs.getString("bbs_id");
				String title = rs.getString("title");
				String content = rs.getString("content");
				int view_cnt = rs.getInt("view_cnt");
				java.sql.Date create_date = rs.getDate("create_date");
				java.sql.Date update_date = rs.getDate("update_date");
				int bbs_div = rs.getInt("bbs_div");
				String bbs_image = rs.getString("bbs_image");
				int recommend_like = rs.getInt("recommend_like");
				int recommend_dislike = rs.getInt("recommend_dislike");
				
				BbsDTO dto = new BbsDTO(bbs_idx, bbs_id, title, content, view_cnt, create_date, update_date, bbs_div, bbs_image,recommend_like,recommend_dislike);
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
	
	public ArrayList<BbsDTO> userBbsList(String select, String input, int bbs_div, String sort){
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			String sql = "";
			String orderBy = "";
			
			switch (sort) {
		    case "view":
		        orderBy = "view_cnt DESC"; // 조회순
		        break;
		    case "recommend":
		        orderBy = "recommend_like DESC"; // 추천순
		        break;
		    case null,default:
		    	orderBy = "create_date DESC"; 
		    	break;
		}
			
			
			if(select==null || select.equals("")) {
				sql = "select * from bbs where bbs_div = ? order by " + orderBy;
				
				ps.setInt(1, bbs_div);
				ps = conn.prepareStatement(sql);
			}
			else if(select.equals("title")) {
				sql = "select * from bbs where title like ? and bbs_div = ? order by " + orderBy;
				ps = conn.prepareStatement(sql);
				ps.setString(1, "%"+input+"%");
				ps.setInt(2, bbs_div);
			}else if(select.equals("writer")) {
				sql = "select * from bbs where bbs_id like ? and bbs_div = ? order by " + orderBy;
				ps = conn.prepareStatement(sql);
				ps.setString(1, "%"+input+"%");
				ps.setInt(2, bbs_div);
			}
			rs = ps.executeQuery();
			ArrayList<BbsDTO> arr = new ArrayList<BbsDTO>();
			while(rs.next()) {
				int bbs_idx = rs.getInt("bbs_idx");
				String bbs_id = rs.getString("bbs_id");
				String title = rs.getString("title");
				String content = rs.getString("content");
				int view_cnt = rs.getInt("view_cnt");
				java.sql.Date create_date = rs.getDate("create_date");
				java.sql.Date update_date = rs.getDate("update_date");
				String bbs_image = rs.getString("bbs_image");
				int recommend_like = rs.getInt("recommend_like");
				int recommend_dislike = rs.getInt("recommend_dislike");
				BbsDTO dto = new BbsDTO(bbs_idx, bbs_id, title, content, view_cnt, create_date, update_date, bbs_div, bbs_image,recommend_like,recommend_dislike);
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
	
	public int bbsDelete(String bbs_idx) {
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			String sql = "delete from bbs where bbs_idx = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, bbs_idx);
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
	
	public int getTodayBbs() {
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			String sql = "select count(*) from bbs where to_char(create_date, 'yy/mm/dd') = to_char(sysdate, 'yy/mm/dd')";
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
	public int likeRecommend(String idx) {
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			
			String sql = "update bbs set recommend_like = recommend_like+1 where bbs_idx = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, idx);
			
			int count = ps.executeUpdate();
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				ps.close();
				conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	
	public int dislikeRecommend(String idx) {
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			
			String sql = "update bbs set recommend_dislike = recommend_dislike+1 where bbs_idx = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, idx);
			
			int count = ps.executeUpdate();
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				ps.close();
				conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
}
