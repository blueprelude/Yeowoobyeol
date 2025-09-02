package com.fox.booklist.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.fox.booklist.domain.booklistDTO;
import com.fox.bookrental.domain.rentalDTO;
import com.fox.paging.domain.SearchDTO;

@Mapper
public interface BooklistMapper {
	
	 //대여여부 N / Y
	 //void updateRentalStatus(int ybi_idx, String status);

	 //도서목록 리스트 조회
	 List<booklistDTO> getBookList(@Param("params") SearchDTO params, @Param("yu_userid") String yu_userid);
	
	 //대여정보 리스트
	 List<rentalDTO> rentalList(@Param("params") SearchDTO params, @Param("yu_userid") String yu_userid);
	 
	 //반납정보 리스트
	 List<rentalDTO> returnList(@Param("params") SearchDTO params, @Param("yu_userid") String yu_userid);

	int renCount(String userId);

	List<booklistDTO> authorSearch(SearchDTO params, String yu_userid);

	

}
