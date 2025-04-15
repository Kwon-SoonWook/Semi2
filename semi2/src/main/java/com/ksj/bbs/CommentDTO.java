package com.ksj.bbs;

import java.util.Date;

public class CommentDTO {

	
	private int bbs_comment_idx;
	private String comment_content;
	private int bbs_idx;
	private String nickname;
	private Date upload_date;
	private int ref;
	private int lev;
	private int sunbun;
	
	
	public CommentDTO() {
		// TODO Auto-generated constructor stub
	}


	


	public CommentDTO(int bbs_comment_idx, String comment_content, int bbs_idx, String nickname, Date upload_date,
			int ref, int lev, int sunbun) {
		super();
		this.bbs_comment_idx = bbs_comment_idx;
		this.comment_content = comment_content;
		this.bbs_idx = bbs_idx;
		this.nickname = nickname;
		this.upload_date = upload_date;
		this.ref = ref;
		this.lev = lev;
		this.sunbun = sunbun;
	}


	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public Date getUpload_date() {
		return upload_date;
	}

	public void setUpload_date(Date upload_date) {
		this.upload_date = upload_date;
	}

	public int getBbs_comment_idx() {
		return bbs_comment_idx;
	}


	public void setBbs_comment_idx(int bbs_comment_idx) {
		this.bbs_comment_idx = bbs_comment_idx;
	}


	public String getComment_content() {
		return comment_content;
	}


	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}


	public int getBbs_idx() {
		return bbs_idx;
	}


	public void setBbs_idx(int bbs_idx) {
		this.bbs_idx = bbs_idx;
	}


	public int getRef() {
		return ref;
	}


	public void setRef(int ref) {
		this.ref = ref;
	}


	public int getLev() {
		return lev;
	}


	public void setLev(int lev) {
		this.lev = lev;
	}


	public int getSunbun() {
		return sunbun;
	}


	public void setSunbun(int sunbun) {
		this.sunbun = sunbun;
	}
	
	
	
	
	
}
