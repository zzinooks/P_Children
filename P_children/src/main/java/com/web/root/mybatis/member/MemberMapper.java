package com.web.root.mybatis.member;

import com.web.root.member.dto.MemberDTO;

public interface MemberMapper {

	//============================ 박성수 시작 ===========================================
	
	int registMember(MemberDTO dto);

	MemberDTO getMemberInfo(String id);
	
	MemberDTO checkEmail(String email);
	
	//============================ 박성수 끝 ===========================================
	
	
	
	//============================ 최윤희 ===========================================
	
	public MemberDTO userCheck(String id);
	
	// 아이디 찾기
	public MemberDTO findUserId(String findUserEmail);
	
	// 비밀번호 찾기
	public MemberDTO findUserPwd(String findUserId);

	
	
	// 비밀번호 찾고 비밀번호 수정
	//public void userRePwd(String id, String newPwd);
	
}
