package com.ksj.visitor;

import java.io.*;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;



public class SessionListener implements HttpSessionListener{
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		VisitCountDAO dao = new VisitCountDAO();
		dao.setVisitTotalCount();
		
		int todayCount = dao.getVisitTodayCount();
		int totalCount = dao.getVisitTotalCount();
		
		HttpSession session = se.getSession();
		
		session.setAttribute("totalCount", totalCount);
		session.setAttribute("todayCount", todayCount);
	}
	
	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		// TODO Auto-generated method stub
		HttpSessionListener.super.sessionDestroyed(se);
	}
}
