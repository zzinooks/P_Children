package com.web.root.member.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.root.member.dto.MemberDTO;
import com.web.root.mybatis.member.MemberMapper;

@Service
public class MemberServiceImp1 implements MemberService {
	
	@Autowired
	MemberMapper mapper;
	
	@Override
	public String registMember(HttpSession session, MemberDTO dto) {
		String message = "";
		int result = mapper.registMember(dto);
		session.setAttribute("login_id", dto.getId());
		if(result == 1) {
			message = "회원가입이 완료되었습니다.";
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
}
