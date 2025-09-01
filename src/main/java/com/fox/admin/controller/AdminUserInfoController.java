package com.fox.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fox.admin.domain.AdminUserBookDTO;
import com.fox.admin.domain.AdminUserDTO;
import com.fox.admin.mapper.AdminUserMapper;
import com.fox.paging.domain.AdminPagination;
import com.fox.paging.domain.AdminSearchDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class AdminUserInfoController {
	
	@Autowired
	private AdminUserMapper adminUserMapper;

	@RequestMapping("/Admin/AdminUserList")
	public ModelAndView adminUserList(AdminSearchDTO params, AdminUserDTO adminUserDto) {
		String and_str = "";
		String pagingUrl = "/Admin/AdminUserList?";
		
		// userList Data
		List<AdminUserDTO> userList = adminUserMapper.getUserList(adminUserDto,params);
		// paging Data
		int totalCount = adminUserMapper.count(adminUserDto,and_str);
		
		//Pagination 객체 생성 및 SearchDTO에 주입
		AdminPagination pagination = new AdminPagination(totalCount, params);
		params.setPagination(pagination);
				
		//페이지가 0 보다 작을경우 1 로 설정 (이전 버튼 누를시 -1 -2.. 방지)
		if(params.getPage() < 0) {
			params.setPage(1);
		}
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("pagingUrl",pagingUrl);
		mv.addObject("userList",userList);
		mv.addObject("searchDTO",params);
		mv.addObject("totalCount",totalCount);
		mv.setViewName("admin/adminUserList");
		return mv;
	}
	
	@RequestMapping("/Admin/AdminUserView")
	public ModelAndView adminUserView(AdminUserDTO adminUserDto, AdminUserBookDTO adminUserBookDto) {
		
		// User Data
		adminUserDto = adminUserMapper.getUserData(adminUserDto);

		// User Book Rental info
		List<AdminUserBookDTO> userBookList = adminUserMapper.getUserBookList(adminUserBookDto);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("userData",adminUserDto);
		mv.addObject("userBookList",userBookList);
		mv.setViewName("admin/adminUserView");
		return mv;
	}
	
	@RequestMapping("/Admin/AdminUserUpdate")
	public ModelAndView adminUserUpdate(HttpServletRequest request, AdminUserDTO adminUserDto, AdminUserBookDTO adminUserBookDto) {
		// 유저 권한 변경
		String auth = request.getParameter("auth");
		String yu_userid = request.getParameter("yu_userid");
		
		if(auth.equals("N")) {
			adminUserDto.setYu_auth(auth);
			adminUserMapper.UserauthN(adminUserDto);
		}else if(auth.equals("Y")){
			adminUserDto.setYu_auth(auth);
			adminUserMapper.UserauthY(adminUserDto);
		}else if(auth.equals("D")) {
			adminUserDto.setYu_del("Y");
			adminUserMapper.UserauthD(adminUserDto);
		}
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("redirect:/Admin/AdminUserView?yu_userid="+yu_userid);
		return mv;
	}
	
	@RequestMapping("/Admin/AdminUserSearch")
	public ModelAndView adminUserSearch(HttpServletRequest request, AdminSearchDTO params, AdminUserDTO adminUserDto) {
		String search = request.getParameter("search");
		String and_str =  " and (yu_username like'%"+search+"%' ";
			   and_str += " or yu_userid like '%"+search+"%' ";
			   and_str += " or yu_email like '%"+search+"%') ";
	    String pagingUrl = "/Admin/AdminUserSearch?search="+search+"&";
		
		List<AdminUserDTO> userList = adminUserMapper.getUserSearch(adminUserDto,and_str,params);
		
		int totalCount = adminUserMapper.count(adminUserDto,and_str);
		
		// Pagination 객체 생성 및 SearchDTO에 주입
		AdminPagination pagination = new AdminPagination(totalCount, params);
		params.setPagination(pagination);
				
		//페이지가 0 보다 작을경우 1 로 설정 (이전 버튼 누를시 -1 -2.. 방지)
		if(params.getPage() < 0) {
			params.setPage(1);
		}
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("pagingUrl",pagingUrl);
		mv.addObject("search",search);
		mv.addObject("userList",userList);
		mv.addObject("searchDTO",params);
		mv.addObject("totalCount",totalCount);
		mv.setViewName("admin/adminUserList");
		return mv;
	}
	
	@RequestMapping("/Admin/AdminUserViewSearch")
	public ModelAndView adminUserViewSearch(HttpServletRequest request, AdminUserDTO adminUserDto, AdminUserBookDTO adminUserBookDto) {
		String search = request.getParameter("search");
		String and_str =  " and ( YBI.YBI_SUBJECT like '%"+search+"%' ";
			   and_str += " or YBI.YBI_NAME like '%"+search+"%') ";
		
		// User Data
		adminUserDto = adminUserMapper.getUserData(adminUserDto);

		// User Book Rental info
		List<AdminUserBookDTO> userBookList = adminUserMapper.getUserBookListSearch(adminUserBookDto,and_str);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("search",search);
		mv.addObject("userData",adminUserDto);
		mv.addObject("userBookList",userBookList);
		mv.setViewName("admin/adminUserView");
		return mv;
	}
}
