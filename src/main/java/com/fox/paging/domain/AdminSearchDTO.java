package com.fox.paging.domain;


import lombok.Data;

@Data
public class AdminSearchDTO {
	private int page;
	private int recordSize;
	private int pageSize;
	private String keyword;
	private String searchType;
	private AdminPagination pagination;
	
	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getRecordSize() {
		return recordSize;
	}

	public void setRecordSize(int recordSize) {
		this.recordSize = recordSize;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public AdminPagination getPagination() {
		return pagination;
	}

	public void setPagination(AdminPagination pagination) {
		this.pagination = pagination;
	}

	//recoredSize: 페이지에 보여줄 게시글 수 
	//pageSize: 화면 보여줄 페이지 최대 갯수 
	public AdminSearchDTO() {
		this.page = 1;
		this.recordSize = 10;
		this.pageSize = 5;
	}
	
	public int getOffset() {
		return (page - 1) * recordSize;
		
	}
	
}
