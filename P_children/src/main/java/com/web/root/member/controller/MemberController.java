package com.web.root.member.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.Spring;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.root.member.dto.HostDTO;
import com.web.root.member.dto.MemberDTO;
import com.web.root.member.service.MemberService;
import com.web.root.session.name.MemberSession;

@Controller
@RequestMapping("member")
public class MemberController implements MemberSession{
	
	@Autowired
	private MemberService ms;
	
	
	//============================ 임청규 ===========================================
	
	// 회원정보 
	public void userInfo(String id, Model model){
		ms.userInfo(id,model);
	} 
	
	
	// 로그인 정보가져오기
	@RequestMapping("member_information")
	public String member_information( HttpSession session,Model model) {
		Object objUserid = session.getAttribute(LOGIN);
		String userid = String.valueOf(objUserid);
		ms.info(userid, model);
		return "chenggyu/member_information";
	}
	
	@RequestMapping("member_modify")
	public String member_modify() {
		return "chenggyu/member_modify";
	}
	
	@RequestMapping("member_leave")
	public String member_leave() {
		return "chenggyu/member_leave";
	}
	
	@RequestMapping("member_board")
	public String member_board() {
		return "chenggyu/member_board";
	}
	
	@RequestMapping("member_qna")
	public String member_qna() {
		return "chenggyu/member_qna";
	}
	
	@RequestMapping("manager_information")
	public String manager_information(HttpSession session,Model model) {
		Object objUserid = session.getAttribute(LOGIN);
		String userid = String.valueOf(objUserid);
		ms.info(userid, model);
		return "chenggyu/manager_information";
	}
	
	@RequestMapping("manager_memberList")
	public String manager_List(Model model, @RequestParam(value="num", required = false, defaultValue="1") int num) {
		ms.memberInfo(model, num);
		return "chenggyu/manager_memberList";
	}
	
	@RequestMapping("manager_board")
	public String manager_board(Model model, @RequestParam(value="num", required = false, defaultValue="1") int num) {
		ms.manager_board(model, num);
		return "chenggyu/manager_board";
	}
	
	@RequestMapping("manager_qna")
	public String manager_qna(Model model, @RequestParam(value="num", required = false, defaultValue="1") int num) {
		ms.manager_qna(model, num);
		return "chenggyu/manager_qna";
	}
	

	//============================ 임청규 끝 ===========================================
	

	
	
	//============================ 박성수 시작 ===========================================
	
	@RequestMapping("registForm")
	public String memberRegistFrom(@RequestParam("email") String email, Model model) {
		model.addAttribute("checkedEmail", email);
		return "member/memberRegistForm";
	}
	
	@RequestMapping("registForm_host")
	public String hostRegistFrom(@RequestParam("email") String email, Model model) {
		model.addAttribute("checkedEmail", email);
		return "member/hostRegistForm";
	}
	
	@PostMapping("regist")
	public String memberRegist(HttpSession session, MemberDTO dto) {
		String message = ms.registMember(session, dto);
		return "sungsu/main";
	}
	
	@PostMapping("regist_host")
	public String hostRegist(HostDTO dto) {
		String message = ms.registHost(dto);
		return "sungsu/main";
	}
	
	@RequestMapping("checkId")
	@ResponseBody
	public String check_id(@RequestParam("id") String id) {
		String result = ms.getMemberInfo(id);
		return result;
	}
	
	@RequestMapping("checkId_host")
	@ResponseBody
	public String check_id_host(@RequestParam("id") String id) {
		String result = ms.getHostInfo(id);
		return result;
	}
	
	@GetMapping("emailCheck")
	public String emailCheckForm() {
		return "member/emailCheck";
	}
	
	@GetMapping("emailCheck_host")
	public String emailCheckForm_host() {
		return "member/emailCheck_host";
	}
	
	@RequestMapping("checkEmail")
	@ResponseBody
	public String check_email(@RequestParam("email") String email) {
		String result = ms.checkEmail(email);
		return result;
	}
	
	@RequestMapping("checkEmail_host")
	@ResponseBody
	public String check_email_host(@RequestParam("email") String email) {
		String result = ms.checkEmail_host(email);
		return result;
	}
	
	@GetMapping("sendEmail")
	@ResponseBody
	public int sendEmail(@RequestParam("email") String email) {
		return ms.sendEmail(email);
		
	}
	
	
	//============================ 박성수 끝 ===========================================
	
	
	//============================ 최윤희 시작 ===========================================
	
	
	// 로그인 입력창
	@RequestMapping("memberLoginForm")
	public String memberLoginForm() {
		return "yoonhee/memberLoginForm";
	}

		
	// 로그인 시 아이디 체크
	@RequestMapping("userCheck")
	public String userCheck(HttpServletRequest request, RedirectAttributes ra, Model m, HttpServletResponse response) {
		
		int result = 0;
		
		String userSelect = request.getParameter("userSelect");
		System.out.println(userSelect);
		
		// member랑 host 구분
		if(userSelect.equals("member")) {
			result = ms.userCheck(request);
		} else if(userSelect.equals("host")) {
			result = ms.userCheckHost(request);
		}
		
		
		if(result == 1) { // 아이디를 성공적으로 찾았으면
			ra.addAttribute("id", request.getParameter("id"));
			
			String checked = request.getParameter("testChek");  // 확인
			// System.out.println(checked);
			
			if(checked.equals("true")) { // 아이디 기억하기가 check 이면
				//System.out.println("쿠키 생성 성공");
	            Cookie cookie = new Cookie("CookieId", request.getParameter("id"));
	            response.addCookie(cookie);
			} else {
				//System.out.println("쿠키 생성 실패");
	            Cookie cookie = new Cookie("CookieId", null);
	            cookie.setMaxAge(0);
	            response.addCookie(cookie);
			}
			return "redirect:memberLoginSuccess";  // 로그인 성공
		} else {
			return "yoonhee/memberLoginForm";  // 로그인 실패
		}
	}

	
	// 로그인 성공
	@RequestMapping("memberLoginSuccess")
	public String memberLoginSuccess(@RequestParam("id") String id, HttpSession session, Model model) {
		session.setAttribute(LOGIN, id);  // 아이디 세션 저장
		userInfo(id, model);
		return "chenggyu/index";
	}
	
	
	// 로그아웃 -> 인덱스 페이지로
	@GetMapping("memberLogout")
	public String memberLogout(HttpSession session) {
		if(session.getAttribute("loginUser") != null) {
			session.invalidate();  // 아이디 세션 무효화
		}
		return "chenggyu/index";
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
	
	// 비밀번호 찾기 페이지
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
			return "redirect:findUserPwdResult";  // 비밀번호 찾기 성공하면 결과 페이지로
		}
		return "yoonhee/findUserPwdForm"; // 비밀번호 찾기 실패하면 찾기 form 페이지로
		
	}
	
	
	// 비밀번호 찾기 결과 페이지
	@GetMapping("findUserPwdResult")
	public String findUserPwdResult() {
		return "yoonhee/findUserPwdResult";
	}
	
	
	// 비밀번호 찾기에서 비밀번호 수정
	@PostMapping("userRePwd")
	public String userRePwd(HttpServletRequest request) {
		MemberDTO dto = new MemberDTO();
		dto.setId(request.getParameter("id"));
		dto.setPwd(request.getParameter("newPwd"));
		ms.userRePwd(dto);
		return "chenggyu/index";
		
	}
	
	
	//============================ 최윤희 끝 ===========================================
	
	
	
}
