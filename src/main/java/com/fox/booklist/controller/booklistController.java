package com.fox.booklist.controller;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fox.booklist.domain.booklistDTO;
import com.fox.booklist.mapper.BooklistMapper;
import com.fox.paging.domain.Pagination;
import com.fox.paging.domain.SearchDTO;
import com.fox.paging.mapper.PagingMapper;

import jakarta.servlet.http.HttpSession;

@Controller
public class booklistController {

	
	@Autowired
	private PagingMapper pagingMapper;
	
	@Autowired
	private BooklistMapper booklistMapper;

	@RequestMapping("/")
	public String home() {
		return "index";
	}
	
	@RequestMapping("/adminPage")
	public String adminPage() {
		return "admin";
	}
	
	
	
	@GetMapping("/BookList")
	//public String getBookList(@RequestParam("searchType") String searchType, SearchDTO params, HttpSession session, Model model) {
	public String getBookList(@RequestParam("searchType") String searchType, SearchDTO params, HttpSession session, Model model) {
		
		// 1. 세션에서 로그인 사용자 ID 가져오기
		String yu_userid = (String) session.getAttribute("login_id");
		
		// 2. 검색 조건에 맞는 전체 게시글 수 조회
		int totalCount = pagingMapper.count(params, yu_userid);
		
		System.out.println( yu_userid + "의 대여가능한 전체 도서갯수:" + totalCount);
		
		// 3. Pagination 객체 생성 및 SearchDTO에 주입
		Pagination pagination = new Pagination(totalCount, params);
		params.setPagination(pagination);
		
		//페이지가 0 보다 작을경우 1 로 설정 (이전 버튼 누를시 -1 -2.. 방지)
		if(params.getPage() < 0) {
			params.setPage(1);
		}
		// 4. 페이지네이션 정보와 사용자 ID, 검색 조건으로 목록 조회 (params : keyword)
		List<booklistDTO> bookList = booklistMapper.getBookList(params, yu_userid); // Mapper에 DTO와 ID를 함께 넘김
		
			if(bookList.isEmpty()) {
				//없다면 neResult로 넘겨줌
				model.addAttribute("neResult" , true);
			}else {
				//결과가 있다면 그대로 넘겨줌
				model.addAttribute("bookList" , bookList);
			}
			
			
		// 5. 모델에 데이터 담아 뷰로 전달
		model.addAttribute("searchType", searchType);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("searchDTO", params);
		model.addAttribute("bookList", bookList);
		return "list";
	}
}
	
	
	
	
	
	
	
