package com.fox.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fox.admin.domain.AdminBookDTO;
import com.fox.admin.domain.AdminUserBookDTO;
import com.fox.admin.domain.AdminUserDTO;
import com.fox.admin.mapper.AdminBookMapper;
import com.fox.admin.mapper.AdminUserMapper;

@Controller
public class AdminNewIngController {
	
	@Autowired
	private AdminUserMapper adminUserMapper;
	@Autowired
	private AdminBookMapper adminBookMapper;

	@RequestMapping("/Admin/AdminNewIngList")
	public ModelAndView adminNewIngList(AdminUserBookDTO adminUserBookDto,AdminUserDTO adminUserDto, AdminBookDTO adminBookDto) {
		
		List<AdminUserDTO> userList = adminUserMapper.getUserNewList(adminUserDto);
		List<AdminUserBookDTO> bookrtList = adminBookMapper.getBookRTList(adminUserBookDto);
		List<AdminUserBookDTO> bookreList = adminBookMapper.getBookREList(adminUserBookDto);
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("userList",userList);
		mv.addObject("bookrtList",bookrtList);
		mv.addObject("bookreList",bookreList);
		mv.setViewName("admin/adminNewIngList");
		return mv;
	}
	
}
