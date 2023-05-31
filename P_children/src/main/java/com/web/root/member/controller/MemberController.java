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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.root.member.dto.MemberDTO;
import com.web.root.member.service.MemberService;
import com.web.root.session.name.MemberSession;

@Controller
// @RequestMapping("member")
public class MemberController implements MemberSession {

	@Autowired
	private MemberService ms;
	
	// 인덱스 + 로그인 여부
	@GetMapping("index")
	public String index() {
		return "index";
	}
	
	
	//============================ 박성수 시작 ===========================================
	
	
	
	
	@RequestMapping("member/memberRegistForm")
	public String memberRegistFrom(@RequestParam("email") String email, Model model) {
		model.addAttribute("checkedEmail", email);
		return "member/memberRegistForm";
	}
	
	@PostMapping("regist")
	public String memberRegist(HttpSession session, MemberDTO dto) {
		String message = ms.registMember(session, dto);
		return "sungsu/main";
	}
	
	@RequestMapping("checkId")
	@ResponseBody
	public String check_id(@RequestParam("id") String id) {
		String result = ms.getMemberInfo(id);
		return result;
	}
	
	@GetMapping("emailCheck")
	public String emailCheckForm() {
		return "member/emailCheck";
	}
	
	@RequestMapping("checkEmail")
	@ResponseBody
	public String check_email(@RequestParam("email") String email) {
		String result = ms.checkEmail(email);
		return result;
	}
	
	@GetMapping("sendEmail")
	@ResponseBody
	public int sendEmail(@RequestParam("email") String email) {
		return ms.sendEmail(email);
		
	}
	
	
	//============================ 박성수 끝 ===========================================
	
//	@RequestMapping("registForm")
//	public String memberRegistFrom() {
//		return "member/memberRegistForm";
//	}
	
	
//	@RequestMapping("registForm")
//	public String memberRegistFrom() {
//		return "member/memberRegistForm";
//	}
	
	
	
	
	//============================ 최윤희 ===========================================
	

		// 로그인 입력창
		@GetMapping("yoonhee/memberLoginForm")
		public String memberLoginForm() {
			return "yoonhee/memberLoginForm";
		}
		
		// 로그인 시 아이디 체크
		@PostMapping("yoonhee/userCheck")
		public String userCheck(HttpServletRequest request, RedirectAttributes ra) {
			
			int result = ms.userCheck(request);
			
			if(result == 1) {
				ra.addAttribute("id", request.getParameter("id"));
				return "redirect:memberLoginSuccess";  // 로그인 성공
			} else {
				return "yoonhee/memberLoginForm";  // 로그인 실패
			}
			
		}
		
		// 로그인 성공
		@GetMapping("yoonhee/memberLoginSuccess")
		public String memberLoginSuccess(@RequestParam("id") String id, HttpSession session) {
			session.setAttribute(LOGIN, id);  // 아이디 세션 저장
			return "index";
		}
		
		
		// 로그아웃 -> 인덱스 페이지로
		@GetMapping("yoonhee/memberLogout")
		public String memberLogout(HttpSession session) {
			if(session.getAttribute("loginUser") != null) {
				session.invalidate();  // 아이디 세션 무효화
			}
			return "index";
		}
		
		
		
		// 아이디 찾기 창
		@RequestMapping("yoonhee/findUserIdForm")
		public String findUserIdForm() {
			return "yoonhee/findUserIdForm";
		}
		
		// 아이디 찾기 -> 이메일, 휴대폰 번호
		@PostMapping("yoonhee/findUserId")
		public String findUserId(HttpServletRequest request, RedirectAttributes ra, Model model) {
			int result = ms.findUserId(request, model);
			if(result == 1) {
				ra.addFlashAttribute("findId", model.getAttribute("findUserId"));
				return "redirect:findUserIdResult";
			}
			return "redirect:findUserIdResult";
			
		}
		
		// 아이디 찾기 결과
		@RequestMapping("yoonhee/findUserIdResult")
		public String findUserIdResult() {
			return "yoonhee/findUserIdResult";
		}
		
		
		
		// 비밀번호 찾기 페이지
		@RequestMapping("yoonhee/findUserPwdForm")
		public String findUserPwdForm() {
			return "yoonhee/findUserPwdForm";
		}
		
		// 비밀번호 찾기
		@PostMapping("yoonhee/findUserPwd")
		public String findUserPwd(HttpServletRequest request, RedirectAttributes ra, Model model) {
			int result = ms.findUserPwd(request, model);
			if(result == 1) {
				ra.addFlashAttribute("findPwd", model.getAttribute("findUserPwd"));
				return "redirect:findUserPwdResult";  // 비밀번호 찾기 성공하면 결과 페이지로
			}
			return "yoonhee/findUserPwdForm"; // 비밀번호 찾기 실패하면 찾기 form 페이지로
			
		}
		
		
		// 비밀번호 찾기 결과 페이지
		@GetMapping("yoonhee/findUserPwdResult")
		public String findUserPwdResult() {
			return "yoonhee/findUserPwdResult";
		}
	
		
		
		// 비밀번호 찾기에서 비밀번호 수정
		/*
		@PostMapping("yoonhee/userRePwd")
		public String userRePwd(HttpServletRequest request) {
			ms.userRePwd(request);
			return "yoonhee/findUserPwdForm";
		}
		*/
		
		
		/*
		// 로그인 성공 + 쿠키 생성 
		@GetMapping("yoonhee/memberLoginSuccess")
		public String memberLoginSuccess(HttpServletRequest request, @RequestParam("id") String id, @RequestParam("rememberId")boolean check, HttpSession session) {
			String id = request.getParameter("id");
			String check = request.getParameter("id");
			session.setAttribute(LOGIN, id);  // 아이디 세션 저장
			
			if(check == true){
				Cookie CookieCode = new Cookie("CookieId", String.valueOf(디티오.Id);
				HttpServletResponse.addCookie(CookieCode);
			}
			
			return "index";
		}
		*/
		
		// 아이디 기억하기(쿠키)
//		@PostMapping("")
//		public boolean cookieCheck(@RequestParam("rememberId")boolean check) {
//			
//		}
		
		
		
		
		
	
	
}
