package com.web.root.member.controller;

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
public class MemberController implements MemberSession {

	//============================ 박성수 시작 ===========================================
	
	@Autowired
	MemberService ms;
	
	
	
	@RequestMapping("registForm")
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
	
	
	
	//============================ 최윤희 ===========================================
	

	
	
	
	
}
