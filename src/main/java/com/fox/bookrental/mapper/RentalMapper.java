package com.fox.bookrental.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.fox.bookrental.domain.rentalDTO;
import com.fox.paging.domain.SearchDTO;

@Mapper
public interface RentalMapper {
	
	
	
	//대여날짜 삽입
	void insertRental(rentalDTO rental);
	
	//반납날짜 삽입
	void updateRental(rentalDTO rentalDTO);
	
	// 대여/반납 갯수
	int getTodaySameBookCount(@Param("userId") String userId,  @Param("ybi_idx")int ybi_idx);
	
	//모든 사용자의 도서대여리스트
	List<rentalDTO> notReturnsBooks();

	
	//금일자로 부터 반납된 시간 계산
	List<rentalDTO> calcReturnDays(SearchDTO params);
	
	
}
