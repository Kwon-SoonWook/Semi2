package com.ksj.bbs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CommentDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	
	public void deletecmt(String cmtid) {
		try {
			conn  = com.ksj.db.ConnectionDB.getConn();
			
			String sql = "delete bbs_comment where bbs_comment_idx = ? ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, cmtid);
			
			int count = ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				ps.close();
				conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	
	public int commentTotal(int idx) {
		try {
			conn  = com.ksj.db.ConnectionDB.getConn();
			
			String sql = "select count(bbs_idx) from bbs_comment where bbs_idx = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, idx);
			rs=ps.executeQuery();
			
			int count = 0;
			if(rs.next()) {
				count = rs.getInt(1);
			}
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
