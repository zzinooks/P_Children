package com.web.root.member.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface MemberService {
	
	public int userCheck(HttpServletRequest request);
	public void userInfo(String id, Model model);
	
	public void info(String userid, Model model);
	
	public void memberInfo(Model model, int num);
	public void manager_board(Model model, int num);
	public void manager_qna(Model model, int num);

}
