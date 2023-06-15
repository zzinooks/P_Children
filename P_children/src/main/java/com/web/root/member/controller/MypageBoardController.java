package com.web.root.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.root.board.service.BoardService;
import com.web.root.member.service.MemberService;
import com.web.root.member.service.MypageBoardService;
import com.web.root.session.name.MemberSession;

@Controller
@RequestMapping("mypageBoard")
public class MypageBoardController implements MemberSession {

	@Autowired
	private MypageBoardService mbs;
	
	@Autowired
	private MemberService ms;
	
	@Autowired
	private BoardService bs;
	
	// 내가 작성한 글
	@RequestMapping("write/mypageBoardWriteList")
	public String mypageBoardWriteList(HttpSession session, Model m,
									  @RequestParam(value="num", required = false, defaultValue="1") int num,
									  HttpServletRequest request) {

		// 세션에 저장된 아이디 값 가져오기 (해당 로그인 아이디값이 저장된다.)
		// 이것 때문에 url에 아이디 표시안할 수 있다. (requestParm 하면 주소에 담아야할듯함)
		String id = (String)session.getAttribute(LOGIN); 
		
		// 로그인을 했을 때 아이디 정보값을 가져온다.
		if(id != null) {
			ms.userInfo(id, m); // 회원정보 저장 ex. info.id
		}
		
		mbs.mypageBoardWriteList(id, m, num);
		m.addAttribute("num", num);
		
		return "mypageBoard/write/mypageBoardWriteList";
	}
	
	
}











