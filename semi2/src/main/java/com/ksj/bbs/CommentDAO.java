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
}
