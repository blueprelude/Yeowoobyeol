package com.fox.users.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

import com.fox.users.domain.UserInfoDTO;

@Mapper
public interface UserInfoMapper {

	void insertUser(UserInfoDTO userinfoDTO);

	void deleteUser(UserInfoDTO userinfoDTO);

	UserInfoDTO getUser(UserInfoDTO userinfoDTO);

	void updateUser(UserInfoDTO userinfoDTO);

	UserInfoDTO login(String yu_userid, String yu_passwd);

	int checkId(String yu_userid);

	void changePw(UserInfoDTO userinfoDTO);

	void reLogin(String yu_userid);
	
}
