package com.web.root.mybatis.member;

import com.web.root.member.dto.MemberDTO;

public interface MemberMapper {

	int registMember(MemberDTO dto);

	MemberDTO getMemberInfo(String id);
	
}
