package com.web.root.member.service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.web.root.member.dto.MemberDTO;
import com.web.root.member.dto.MemberDTO;


public interface MemberService {
	
	//============================ 임청규 시작 ===========================================
	
	public int userCheck(HttpServletRequest request);
	public void userInfo(String id, Model model);
	
	public void info(String userid, Model model);
	
	public void memberInfo(Model model, int num);
	public void manager_board(Model model, int num);
	public void manager_qna(Model model, int num);

	//============================ 임청규 끝 ===========================================
	
	
	//============================ 박성수 시작 ===========================================
	
	public String registHost(MemberDTO dto);

	public String getHostInfo(String id);
	
	String checkEmail(String email);
	
	int sendEmail(String email);
	
	public String getkakaoToken(String code, String tokenurl) throws IOException;
	
	public String getKakaoId(String token, String kakaoidurl) throws IOException;
	
	//============================ 박성수 끝 ===========================================

	
	
	
	
	//============================ 최윤희 시작 ===========================================
	
	
	public int findUserId(HttpServletRequest request, Model model);
	
	public int findUserPwd(HttpServletRequest request, Model model);
	
	// 비밀번호 찾기 메일 인증
	public int sendFindPwdEmailCode(String email);
	
	public void userUpdatePwd(MemberDTO dto);
	
	public void userUpdateHostPwd(MemberDTO hostDTO);
	
	public int userCheckHost(HttpServletRequest request);
	
	
	
	//============================ 최윤희 끝 ===========================================
	
}
