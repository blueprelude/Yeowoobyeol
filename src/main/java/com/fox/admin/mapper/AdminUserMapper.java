package com.fox.admin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.fox.admin.domain.AdminUserBookDTO;
import com.fox.admin.domain.AdminUserDTO;
import com.fox.paging.domain.AdminSearchDTO;

@Mapper
public interface AdminUserMapper {

	//List
	List<AdminUserDTO> getUserList(AdminUserDTO adminUserDto,AdminSearchDTO params);

	//view - userData
	AdminUserDTO getUserData(AdminUserDTO adminUserDto);
	//view - userBookList
	List<AdminUserBookDTO> getUserBookList(AdminUserBookDTO adminUserBookDto);

	// update auth
	void UserauthN(AdminUserDTO adminUserDto);
	void UserauthY(AdminUserDTO adminUserDto);
	void UserauthD(AdminUserDTO adminUserDto);

	// List Search
	List<AdminUserDTO> getUserSearch(AdminUserDTO adminUserDto, String and_str, AdminSearchDTO params);
	
	//view - userBookList
	List<AdminUserBookDTO> getUserBookListSearch(AdminUserBookDTO adminUserBookDto, String and_str);

	// NewIng - new List
	List<AdminUserDTO> getUserNewList(AdminUserDTO adminUserDto);

	//paging totalCount
	int count(AdminUserDTO adminUserDto, String and_str);

}
