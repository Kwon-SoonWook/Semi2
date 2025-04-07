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
				
				BbsDTO dto = new BbsDTO(idx, id, title, content, view_cnt, create_date, update_date, bbs_div);
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
}
