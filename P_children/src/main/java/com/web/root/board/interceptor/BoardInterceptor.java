package com.web.root.board.interceptor;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.web.root.session.name.MemberSession;

public class BoardInterceptor extends HandlerInterceptorAdapter implements MemberSession{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		if(session.getAttribute(LOGIN) == null && session.getAttribute("kakaoId") == null) {
			session.setAttribute(LOGIN, "noLogin");
			return true;
		}
		return true;
	}
	
	

}
