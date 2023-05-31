package com.web.root.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.root.session.name.MemberSession;

@Controller
@RequestMapping("member")
public class MemberController implements MemberSession {

	//============================ 박성수 ===========================================
	
	@RequestMapping("registForm")
	public String memberRegistFrom() {
		return "member/memberRegistForm";
	}
	
	
	
	
	//============================ 최윤희 ===========================================
	

	
	
	
	
}
