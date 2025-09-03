package com.fox.users.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.HttpServerErrorException;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fox.users.domain.UserInfoDTO;
import com.fox.users.mapper.UserInfoMapper;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class UserInfoController {

	@Autowired
	private  UserInfoMapper  userinfoMapper;
	
	// /Users/List
	@RequestMapping("/Userlist")
	public  String  list( HttpSession session, HttpServletRequest request, Model model ) {
		
		UserInfoDTO loginUser = (UserInfoDTO) session.getAttribute("login");
		if(loginUser == null) {
			request.setAttribute("msg", "로그인이 필요한 페이지입니다.");
			return "login";
		}
		
		UserInfoDTO userinfo = userinfoMapper.getUser(loginUser);
		model.addAttribute("userInfo", userinfo);
		
		return "userlist";
	}

	// /Users/WriteForm
	@RequestMapping("/WriteForm")
	public  String  writerForm() {		
		return "write";
	}
	
	// /Users/Write
	@RequestMapping("/Write")
	public  String  write( UserInfoDTO userinfoDTO, Model model ) {
		
		userinfoMapper.insertUser( userinfoDTO );
		
		model.addAttribute("msg", "회원가입이 완료되었습니다.");
		
		return "login";
	}
	
	
	// http://localhost:9090/Users/Delete?userid=sky
	@RequestMapping("/Delete")
	public  String   delete( UserInfoDTO  userinfoDTO, 
			HttpSession session, RedirectAttributes redirectAttributes  ) {
		
		System.out.println( userinfoDTO );
		
		userinfoMapper.deleteUser( userinfoDTO );
		session.invalidate();
		
		redirectAttributes.addFlashAttribute("msg", "탈퇴처리가 완료되었습니다.");
		
		return "redirect:/";
	}
	
	@RequestMapping("/ChangePwForm")
	public  String  changePwForm() {		
		return "changepw";
	}

	
	@PostMapping("/ChangePw")
	public String changePw(
	        @RequestParam("pw1") String pw1,     
	        @RequestParam("yu_passwd") String pw2,  
	        HttpSession session,
	        RedirectAttributes redirectAttributes) {


	    UserInfoDTO loginUser = (UserInfoDTO) session.getAttribute("login");
	    
	    UserInfoDTO dbUser = userinfoMapper.getUser(loginUser);

	    String dbPw = dbUser.getYu_passwd();
	    if (!dbPw.equals(pw1)) {
	        redirectAttributes.addFlashAttribute("msg", "현재 비밀번호가 틀립니다.");
	        return "redirect:/ChangePwForm";
	    }

	   
	    UserInfoDTO updateDto = new UserInfoDTO();
	    updateDto.setYu_userid(loginUser.getYu_userid());
	    updateDto.setYu_passwd(pw2);

	    userinfoMapper.changePw(updateDto);

	    
	    redirectAttributes.addFlashAttribute("msg", "비밀번호가 변경되었습니다. 다시 로그인해 주세요.");

	    return "redirect:/LoginForm";
	}
	
	
	
	@RequestMapping("/UpdateForm")
	public  String   updateForm( UserInfoDTO  userinfoDTO , Model model ) {
		
		// 수정할 정보를 조회한다
		UserInfoDTO  user  =   userinfoMapper.getUser( userinfoDTO );
		
		// 조회한 정보를 모델에 담는다
	    model.addAttribute("user", user);
		
		return "update";
	}
	
	// http://localhost:9090/Users/Update
	@RequestMapping("/Update")
	public  String   update( UserInfoDTO userinfoDTO, RedirectAttributes redirectAttributes ) {
		// 수정하기
		userinfoMapper.updateUser( userinfoDTO );
		redirectAttributes.addFlashAttribute("msg", "정보가 수정되었습니다.");
		
		return "redirect:/Userlist";
	}
	
	//----------------------------------------
	// 로그인 
	// /Users/LoginForm 
	// response.sendRedirect() - Get 방식 호출
	// GetMapping 으로 처리 : 로그인페이지로 이동
	//  postMapping 사용 안됨
	@RequestMapping("/LoginForm")
	public  String  loginForm() { 	
		return "login";
	}	
	
	// /Users/Login  <- <form>
	@PostMapping("/Login")
    public  String   login(
       HttpServletRequest    request,
       HttpServletResponse   response,
       HttpSession session
          ) {
       // 넘어온 로그인정보 처리
       String   yu_userid  =  request.getParameter("yu_userid");
       String   yu_passwd   =  request.getParameter("yu_passwd");
       
       UserInfoDTO  user  =  userinfoMapper.login(yu_userid, yu_passwd);
       
       if (user == null) {
           request.setAttribute("msg", "아이디 또는 비밀번호가 올바르지 않습니다.");
           return "login"; 
       }

       if ("N".equals(user.getYu_auth())) {
           userinfoMapper.reLogin(yu_userid);
           request.setAttribute("msg", "휴면이 해제되었습니다. 다시 로그인해 주세요.");
           return "login";
       }
         session.setAttribute("login", user);
         
         if ("S".equals(user.getYu_auth())) {
             return "redirect:/Admin/AdminNewIngList"; 
         } else if ("Y".equals(user.getYu_auth())) {
             return "redirect:/";
         } else {
             request.setAttribute("msg", "권한이 없습니다.");
             return "login";
         }    
    }
	
	@ResponseBody
    @GetMapping("/CheckId")
    public String checkId(@RequestParam("yu_userid") String yu_userid) {
        int count = userinfoMapper.checkId(yu_userid); 
        if (count > 0) {
            return "NO";
        } else {
            return "OK";
        }
	}
	
	// /Users/Logout
	@RequestMapping(value= "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request) {
	    // getSession(false)를 사용해, 세션이 없으면 새로 만들지 않고 null을 반환합니다.
	    HttpSession session = request.getSession(false);
	    
	    if (session != null) {
	        session.invalidate(); // 세션이 존재할 경우에만 무효화합니다.
	    }
	    
	    return "redirect:/";
	}
}