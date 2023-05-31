package com.web.root.member.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.web.root.member.dto.MemberDTO;
import com.web.root.mybatis.member.MemberMapper;

@Service
public class MemberServiceImp1 implements MemberService {

	//============================ 최윤희 ===========================================	
	
	@Autowired
	private MemberMapper mapper; 
	
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
	
	
	
	
	
	
	
	
}











