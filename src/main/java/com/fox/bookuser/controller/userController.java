package com.fox.bookuser.controller;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fox.booklist.mapper.BooklistMapper;
import com.fox.bookrental.domain.rentalDTO;
import com.fox.bookrental.mapper.RentalMapper;
import com.fox.bookuser.domain.userDTO;
import com.fox.bookuser.mapper.UserMapper;
import com.fox.paging.domain.Pagination;
import com.fox.paging.domain.SearchDTO;
import com.fox.paging.mapper.PagingMapper;

import jakarta.servlet.http.HttpSession;


@Controller
public class userController {

	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private BooklistMapper booklistMapper;
	
	@Autowired
	private PagingMapper pagingMapper;
	
	@Autowired
	private RentalMapper rentalMapper;
	
	@RequestMapping("/LoginForm")
	public String loginForm() {
		return "login_sample";
	}
	
	
	@RequestMapping("/login")
	public String login(userDTO userDTO, HttpSession session, Model model) {
		userDTO user = userMapper.getUser(userDTO);
		if(user != null && user.getYu_passwd().equals(userDTO.getYu_passwd())) {
			session.setAttribute("login_id", user.getYu_userid());
			return "index";
		}else{
		model.addAttribute("error","아이디 또는 패스워드가 틀립니다.");	
		return "redirect:/LoginForm"; // home.jsp 로 포워딩
		}
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		//세션 해제
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("/userInfo")
	public String userInfo() {
		return "userInfo";
	}
	
	//대여내역 리스트
	@RequestMapping("/RentalList")
	public String rentalList(SearchDTO params, HttpSession session ,  Model model) {
		String yu_userid = (String) session.getAttribute("login_id");
		
		if(yu_userid == null) {
			model.addAttribute("loginError" , "로그인이 필요한 서비스입니다.");
			return "login_sample";
		}
		
		//리스트 가져오기
		List<rentalDTO> rentalList = booklistMapper.rentalList(params, yu_userid);
		// RentalList?keyword= 키워드가 null이 아니거나 또는 비어있지않다면 다음 if 실행
		 if (params.getKeyword() != null && !params.getKeyword().isEmpty()) {
			 	//rentalList목록에 해당하는 도서가 없다면
		        if(rentalList.isEmpty()) {
		            //없다면 neResult로 넘겨줌
		            model.addAttribute("neResult" , true);
		        } else {
		            //결과가 있다면 그대로 넘겨줌
		            model.addAttribute("rentalList" , rentalList);
		        }
		    } else {
		        // keyword가 없을 때는 무조건 rentalList를 넘겨줌 (비어있더라도)
		        model.addAttribute("rentalList" , rentalList);
		    }
		    
		 // 1. 대여 내역의 총 개수 조회
		int totalCount = pagingMapper.rentalCount(yu_userid, params.getKeyword());
		
		System.out.println( yu_userid  + "의 " + "대여내역갯수:"+ totalCount);
		
		//pagination 
		Pagination pagination = new Pagination(totalCount , params);
		params.setPagination(pagination);
		
		//페이지가 보다 작을 경우 1로 설정
		if(params.getPage() < 0) {
			params.setPage(1);
		}
		
		//페이징,대여리스트,유저아이디
		model.addAttribute("searchDTO", params);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("yu_userid", yu_userid);
		return "rentalList";
	}
	
	//반납내역 리스트
	@RequestMapping("/ReturnList")
	public String returnList(SearchDTO params, HttpSession session , Model model) {
		String yu_userid = (String) session.getAttribute("login_id");
		
		if(yu_userid == null) {
			model.addAttribute("loginError", "로그인이 필요한 서비스입니다.");
			return "login_sample";
		}
		
		
		List<rentalDTO> returnList = booklistMapper.returnList(params, yu_userid);
		List<rentalDTO> calcReturnDays = rentalMapper.calcReturnDays(params);
		
		//keyword가 비어있지 않거나 혹은 null이 아닐경우
		 if (params.getKeyword() != null && !params.getKeyword().isEmpty()) {
			 	//returnList목록에 해당하는 도서가 없다면
		        if(returnList.isEmpty()) {
		            //없다면 neResult로 넘겨줌
		            model.addAttribute("neResult" , true);
		        } else {
		            //결과가 있다면 returnList로 넘겨줌
		            model.addAttribute("returnList" , returnList);
		          	}
				} else {
		        // keyword가 없을 때는 무조건 넘겨줌 (비어있더라도)
		        model.addAttribute("returnList" , returnList);
		        model.addAttribute("calcReturnDays",calcReturnDays);
		   }
		// 1. 반납 목록의 총 개수 조회
		int totalCount = pagingMapper.returnCount(yu_userid, params.getKeyword());
		System.out.println(yu_userid + "의 " + "반납내역갯수:" + totalCount);
		//페이지가 보다 작을 경우 1로 설정
		if(params.getPage() < 0) {
			params.setPage(1);
		}
		
		//pagination 객체 생성
		Pagination pagination = new Pagination(totalCount , params);
		params.setPagination(pagination);

		//페이징,대여리스트,유저아이디
		model.addAttribute("searchDTO", params);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("yu_userid", yu_userid);
		return "returnList";
	}
	
}
