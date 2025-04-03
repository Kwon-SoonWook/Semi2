package com.ksj.ask;
import java.util.*;

public class AskDTO {
	private int ask_id;
	private String ask_user_id;
	private String ask_title;
	private String ask_content;
	private int ask_type;
	private Date ask_date;
	private int ref;
	private int lev;
	private int sunbun;
	
	public AskDTO() {
		// TODO Auto-generated constructor stub
	}

	

	public AskDTO(int ask_id, String ask_user_id, String ask_title,String ask_content, int ask_type, Date ask_date,int ref, int lev, int sunbun) {
		super();
		this.ask_id = ask_id;
		this.ask_user_id = ask_user_id;
		this.ask_title = ask_title;
		this.ask_content = ask_content;
		this.ask_type = ask_type;
		this.ask_date = ask_date;
		this.ref = ref;
		this.lev = lev;
		this.sunbun = sunbun;
	}



	public int getAsk_id() {
		return ask_id;
	}

	public void setAsk_id(int ask_id) {
		this.ask_id = ask_id;
	}

	public String getAsk_user_id() {
		return ask_user_id;
	}

	public void setAsk_user_id(String ask_user_id) {
		this.ask_user_id = ask_user_id;
	}

	public String getAsk_title() {
		return ask_title;
	}

	public void setAsk_title(String ask_title) {
		this.ask_title = ask_title;
	}

	public String getAsk_content() {
		return ask_content;
	}

	public void setAsk_content(String ask_content) {
		this.ask_content = ask_content;
	}

	public int getAsk_type() {
		return ask_type;
	}

	public void setAsk_type(int ask_type) {
		this.ask_type = ask_type;
	}

	public Date getAsk_date() {
		return ask_date;
	}

	public void setAsk_date(Date ask_date) {
		this.ask_date = ask_date;
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
