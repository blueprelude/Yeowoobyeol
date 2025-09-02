package com.fox.users.domain;

public class UserInfoDTO {
	// Fields
    private String	yu_userid;
    private String	yu_passwd;
    private String	yu_username;
    private String	yu_birth; 
    private String	yu_phone; 
    private String  yu_email;
    private String  yu_indate;
    
    private String  yu_auth;

    
	public String getYu_userid() {
		return yu_userid;
	}

	public void setYu_userid(String yu_userid) {
		this.yu_userid = yu_userid;
	}

	public String getYu_passwd() {
		return yu_passwd;
	}

	public void setYu_passwd(String yu_passwd) {
		this.yu_passwd = yu_passwd;
	}

	public String getYu_username() {
		return yu_username;
	}

	public void setYu_username(String yu_username) {
		this.yu_username = yu_username;
	}

	public String getYu_birth() {
		return yu_birth;
	}

	public void setYu_birth(String yu_birth) {
		this.yu_birth = yu_birth;
	}

	public String getYu_phone() {
		return yu_phone;
	}

	public void setYu_phone(String yu_phone) {
		this.yu_phone = yu_phone;
	}

	public String getYu_email() {
		return yu_email;
	}

	public void setYu_email(String yu_email) {
		this.yu_email = yu_email;
	}

	public String getYu_indate() {
		return yu_indate;
	}

	public void setYu_indate(String yu_indate) {
		this.yu_indate = yu_indate;
	}

	public String getYu_auth() {
		return yu_auth;
	}

	public void setYu_auth(String yu_auth) {
		this.yu_auth = yu_auth;
	}
	
	
	public UserInfoDTO() {
		
	}

	
	public UserInfoDTO(String yu_userid, String yu_passwd, String yu_username, String yu_birth, String yu_phone,
			String yu_email, String yu_indate, String yu_auth) {
		super();
		this.yu_userid = yu_userid;
		this.yu_passwd = yu_passwd;
		this.yu_username = yu_username;
		this.yu_birth = yu_birth;
		this.yu_phone = yu_phone;
		this.yu_email = yu_email;
		this.yu_indate = yu_indate;
		this.yu_auth = yu_auth;
	}
	

	@Override
	public String toString() {
		return "UserInfoDTO [yu_userid=" + yu_userid + ", yu_passwd=" + yu_passwd + ", yu_username=" + yu_username
				+ ", yu_birth=" + yu_birth + ", yu_phone=" + yu_phone + ", yu_email=" + yu_email + ", yu_indate="
				+ yu_indate + ", yu_auth=" + yu_auth + "]";
	}
    
}
