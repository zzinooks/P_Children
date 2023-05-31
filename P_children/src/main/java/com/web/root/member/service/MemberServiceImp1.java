package com.web.root.member.service;

import java.util.Random;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.web.root.member.dto.MemberDTO;
import com.web.root.mybatis.member.MemberMapper;

@Service
public class MemberServiceImp1 implements MemberService {

	@Autowired
	MemberMapper mapper;
	
	@Autowired
	CheckMailService cms;
	
	@Inject
	JavaMailSender mailSender;
	
	//============================ 박성수 시작 ===========================================
	
	
	
	@Override
	public String registMember(HttpSession session, MemberDTO dto) {
		String message = "";
		int result = mapper.registMember(dto);
		session.setAttribute("login_id", dto.getId());
		if(result == 1) {
			message = "회원가입 완료.";
		}
		return message;
	}
	
	@Override
	public String getMemberInfo(String id) {
		MemberDTO dto = new MemberDTO();
		dto = mapper.getMemberInfo(id);
		if(dto == null) {
			return "OK";
		}
		return "NO";
	}
	
	@Override
	public String checkEmail(String email) {
		MemberDTO dto = new MemberDTO();
		dto = mapper.checkEmail(email);
		if(dto == null) {
			return "OK";
		}
		return "NO";
	}
	
	@Override
	public int sendEmail(String email) {
		return cms.sendEmail(email); 
		
	}
	
	
	//============================ 박성수 끝 ===========================================
	
	
	//============================ 최윤희 ===========================================	
	 
	
	// 로그인 유저 체크
	@Override
	public int userCheck(HttpServletRequest request) {
		MemberDTO dto = mapper.userCheck(request.getParameter("id"));

		if(dto != null) {
			if(request.getParameter("pwd").equals(dto.getPwd())) {
				return 1; // 로그인 성공
			}
		}
		return 0; // 로그인 실패
		
	}
	
	
	// 아이디 찾기
	@Override
	public int findUserId(HttpServletRequest request, Model model) {
		MemberDTO dto = mapper.findUserId(request.getParameter("findUserEmail"));
		
		if(dto != null) {
			if(request.getParameter("findUserPhone").equals(dto.getPhone())) {
				model.addAttribute("findUserId", dto);
				return 1;
			}
		}
		
		return 0;
	}
	
	
	// 비밀번호 찾기
	@Override
	public int findUserPwd(HttpServletRequest request, Model model) {
		MemberDTO dto = mapper.findUserPwd(request.getParameter("findUserId"));
		
		if(dto != null) {
			if(request.getParameter("findUserEmail").equals(dto.getEmail())) {
				model.addAttribute("findUserPwd", dto);
				return 1;
			}
		}
		
		return 0;
	}
	
	
	
	// 비밀번호 찾고 비밀번호 수정
	/*
	@Override
	public void userRePwd(HttpServletRequest request) {
		 mapper.userRePwd(request.getParameter("id"), request.getParameter("newPwd")); 
	}
	*/
	
	
	
	
	
}











