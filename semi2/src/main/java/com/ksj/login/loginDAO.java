package com.ksj.login;

import java.sql.*;

public class loginDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public int signUp(loginDTO dto) {
		try {
			conn = com.ksj.db.DB.getConn();
			String sql = "insert into user_info values(?,?,?,?,?,?,?,sysdate)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getId());
			ps.setString(3, dto.getPwd());
			ps.setString(4, dto.getEmail());
			ps.setString(5, dto.getNickname());
			ps.setString(6, dto.getLocation());
			ps.setString(7, dto.getProfile_uri());
			
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
	
	public String login(String id, String pwd) {
			try {
				conn = com.ksj.db.DB.getConn();
				String sql = "select id,pwd,name from user_info where id = ?";
				ps = conn.prepareStatement(sql);
				
				ps.setString(1, id);
				rs = ps.executeQuery();
				
				String name = "";
				if(rs.next()) {
					String password = rs.getString("pwd");
					if(password.equals(pwd)) {
						name =  rs.getString("name");
					}
				}else {
					 return null;
				}
				return name;
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
	
	public String findId(String name, String email) {
		try {
			conn = com.ksj.db.DB.getConn();
			String sql = "select id,name,email from user_info where name = ?";
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, name);
			
			rs = ps.executeQuery();
			String result = "";
			if(rs.next()) {
				String uemail = rs.getString("email");
				 result = email.equals(uemail)?rs.getString("id"):"존재하지 않는 이메일입니다";
			}else {
				result = "존재하지 않는 이름입니다";
			}
			
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
		try {
			rs.close();
			ps.close();
			conn.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	}
	
	public String findPwd(String name, String id, String email) {
		try {
			conn = com.ksj.db.DB.getConn();
			String sql = "select name,id,email,pwd from user_info where name = ? and id = ? and email = ?";
			
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, name);
			ps.setString(2, id);
			ps.setString(3, email);
			rs = ps.executeQuery();
			
			String result = "";
			
			if(rs.next()) {
				result = rs.getString("pwd");
				return result;
			}else {
				return "";
			}
			
			
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
	
	public int setPwd(String pwd,String id) {
		try {
			conn=com.ksj.db.DB.getConn();
			
			String sql = "update user_info set pwd = ? where id = ? ";
			ps = conn.prepareStatement(sql);
			
			ps.setString(1,pwd);
			ps.setString(2,id);
			
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
	public int InfoDelete(String id) {
		try {
			conn = com.ksj.db.DB.getConn();
			
			String sql = "delete from user_info where id = ?";
			ps=conn.prepareStatement(sql);
			
			ps.setString(1, id);
			
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
	public boolean duptest(String id) {
		try {
			conn = com.ksj.db.DB.getConn();
			
			String sql = "select id from user_info where id = ?";
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, id);
			
			rs = ps.executeQuery();
			
			return rs.next()?false:true;
			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}finally {
			try {
				
			} catch (Exception e2) {
				// TODO: handle exception
			}	
		}
	}
	
	public void profile() {
		try {
			conn = com.ksj.db.DB.getConn();
			
			String sql = "";
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
}
