package com.web.root.member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.web.root.member.dto.MemberDTO;

public interface MemberService {

	//============================ 박성수 시작 ===========================================
	String registMember(HttpSession session, MemberDTO dto);

	String getMemberInfo(String id);
	
	String checkEmail(String email);
	
	int sendEmail(String email);
	
	
	//============================ 박성수 끝 ===========================================

	
	//============================ 최윤희 ===========================================
	
	public int userCheck(HttpServletRequest request);
	
	// 아이디 찾기
	public int findUserId(HttpServletRequest request, Model model);
	
	// 비밀번호 찾기
	public int findUserPwd(HttpServletRequest request, Model model);

	

	
	
}
