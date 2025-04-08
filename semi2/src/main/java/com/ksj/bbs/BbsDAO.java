package com.ksj.bbs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

public class BbsDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public ArrayList<BbsDTO> bbsList() {
		try {
			conn = com.ksj.db.DB.getConn();
			
			String sql = "select * from bbs order by create_date desc";
			
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			ArrayList<BbsDTO> arr = new ArrayList<BbsDTO>();
			
			while(rs.next()) {
				int idx = rs.getInt("bbs_idx");
				String id = rs.getString("bbs_id");
				String title = rs.getString("title");
				String content = rs.getString("content");
				int view_cnt = rs.getInt("view_cnt");
				Date create_date = rs.getDate("create_date");
				Date update_date = rs.getDate("update_date");
				int bbs_div = rs.getInt("bbs_div");
				String image = rs.getString("bbs_image");
				
				BbsDTO dto = new BbsDTO(idx, id, title, content, view_cnt, create_date, update_date, bbs_div,image);
				arr.add(dto);
			}
			return arr;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				rs.close();
				ps.close();
				conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		
	}
	
	public int bbsUpload(BbsDTO dto, String id) {
		try {
			conn = com.ksj.db.DB.getConn();
			
			String sql = "insert into bbs values(bbs_comment_idx.nextval,?,?,?,?,sysdate,sysdate,?)";
			ps= conn.prepareStatement(sql);
			
			ps.setString(1, id);
			ps.setString(2, dto.getTitle());
			ps.setString(3, dto.getContent());
			ps.setInt(4, dto.getView_cnt());
			ps.setInt(5, dto.getBbs_div());
			
			int result = ps.executeUpdate();
			return result;
			
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
	
	public ArrayList<BbsDTO> findBbs(String select, String input) {
		try {
			conn = com.ksj.db.DB.getConn();
			String sql = "";
			
			switch(select) {
			case "0": 
				sql = "select * from bbs";
				ps = conn.prepareStatement(sql);
				
				break;
			case "1":
				sql = "select * from bbs where bbs_id = ?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, input);
				break;
				
			case "2":
				sql = "select * from bbs where title = ?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, input);
				break;
			
			}
			
			rs = ps.executeQuery();
			ArrayList<BbsDTO> arr = new ArrayList<BbsDTO>();
			while(rs.next()) {
				int idx = rs.getInt("bbs_idx");
				String id = rs.getString("bbs_id");
				String title = rs.getString("title");
				String content = rs.getString("content");
				int view_cnt = rs.getInt("view_cnt");
				Date create_date = rs.getDate("create_date");
				Date update_date = rs.getDate("update_date");
				int bbs_div = rs.getInt("bbs_div");
				String image = rs.getString("bbs_image");
				
				BbsDTO dto = new BbsDTO(idx, id, title, content, view_cnt, create_date, update_date, bbs_div,image);
				arr.add(dto);
			}
			
			return arr;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				rs.close();
				ps.close();
				conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	
	public ArrayList<BbsDTO> showContent(int idx) {
		try {
			conn = com.ksj.db.DB.getConn();
			
			String sql = "select * from bbs where bbs_idx = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, idx);
			
			rs = ps.executeQuery();
			
			ArrayList<BbsDTO> arr = new ArrayList<BbsDTO>();
			
			if(rs.next()) {
			String title = rs.getString("title");
			String id = rs.getString("bbs_id");
			String content = rs.getString("content");
			int view = rs.getInt("view_cnt");
			Date create_date = rs.getDate("create_date");
			Date update_date = rs.getDate("update_date");
			int div = rs.getInt("bbs_div");
			String image = rs.getString("bbs_image");
			
			BbsDTO dto = new BbsDTO(idx, id, title, content, view, create_date, update_date, div,image);
			arr.add(dto);
			}
			
			return arr;
			} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				rs.close();
				ps.close();
				conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
}
