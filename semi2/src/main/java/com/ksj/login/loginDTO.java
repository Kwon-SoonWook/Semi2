package com.ksj.login;

public class loginDTO {
	private String name;
	private String id;
	private String pwd;
	private String email;
	private String nickname;
	private String location;
	private String profile_uri;
	
	
	public loginDTO() {
		// TODO Auto-generated constructor stub
	}


	
	public loginDTO(String name,String id, String pwd, String email, String nickname, String location, String profile_uri) {
		super();
		this.name = name;
		this.id = id;
		this.pwd = pwd;
		this.email = email;
		this.nickname = nickname;
		this.location = location;
		this.profile_uri = profile_uri;
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
	
	
	
}
