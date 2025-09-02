package com.fox.bookrental.domain;

import lombok.Data;

@Data
public class rentalDTO {
	private int yri_idx; // 대여정보 고유 번호
	private int ybi_idx; // 도서목록 고유번호
	private String yri_rtdate; // 대여시작일
	private String yri_redate; // 반납일
	private String yu_userid; // 사용자 ID
	
	//
	private String ybi_subject;// 책제목
	private String ybi_publi; // 출판사
	private String ybi_name; // 이름
	
	//
	private String comm; // 기간만료,반납가능
	
	
}
