package com.fox.booklist.domain;

import lombok.Data;

	@Data
	public class booklistDTO {
		private int ybi_idx; // 테이블 입력 데이터 고유 번호
	    private String ybi_subject; //책 제목
	    private String ybi_publi; //출판사
	    private String ybi_name; //저자 이름
	    private String ybi_rental; //대여 여부 N: 대여가능  Y:대여 중
	    private String ybi_indate; // 책 등록 일자
	    private String ybi_del; //삭제 플래그 N: 보유  Y: 삭제
	    private String yu_userid; //유저아이디
	    private String rentalst; //유저아이디
	}