package com.ksj.user;
import java.sql.*;
import java.util.*;


public class UserDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public ArrayList<UserDTO> userList(){
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
}
