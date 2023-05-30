package com.web.root.member.service;

<<<<<<< HEAD
import javax.servlet.http.HttpSession;

import com.web.root.member.dto.MemberDTO;
=======
import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
>>>>>>> branch 'main' of https://github.com/ssp930/P_Children.git

public interface MemberService {

<<<<<<< HEAD
	String registMember(HttpSession session, MemberDTO dto);

	String getMemberInfo(String id);

=======
	//============================ 최윤희 ===========================================
	
	public int userCheck(HttpServletRequest request);
	
	// 아이디 찾기
	public int findUserId(HttpServletRequest request, Model model);
	
	// 비밀번호 찾기
	public int findUserPwd(HttpServletRequest request, Model model);
	
>>>>>>> branch 'main' of https://github.com/ssp930/P_Children.git
}
