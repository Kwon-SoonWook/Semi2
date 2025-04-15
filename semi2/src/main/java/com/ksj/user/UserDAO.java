package com.ksj.user;
import java.sql.*;
import java.util.*;


public class UserDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
//	public int getTotalUser() {
//		try {
//			conn = com.ksj.db.ConnectionDB.getConn();
//			String sql = "select count(*) from user_info";
//			ps = conn.prepareStatement(sql);
//			rs = ps.executeQuery();
//			int result = rs.getInt(1);
//			return result;
//		}catch (Exception e) {
//			e.printStackTrace();
//			return -1;
//		}finally {
//			try {
//				if(rs!=null) rs.close();
//				if(ps!=null) ps.close();
//				if(conn!=null) conn.close();
//			}catch(Exception e2) {
//				
//			}
//		}
//	}
	
	public ArrayList<UserDTO> userList(int select, String input){
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			String sql = "";
			switch(select) {
			case 0:
				sql = "select * from user_info order by create_date desc";
				ps = conn.prepareStatement(sql);
				break;
			case 1:
				sql = "select * from user_info where id like ? order by create_date desc";
				ps = conn.prepareStatement(sql);
				ps.setString(1, "%"+input+"%");
				break;
			case 2:
				sql = "select * from user_info where name like ? order by create_date desc";
				ps = conn.prepareStatement(sql);
				ps.setString(1, "%"+input+"%");
				break;
			case 3:
				sql = "select * from user_info where nickname like ? order by create_date desc";
				ps = conn.prepareStatement(sql);
				ps.setString(1, "%"+input+"%");
			}
			rs = ps.executeQuery();
			ArrayList<UserDTO> arr = new ArrayList<UserDTO>();
			while (rs.next()) {
				String name = rs.getString("name");
				String id = rs.getString("id");
				String pwd = rs.getString("pwd");
				String email = rs.getString("email");
				String nickname = rs.getString("nickname");
				String location = rs.getString("location");
				String profile_uri = rs.getString("profile_uri");
				java.sql.Date create_date = rs.getDate("create_date");
				UserDTO dto = new UserDTO(name, id, pwd, email, nickname, location, profile_uri, create_date);
				arr.add(dto);
			}
			return arr;
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			}catch(Exception e2) {
				
			}
		}
	}
	
	public int userDelete(String id) {
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			String sql = "delete from user_info where id = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
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
	
	public ArrayList<UserDTO> searchUserList(int select, String input){
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			String sql = "select * from user_info order by create_date asc";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			ArrayList<UserDTO> arr = new ArrayList<UserDTO>();
			while (rs.next()) {
				String name = rs.getString("name");
				String id = rs.getString("id");
				String pwd = rs.getString("pwd");
				String email = rs.getString("email");
				String nickname = rs.getString("nickname");
				String location = rs.getString("location");
				String profile_uri = rs.getString("profile_uri");
				java.sql.Date create_date = rs.getDate("create_date");
				UserDTO dto = new UserDTO(name, id, pwd, email, nickname, location, profile_uri, create_date);
				arr.add(dto);
			}
			return arr;
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			}catch(Exception e2) {
				
			}
		}
	}
	public ArrayList<UserDTO> myinfo(String sid){
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			String sql = "select * from user_info where id = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, sid);
			rs = ps.executeQuery();
			ArrayList<UserDTO> arr = new ArrayList<UserDTO>();
			while (rs.next()) {
				String name = rs.getString("name");
				String id = rs.getString("id");
				String pwd = rs.getString("pwd");
				String email = rs.getString("email");
				String nickname = rs.getString("nickname");
				String location = rs.getString("location");
				String profile_uri = rs.getString("profile_uri");
				java.sql.Date create_date = rs.getDate("create_date");
				UserDTO dto = new UserDTO(name, id, pwd, email, nickname, location, profile_uri, create_date);
				arr.add(dto);
			}
			return arr;
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			}catch(Exception e2) {
				
			}
		}
	}
	public int UpdateMyinfo(UserDTO dto){
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			String sql = "update user_info set name=?, pwd=?, email=?, nickname=?, location=?, profile_uri=? where id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getPwd());
			ps.setString(3, dto.getEmail());
			ps.setString(4, dto.getNickname());
			ps.setString(5, dto.getLocation());
			ps.setString(6, dto.getProfile_uri());
			ps.setString(7, dto.getId());
			int count = ps.executeUpdate();
			conn.commit();
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
	public String KeepProfile(String id) {
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			String sql = "select profile_uri from user_info where id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			
			String kprofile="";
			if(rs.next()) {
				kprofile = rs.getString("profile_uri");
			}
			return kprofile;
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			}catch(Exception e2) {
				
			}
		}
	}
	
	public int getTodayJoinUser() {
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			String sql = "select count(*) from user_info where to_char(create_date, 'yy/mm/dd') = to_char(sysdate, 'yy/mm/dd')";
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
}

