package com.fox.bookuser.domain;

import lombok.Data;


//유저정보
@Data
public class userDTO {
	private String yu_userid;
	private String yu_passwd;
	private String yu_username;
	private String yu_birth;
	private String yu_phone;
	private String yu_email;
	private String yu_indate;
	private String yu_outdate;
	private String yu_outcomm;
	private String yu_auth;
	private String yu_del;
}
