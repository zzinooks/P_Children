package com.web.root.member.service;

import org.springframework.ui.Model;

public interface MypageBoardService {

	// (커뮤니티) 마이페이지 작성글 목록(아이디, 모델, 페이지번호)
	public void mypageBoardCommunityWriteList(String id, Model m, int num);
	
	// (프로그램) 마이페이지 작성글 목록(아이디, 모델, 페이지번호) 
	public void mypageBoardProgramWriteList(String id, Model m, int num);
	
}
