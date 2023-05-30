package com.web.root.member.service;

import javax.servlet.http.HttpSession;

import com.web.root.member.dto.MemberDTO;

public interface MemberService {

	String registMember(HttpSession session, MemberDTO dto);

	String getMemberInfo(String id);

}
