package com.ksj.ask;
import java.sql.*;
import java.util.*;

public class AskDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public ArrayList<AskDTO> askList(){
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			String sql = "select * from ask order by ref desc, sunbun asc";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			ArrayList<AskDTO> arr = new ArrayList<AskDTO>();
			while(rs.next()) {
				int ask_id = rs.getInt("ask_id");
				String ask_user_id = rs.getString("ask_user_id");
				String ask_content = rs.getString("ask_content");;
				int ask_type = rs.getInt("ask_type");
				int ref = rs.getInt("ref");
				int lev = rs.getInt("lev");;
				int sunbun = rs.getInt("sunbun");
				AskDTO dto = new AskDTO(ask_id, ask_user_id, ask_content, ask_type, ref, lev, sunbun);
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
}
