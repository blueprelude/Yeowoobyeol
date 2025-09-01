package com.fox.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fox.admin.domain.AdminBookDTO;
import com.fox.admin.domain.AdminUserBookDTO;
import com.fox.admin.mapper.AdminBookMapper;
import com.fox.paging.domain.AdminPagination;
import com.fox.paging.domain.AdminSearchDTO;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class AdminBookInfoController {
	
	@Autowired
	private AdminBookMapper adminBookMapper;

	@RequestMapping("/Admin/AdminBookList")
	public ModelAndView adminBookList(AdminSearchDTO params,AdminBookDTO adminBookDto) {
		String and_str = "";
		String pagingUrl = "/Admin/AdminBookList?";
		
		List<AdminBookDTO> bookList = adminBookMapper.getBookList(adminBookDto,params);
		// paging Data
		int totalCount = adminBookMapper.count(adminBookDto,and_str);
		
		//Pagination 객체 생성 및 SearchDTO에 주입
		AdminPagination pagination = new AdminPagination(totalCount, params);
		params.setPagination(pagination);
				
		//페이지가 0 보다 작을경우 1 로 설정 (이전 버튼 누를시 -1 -2.. 방지)
		if(params.getPage() < 0) {
			params.setPage(1);
		}
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("pagingUrl",pagingUrl);
		mv.addObject("bookList",bookList);
		mv.addObject("searchDTO",params);
		mv.addObject("totalCount",totalCount);
		mv.setViewName("admin/adminBookList");
		return mv;
	}
	
	@RequestMapping("/Admin/AdminBookView")
	public ModelAndView adminBookView(AdminBookDTO adminBookDto) {
		
		// User Data
		adminBookDto = adminBookMapper.getBookData(adminBookDto);

		ModelAndView mv = new ModelAndView();
		mv.addObject("bookData",adminBookDto);
		mv.setViewName("admin/adminBookView");
		return mv;
	}
	
	@RequestMapping("/Admin/AdminBookUpdate")
	public ModelAndView adminUserUpdate(HttpServletRequest request, AdminUserBookDTO adminUserBookDto) {
		
		// update
		adminBookMapper.bookUpdate(adminUserBookDto);
		int ybi_idx = adminUserBookDto.getYbi_idx();
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("redirect:/Admin/AdminBookView?ybi_idx="+ybi_idx);
		return mv;
	}
	
	@RequestMapping("/Admin/AdminBookInsertForm")
	public ModelAndView adminUserInsertForm(AdminUserBookDTO adminUserBookDto) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/adminBookInsertForm");
		return mv;
	}
	
	@RequestMapping("/Admin/AdminBookInsert")
	public ModelAndView adminUserInsert(AdminUserBookDTO adminUserBookDto) {
		
		// insert
		adminBookMapper.bookInsert(adminUserBookDto);
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("redirect:/Admin/AdminBookList");
		return mv;
	}
	
	@RequestMapping("/Admin/AdminBookSearch")
	public ModelAndView adminbookSearch(HttpServletRequest request, AdminSearchDTO params, AdminBookDTO adminBookDto) {
		String search = request.getParameter("search");
		String and_str =  " where ybi_subject like'%"+search+"%' ";
			   and_str += " or ybi_publi like '%"+search+"%' ";
			   and_str += " or ybi_name like '%"+search+"%' ";
	    String pagingUrl = "/Admin/AdminBookSearch?search="+search+"&";
		
		List<AdminBookDTO> bookList = adminBookMapper.getBookSearch(adminBookDto,and_str,params);
		
		int totalCount = adminBookMapper.count(adminBookDto,and_str);
		
		//Pagination 객체 생성 및 SearchDTO에 주입
		AdminPagination pagination = new AdminPagination(totalCount, params);
		params.setPagination(pagination);
				
		//페이지가 0 보다 작을경우 1 로 설정 (이전 버튼 누를시 -1 -2.. 방지)
		if(params.getPage() < 0) {
			params.setPage(1);
		}
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("pagingUrl",pagingUrl);
		mv.addObject("search",search);
		mv.addObject("bookList",bookList);
		mv.addObject("searchDTO",params);
		mv.addObject("totalCount",totalCount);
		mv.setViewName("admin/adminBookList");
		return mv;
	}
	
}
