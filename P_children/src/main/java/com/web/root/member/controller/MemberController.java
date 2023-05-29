package com.web.root.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("member")
public class MemberController {

	//============================ 박성수 ===========================================
	
	@RequestMapping("registForm")
	public String memberRegistFrom() {
		return "member/memberRegistForm";
	}
	
	
	
	
	//============================ 박성수 ===========================================
	
	
	
}
