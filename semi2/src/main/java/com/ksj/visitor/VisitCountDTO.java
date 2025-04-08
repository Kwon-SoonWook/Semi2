package com.ksj.visitor;
import java.util.*;

public class VisitCountDTO {
	private Date visit_date;
	
	public VisitCountDTO() {
		// TODO Auto-generated constructor stub
	}

	public VisitCountDTO(Date visit_date) {
		super();
		this.visit_date = visit_date;
	}

	public Date getVisit_date() {
		return visit_date;
	}

	public void setVisit_date(Date visit_date) {
		this.visit_date = visit_date;
	}
		
}
