package com.ksj.user;
import java.sql.*;

public class UserDTO {
	private String name;
	private String id;
	private String pwd;
	private String email;
	private String nickname;
	private String location;
	private String profile_uri;
	private Date create_date;

	public UserDTO() {
		// TODO Auto-generated constructor stub
	}

	public UserDTO(String name, String id, String pwd, String email, String nickname, String location, String profile_uri,
			Date create_date) {
		super();
		this.name = name;
		this.id = id;
		this.pwd = pwd;
		this.email = email;
		this.nickname = nickname;
		this.location = location;
		this.profile_uri = profile_uri;
		this.create_date = create_date;
	}

	
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getProfile_uri() {
		return profile_uri;
	}

	public void setProfile_uri(String profile_uri) {
		this.profile_uri = profile_uri;
	}

	public Date getCreate_date() {
		return create_date;
	}

	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}
	
	
	
	
}

