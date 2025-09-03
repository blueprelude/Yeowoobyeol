package com.fox.users.domain;

import lombok.Data;

@Data
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
    private String	yu_del;
}
