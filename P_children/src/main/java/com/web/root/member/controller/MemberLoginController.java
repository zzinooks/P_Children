package com.web.root.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.root.member.dto.MemberDTO;
import com.web.root.member.service.MemberService;
import com.web.root.session.name.MemberSession;

@Controller
@RequestMapping("yoonhee")
public class MemberLoginController implements MemberSession {

	//============================ 최윤희 ===========================================
	
	@Autowired
	private MemberService ms;
	
	
	// 로그인 입력창
	@GetMapping("memberLoginForm")
	public String memberLoginForm() {
		return "yoonhee/memberLoginForm";
	}
	
	// 로그인 시 아이디 체크
	@PostMapping("userCheck")
	public String userCheck(HttpServletRequest request, RedirectAttributes ra) {
		
		int result = ms.userCheck(request);
		
		if(result == 1) {
			ra.addAttribute("id", request.getParameter("id"));
			return "redirect:index";  // 로그인 성공
		} else {
			return "redirect:memberLoginForm";  // 로그인 실패
		}
		
	}
	
	
	// 로그인 성공  -> 아이디 저장, 로그아웃 -> 세션 삭제
	@GetMapping("index")
	public void index(@RequestParam("id") String id, HttpSession session) {
		if(session.getAttribute("loginUser") != null) {
			session.invalidate();
		}
		session.setAttribute(LOGIN, id);
	}
	
	
	// 로그아웃 -> 인덱스 페이지로
	@GetMapping("memberLogout")
	public String memberLogout(HttpSession session) {
		if(session.getAttribute("loginUser") != null) {
			session.invalidate();
		}
		return "yoonhee/index";
	}
	
	
	// 아이디 찾기 창
	@RequestMapping("findUserIdForm")
	public String findUserIdForm() {
		return "yoonhee/findUserIdForm";
	}
	
	// 아이디 찾기 -> 이메일, 휴대폰 번호
	@PostMapping("findUserId")
	public String findUserId(HttpServletRequest request, RedirectAttributes ra, Model model) {
		int result = ms.findUserId(request, model);
		if(result == 1) {
			ra.addFlashAttribute("findId", model.getAttribute("findUserId"));
			return "redirect:findUserIdResult";
		}
		return "redirect:findUserIdResult";
		
	}
	
	// 아이디 찾기 결과
	@RequestMapping("findUserIdResult")
	public String findUserIdResult() {
		return "yoonhee/findUserIdResult";
	}
	
	
	// 비밀번호 찾기
	@RequestMapping("findUserPwdForm")
	public String findUserPwdForm() {
		return "yoonhee/findUserPwdForm";
	}
	
	// 비밀번호 찾기
	@PostMapping("findUserPwd")
	public String findUserPwd(HttpServletRequest request, RedirectAttributes ra, Model model) {
		int result = ms.findUserPwd(request, model);
		if(result == 1) {
			ra.addFlashAttribute("findPwd", model.getAttribute("findUserPwd"));
			return "redirect:findUserPwdResult";
		}
		return "redirect:findUserPwdResult";
		
	}
	
	
	
}
