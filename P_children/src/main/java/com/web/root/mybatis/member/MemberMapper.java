package com.web.root.mybatis.member;

import com.web.root.member.dto.MemberDTO;

public interface MemberMapper {

	//============================ 최윤희 ===========================================
	
	public MemberDTO userCheck(String id);
	
	// 아이디 찾기
	public MemberDTO findUserId(String findUserEmail);
	
	// 비밀번호 찾기
	public MemberDTO findUserPwd(String findUserId);
	
}
