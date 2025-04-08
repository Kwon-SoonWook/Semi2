package com.ksj.visitor;

import java.sql.*;
import java.util.*;

public class VisitCountDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public VisitCountDAO() {
		// TODO Auto-generated constructor stub
	}
	
	public int setVisitTotalCount() {
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			String sql = "insert into visit values(sysdate)";
			ps = conn.prepareStatement(sql);
			int count = ps.executeUpdate();
			return count;
		}catch(Exception e) {
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
	
	public int getVisitTotalCount() {
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			String sql = "select count(*) from visit";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			int count = 0;
			if(rs.next()) {
				count = rs.getInt(1);
			}else {
				count = -1;
			}
			return count;
		}catch(Exception e) {
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

	
	public int getVisitTodayCount() {
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			String sql = "select count(*) from visit where substr(to_char(visit_date), 0, 10) = to_char(sysdate, 'yy/mm/dd')";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			int count = 0;
			if(rs.next()) {
				count = rs.getInt(1);
			}else {
				count = -1;
			}
			return count;
		}catch(Exception e) {
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
