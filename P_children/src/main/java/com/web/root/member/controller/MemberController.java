package com.web.root.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	
	@RequestMapping("memberRegistForm")
	public String memberRegistFrom() {
		return "member/memberRegistForm";
	}
}
