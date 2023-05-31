package com.web.root.member.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface MemberService {

	//============================ 최윤희 ===========================================
	
	public int userCheck(HttpServletRequest request);
	
	// 아이디 찾기
	public int findUserId(HttpServletRequest request, Model model);
	
	// 비밀번호 찾기
	public int findUserPwd(HttpServletRequest request, Model model);
	
}
