package com.fox.paging.domain;


import lombok.Data;

@Data
public class SearchDTO {
	private int page;
	private int recordSize;
	private int pageSize;
	private String keyword;
	private String searchType;
	private Pagination pagination;
	private String yu_userid;
	
	//recoredSize: 페이지에 보여줄 게시글 수 
	//pageSize: 화면 보여줄 페이지 최대 갯수 
	public SearchDTO() {
		this.page = 1;
		this.recordSize = 15;
		this.pageSize = 5;
	}

	
	
	public int getOffset() {
		return (page - 1) * recordSize;
		
	}
	
}
