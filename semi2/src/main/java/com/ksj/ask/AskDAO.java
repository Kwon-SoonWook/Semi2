package com.ksj.ask;
import java.sql.*;
import java.util.*;

public class AskDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public AskDAO() {
		// TODO Auto-generated constructor stub
	}
	
	/**마지막 ref 구하기 메서드*/
	public int getMaxRef() {
		try {
			String sql = "select max(ref) from ask";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			int ref = 0;
			if(rs.next()) {
				ref = rs.getInt(1);
			}
			return ref;
		}catch(Exception e) {
			e.printStackTrace();
			return 0;
		}finally {
			try {
				if(rs != null) rs.close();
				if(ps != null) ps.close();
			}catch(Exception e2) {
				
			}
		}
	}
	
	/**사용자 문의글 작성 메서드*/
	public int askWrite(AskDTO dto) {
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			int ref = getMaxRef();
			String sql = "insert into ask values(ask_idx.nextval,?,?,?,0,sysdate,?,?,0,0)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getAsk_user_id());
			ps.setString(2, dto.getAsk_title());
			ps.setString(3, dto.getAsk_content());
			ps.setString(4, dto.getAsk_writer());
			ps.setInt(5, ref+1);
			int count = ps.executeUpdate();
			return count;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps != null) ps.close();
				if(conn != null) conn.close();
			}catch(Exception e2) {
				
			}
		}
	}
	

	/**사용자 페이지 문의함 출력 메서드*/
	public ArrayList<AskDTO> userAskList(String ask_writer){
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			String sql = "select * from ask where ask_writer=? order by ref desc, sunbun asc";
			ps = conn.prepareStatement(sql);
			ps.setString(1, ask_writer);
			rs = ps.executeQuery();
			ArrayList<AskDTO> arr = new ArrayList<AskDTO>();
			while(rs.next()) {
				int ask_id = rs.getInt("ask_id");
				String ask_user_id = rs.getString("ask_user_id");
				String ask_title = rs.getString("ask_title");
				String ask_content = rs.getString("ask_content");;
				int ask_type = rs.getInt("ask_type");
				java.sql.Date ask_date = rs.getDate("ask_date");
				int ref = rs.getInt("ref");
				int lev = rs.getInt("lev");;
				int sunbun = rs.getInt("sunbun");
				AskDTO dto = new AskDTO(ask_id, ask_user_id, ask_title, ask_content, ask_type, ask_date, ask_writer, ref, lev, sunbun);
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
	
	
	/**관리자 페이지 문의함 출력 메서드*/
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
				String ask_title = rs.getString("ask_title");
				String ask_content = rs.getString("ask_content");;
				int ask_type = rs.getInt("ask_type");
				java.sql.Date ask_date = rs.getDate("ask_date");
				String ask_writer = rs.getString("ask_writer");
				int ref = rs.getInt("ref");
				int lev = rs.getInt("lev");;
				int sunbun = rs.getInt("sunbun");
				AskDTO dto = new AskDTO(ask_id, ask_user_id, ask_title, ask_content, ask_type, ask_date, ask_writer, ref, lev, sunbun);
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
	
	/**관리자 페이지 문의글 보기 메서드*/
	public AskDTO askContent(int ask_id) {
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			String sql = "select * from ask where ask_id = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, ask_id);
			rs = ps.executeQuery();
			if(rs.next()) {
				String ask_user_id = rs.getString("ask_user_id");
				String ask_title = rs.getString("ask_title");
				String ask_content = rs.getString("ask_content");;
				int ask_type = rs.getInt("ask_type");
				java.sql.Date ask_date = rs.getDate("ask_date");
				String ask_writer = rs.getString("ask_writer");
				int ref = rs.getInt("ref");
				int lev = rs.getInt("lev");;
				int sunbun = rs.getInt("sunbun");
				AskDTO dto = new AskDTO(ask_id, ask_user_id, ask_title, ask_content, ask_type, ask_date, ask_writer, ref, lev, sunbun);
				return dto;
			}else {
				return null;
			}
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
	
	/**관리자 페이지 문의답변시 sunbun업데이트 메서드*/
	public void setSunUpdate(int ref, int sunbun) {
		try {
			String sql = "update ask set sunbun=sunbun+1 where ref=? and sunbun>=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, ref);
			ps.setInt(2, sunbun);
			ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps != null) ps.close();
			}catch(Exception e2) {
				
			}
		}
	}
	
	/**관리자 페이지 문의답변글 작성 메서드*/
	public int askReWrite(AskDTO dto) {
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			setSunUpdate(dto.getRef(), dto.getSunbun()+1);
			String sql = "insert into ask values(ask_idx.nextval,?,?,?,2,sysdate,?,?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getAsk_user_id());
			ps.setString(2, dto.getAsk_title());
			ps.setString(3, dto.getAsk_content());
			ps.setString(4, dto.getAsk_writer());
			ps.setInt(5, dto.getRef());
			ps.setInt(6, dto.getLev()+1);
			ps.setInt(7, dto.getSunbun()+1);
			int count = ps.executeUpdate();
			return count;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps != null) ps.close();
				if(conn != null) conn.close();
			}catch(Exception e2) {
				
			}
		}
	}
	
	/**관리자 페이지 문의답변시 해당 문의 미처리에서 처리완료로 변경 메서드*/
	public void askUpdate(int ask_id) {
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			String sql = "update ask set ask_type=1 where ask_id=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, ask_id);
			ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps != null) ps.close();
				if(conn != null) conn.close();
			}catch(Exception e2) {
				
			}
		}
	}
}
