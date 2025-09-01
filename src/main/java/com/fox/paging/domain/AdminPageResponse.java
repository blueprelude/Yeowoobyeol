package com.fox.paging.domain;

import java.util.ArrayList;
import java.util.List;


import lombok.Data;

@Data
public class AdminPageResponse<T> {
	
	// 현재 페이지에 보여줄 db자료 : select 결과
	private List<T> 	list = new ArrayList<>();
	private AdminPagination  pagination;

	//생성자
	public AdminPageResponse(List<T> list, AdminPagination pagination) {
		this.list = list;
		this.pagination = pagination;
	}
	
}
