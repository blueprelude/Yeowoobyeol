package com.fox.admin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.fox.admin.domain.AdminBookDTO;
import com.fox.admin.domain.AdminUserBookDTO;
import com.fox.paging.domain.AdminSearchDTO;

@Mapper
public interface AdminBookMapper {

	//List
	List<AdminBookDTO> getBookList(AdminBookDTO adminBookDto, AdminSearchDTO params);

	// view - bookData
	AdminBookDTO getBookData(AdminBookDTO adminBookDto);

	// update
	void bookUpdate(AdminUserBookDTO adminUserBookDto);

	// insert
	void bookInsert(AdminUserBookDTO adminUserBookDto);

	// search
	List<AdminBookDTO> getBookSearch(AdminBookDTO adminBookDto, String and_str, AdminSearchDTO params);

	// NewIng List
	List<AdminUserBookDTO> getBookRTList(AdminUserBookDTO adminUserBookDto);
	List<AdminUserBookDTO> getBookREList(AdminUserBookDTO adminUserBookDto);

	//totalCount
	int count(AdminBookDTO adminBookDto, String and_str);

}
