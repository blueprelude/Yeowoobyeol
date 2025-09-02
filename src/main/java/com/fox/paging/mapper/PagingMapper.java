package com.fox.paging.mapper;


import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.fox.paging.domain.SearchDTO;

@Mapper
public interface PagingMapper {
	
	//전체도서목록의 갯수
	int count(SearchDTO params ,@Param("yu_userid") String yu_userid); 
	
	//대여 검색,로그인 사용자 정보
	int rentalCount(String yu_userid, String keyword);
	
	//반납 검색,로그인 사용자 정보
	int returnCount(String yu_userid, String keyword);

}
