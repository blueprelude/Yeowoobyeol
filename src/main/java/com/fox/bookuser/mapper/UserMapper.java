package com.fox.bookuser.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.fox.bookrental.domain.rentalDTO;
import com.fox.bookuser.domain.userDTO;

@Mapper
public interface UserMapper {
	
	//로그인 시 정보 확인
	userDTO getUser( userDTO userDTO);
	
}
