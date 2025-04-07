package com.ksj.bbs;

import java.util.Date;

public class BbsDTO {

	
	private int bbs_idx;
	private String bbs_id;
	private String title;
	private String content;
	private int view_cnt;
	private Date create_date;
	private Date update_date;
	private int bbs_div;
	
	
	public BbsDTO() {
		// TODO Auto-generated constructor stub
	}
	
	


	public BbsDTO(int bbs_idx, String bbs_id, String title, String content, int view_cnt, Date create_date,
			Date update_date, int bbs_div) {
		super();
		this.bbs_idx = bbs_idx;
		this.bbs_id = bbs_id;
		this.title = title;
		this.content = content;
		this.view_cnt = view_cnt;
		this.create_date = create_date;
		this.update_date = update_date;
		this.bbs_div = bbs_div;
	}




	public int getBbs_idx() {
		return bbs_idx;
	}


	public void setBbs_idx(int bbs_idx) {
		this.bbs_idx = bbs_idx;
	}


	public String getBbs_id() {
		return bbs_id;
	}


	public void setBbs_id(String bbs_id) {
		this.bbs_id = bbs_id;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public int getView_cnt() {
		return view_cnt;
	}


	public void setView_cnt(int view_cnt) {
		this.view_cnt = view_cnt;
	}


	public Date getCreate_date() {
		return create_date;
	}


	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}


	public Date getUpdate_date() {
		return update_date;
	}


	public void setUpdate_date(Date update_date) {
		this.update_date = update_date;
	}


	public int getBbs_div() {
		return bbs_div;
	}


	public void setBbs_div(int bbs_div) {
		this.bbs_div = bbs_div;
	}
	
	
}
