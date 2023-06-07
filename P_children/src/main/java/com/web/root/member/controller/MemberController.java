package com.web.root.member.controller;

import java.io.IOException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	// 개인정보 관리자정보 
	@RequestMapping("member_information")
	public String member_information( Model model, HttpServletRequest request, HttpSession session) {
		String id = (String) session.getAttribute(LOGIN);
		MemberDTO dto = ms.member_information(id);
		model.addAttribute("dto", dto);
		return "chenggyu/member_information";
	}
	
	// 개인정보 수정
	@RequestMapping("member_modify")
	public String member_modify(HttpSession session,Model model) {
		String id = (String) session.getAttribute(LOGIN);
		MemberDTO dto = ms.member_information(id);
		model.addAttribute("dto", dto);
		return "chenggyu/member_modify";
	}
	
	// 개인정보 수정
	@PostMapping("modify_save")
	@ResponseBody
	public void modify_save(HttpServletRequest request) {
		ms.modify_save(request);
	}
	
	// 회원 탈퇴
	@RequestMapping("member_leave")
	public String member_leave(HttpSession session,Model model) {
		String id = (String) session.getAttribute(LOGIN);
		MemberDTO dto = ms.member_information(id);
		model.addAttribute("dto", dto);
		return "chenggyu/member_leave";
	}
	
	// 회원 탈퇴
	@PostMapping("member_leave_save")
	@ResponseBody
	public void member_leave_save(HttpServletRequest request, HttpSession session) {
		ms.member_leave_save(request);
		if(session.getAttribute("loginUser") != null) {
			session.invalidate();  // 아이디 세션 무효화
		}
	}
	
	@RequestMapping("member_board")
	public String member_board(Model model, HttpSession session, @RequestParam(value="num", required = false, defaultValue="1" )int num ) {
		String id = (String) session.getAttribute(LOGIN);
		MemberDTO dto = ms.member_information(id);
		ms.member_board(model, num);
		model.addAttribute("dto", dto);
		return "chenggyu/member_board";
	}
	
	@RequestMapping("member_qna")
	public String member_qna() {
		return "chenggyu/member_qna";
	}
	
	@RequestMapping("manager_information")
	public String manager_information(HttpSession session, HttpServletRequest request, Model model) {
		String id = (String) session.getAttribute(LOGIN);
		MemberDTO dto = ms.member_information(id);
		model.addAttribute("dto", dto);
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
		return "member/RegistForm";
	}
	
	@PostMapping("registMember")
	public String hostRegist(MemberDTO dto, HttpServletRequest request) {
		String addrMerge = request.getParameter("addr1") + "/" 
				  +request.getParameter("addr2") + "/"
				  +request.getParameter("addr3") + "/"
				  +request.getParameter("zonecode") + "/";
		dto.setAddr(addrMerge);
		String message = ms.registHost(dto);
		return "sungsu/main";
	}
	
	@RequestMapping("checkId")
	@ResponseBody
	public String check_id_host(@RequestParam("id") String id) {
		String result = ms.getHostInfo(id);
		return result;
	}
	
	@GetMapping("emailCheck")
	public String emailCheckForm(@RequestParam String userSelect, HttpServletResponse response) {
		Cookie cookie = new Cookie("userSelect", userSelect);
		response.addCookie(cookie);
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
	
	@GetMapping("kakaoLoginButton")
	public String kakaoLoginButton() {
		return "sungsu/kakaoLogin";
	}
	
	
	private static final String tokenURL = "https://kauth.kakao.com/oauth/token";
	private static final String kakaoIdURL = "https://kapi.kakao.com/v2/user/me";
	@GetMapping("kakaoCode")
	public String getKakaoCode(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String code = request.getParameter("code");
		String token = ms.getkakaoToken(code, tokenURL);
		String userId = ms.getKakaoId(token, kakaoIdURL);
		System.out.println(userId);
//		String kakaoMemberInfo = ms.getKakaoInfo()
		return "redirect:/index";
		
	}
	
	@PostMapping("kakaoToken")
	public String getToken(HttpServletRequest request) {
		return "redirect:/index";
	}
	
	
	//============================ 박성수 끝 ===========================================
	
	
	//============================ 최윤희 시작 ===========================================
	
	
	// 로그인 폼 
	@RequestMapping("memberLoginForm")
	public String memberLoginForm() {
		return "yoonhee/memberLoginForm";
	}

		
	// 로그인 시 아이디 체크
	@RequestMapping("userCheck")
	public String userCheck(HttpServletRequest request, Model m, HttpServletResponse response, HttpSession session) {
		
		int result = 0;
		
		// member or host 선택
		String userSelect = request.getParameter("userSelect");
		
		// member랑 host 구분
		if(userSelect.equals("member")) {
			result = ms.userCheck(request);
		} else if(userSelect.equals("host")) {
			result = ms.userCheckHost(request);
		}
		
		if(result == 1) { // 아이디를 성공적으로 찾았으면
			String id = request.getParameter("id");
			session.setAttribute(LOGIN, id);  // 아이디 세션 저장
			
			userInfo(id, m);
			MemberDTO dto = (MemberDTO)m.getAttribute("info");
			//System.out.println(dto.getGrade());
			session.setAttribute("grade", dto.getGrade());
			
			String checked = request.getParameter("testChek");  // 아이디 기억하기 체크박스 true/false
			
			if(checked.equals("true")) {
	            Cookie cookie = new Cookie("CookieId", request.getParameter("id"));
	            response.addCookie(cookie);
			} else {
	            Cookie cookie = new Cookie("CookieId", null);
	            cookie.setMaxAge(0);
	            response.addCookie(cookie);
			}
			return "chenggyu/index";  // 로그인 성공
		} else {
			m.addAttribute("userCheckFalse", "id"); // false 값 담기위해 model 사용
			return "yoonhee/memberLoginForm";  // 로그인 실패
		}
	}
	
	// 로그아웃 -> 인덱스 페이지로
	@GetMapping("memberLogout")
	public String memberLogout(HttpSession session) {
		if(session.getAttribute("loginUser") != null) {
			session.invalidate();
		}
		return "chenggyu/index";
	}
	
	// 아이디 찾기 폼
	@RequestMapping("findUserIdForm")
	public String findUserIdForm() {
		return "yoonhee/findUserIdForm";
	}
	
	// 아이디 찾기 -> 이메일, 휴대폰 번호
	@PostMapping("findUserId")
	public String findUserId(HttpServletRequest request, Model model) {
		
		int result = 0;
		
		// member or host 선택
		String userSelect = request.getParameter("userSelect");
		
		// member랑 host 구분
		if(userSelect.equals("member")) {
			result = ms.findUserId(request, model);
		} else if(userSelect.equals("host")) {
			result = ms.findUserId(request, model);
		}
		
		// 아이디 찾은 결과
		if(result == 1) {
			return "yoonhee/findUserIdResult";
		}
		return "yoonhee/findUserIdResult";
	}
	
	// 아이디 찾기 결과
	@RequestMapping("findUserIdResult")
	public String findUserIdResult() {
		return "yoonhee/findUserIdResult";
	}
	
	// 비밀번호 찾기 폼
	@RequestMapping("findUserPwdForm")
	public String findUserPwdForm() {
		return "yoonhee/findUserPwdForm";
	}
	
	// 비밀번호 찾기 - 박성수: 수정필요.
	@PostMapping("findUserPwd")
	public String findUserPwd(HttpServletRequest request, Model model) {
		
		int result = 0;
		
		// member or host 선택
		String userSelect = request.getParameter("userSelect");
		model.addAttribute("userSelect", userSelect);
		
		// member랑 host 구분
		if(userSelect.equals("member")) {
			result = ms.findUserPwd(request, model);
		} else if(userSelect.equals("host")) {
			result = ms.findUserPwd(request, model);
		}
		
		if(result == 1) {
			return "yoonhee/findUserPwdResult";  // 비밀번호 찾기 성공하면 결과 페이지로
		}
		return "yoonhee/findUserPwdForm"; // 비밀번호 찾기 실패하면 찾기 form 페이지로
		
	}
	
	
	// 비밀번호 찾기 메일 인증
	@GetMapping("sendFindPwdEmailCode")
	@ResponseBody
	public int sendFindPwdEmailCode(@RequestParam("email") String email) {
		return ms.sendFindPwdEmailCode(email);
	}
	
	
	// 비밀번호 찾기 결과
	@GetMapping("findUserPwdResult")
	public String findUserPwdResult() {
		return "yoonhee/findUserPwdResult";
	}
	
	
	// 비밀번호 찾기에서 비밀번호 수정
	@PostMapping("userUpdatePwd")
	public String userUpdatePwd(HttpServletRequest request) {
		
		// System.out.println(request.getParameter("userSelect"));
		
		String userSelect = request.getParameter("userSelect");
		
		if(userSelect.equals("member")) {
			MemberDTO dto = new MemberDTO();
			dto.setId(request.getParameter("id"));
			dto.setPwd(request.getParameter("newPwd"));
			ms.userUpdatePwd(dto);
			return "chenggyu/index";
			
		} else if(userSelect.equals("host")) {
			MemberDTO hostDTO = new MemberDTO();
			hostDTO.setId(request.getParameter("id"));
			hostDTO.setPwd(request.getParameter("newPwd"));
			ms.userUpdateHostPwd(hostDTO);
			return "chenggyu/index";
		}
		
		return "chenggyu/index";
	}
	
	
	//============================ 최윤희 끝 ===========================================
	
	
	
}
