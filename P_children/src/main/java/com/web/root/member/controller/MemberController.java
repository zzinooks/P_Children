package com.web.root.member.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.root.member.dto.MemberDTO;
import com.web.root.member.service.MemberService;
import com.web.root.session.name.MemberSession;

@Controller
@RequestMapping("member")
public class MemberController implements MemberSession{
	
	@Autowired
	private MemberService ms;

	//============================ 박성수 ===========================================
	
	@RequestMapping("registForm")
	public String memberRegistFrom() {
		return "member/memberRegistForm";
	}
	
	
	
	
	//============================ 임청규 ===========================================
	
	// 회원정보 
	public void userInfo(String id, Model model){
		ms.userInfo(id,model);
	} 
	
	// 로그인 입력창
	@RequestMapping("memberLoginForm")
	public String memberLoginForm() {
		return "chenggyu/memberLoginForm";
	}
	
	// 로그인 시 아이디 체크
	@RequestMapping("userCheck")
	public String userCheck(HttpServletRequest request, RedirectAttributes ra, Model m) {
		
		int result = ms.userCheck(request);
		
		if(result == 1) {
			ra.addAttribute("id", request.getParameter("id"));
			return "redirect:memberLoginSuccess";  // 로그인 성공
		} else {
			return "chenggyu/memberLoginForm";  // 로그인 실패
		}
		
	}
	
	// 로그인 성공
	@RequestMapping("memberLoginSuccess")
	public String memberLoginSuccess(@RequestParam("id") String id, HttpSession session, Model model) {
		session.setAttribute(LOGIN, id);  // 아이디 세션 저장
		userInfo(id, model);
		return "chenggyu/memberLoginSuccess";
	}
	
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
	
	
	
}
