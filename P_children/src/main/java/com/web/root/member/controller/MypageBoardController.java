package com.web.root.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.root.board.dto.BoardDTO;
import com.web.root.board.dto.ProgramBoardDTO;
import com.web.root.board.service.BoardService;
import com.web.root.member.dto.MemberDTO;
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
	
	// (커뮤니티) 마이페이지 작성한 게시글 목록
	@RequestMapping("write/mypageBoardWriteList")
	public String mypageBoardWriteList(HttpSession session, Model m,
									  @RequestParam(value="num", required = false, defaultValue="1") int num,
									  HttpServletRequest request) {

		// 세션에 저장된 아이디 값 가져오기 (해당 로그인 아이디값이 저장된다.)
		// 이것 때문에 url에 아이디 표시안할 수 있다. (@RequestParm 하면 주소에 담아야하는것같습니다??)
		// ex) syso하면 yoonhee 해당 아이디가 출력됨
		String id = (String)session.getAttribute(LOGIN);
		
		// 로그인을 했을 때 아이디 정보값을 가져온다.
		if(id != null) {  
			ms.userInfo(id, m); // 회원정보 저장 ex. info.id
		}
		
		//=== 마이페이지 관련 정보
		BoardDTO boardCheckNum = new BoardDTO();
		// 마이페이지 커뮤니티 게시글 -> 제목클릭 -> board contentViewf -> 다시 글목록 클릭 시 마이페이지 게시글로 오도록 정보값 지정
		m.addAttribute("myBoardCheckNum", boardCheckNum.getBoardNum());
		//====
		
		mbs.mypageBoardCommunityWriteList(id, m, num); 	// 커뮤니티 게시판 페이징, 카운트 얻는 mbs: 아이디, 모델, 페이지번호 넘겨줌
		
		m.addAttribute("num", num); 		 			// 페이지 번호 저장
		return "mypageBoard/write/mypageBoardWriteList";
	}
	
	
	// (프로그램) 마이페이지 작성한 게시글 목록 (member, host 구분)
	@RequestMapping("write/mypageBoardProgramWriteList")
	public String mypageBoardProgramWriteList(HttpSession session, Model m,
									  		  @RequestParam(value="num", required = false, defaultValue="1") int num,
									  		  HttpServletRequest request) {

		// 세션에 저장된 아이디 값 가져오기 (해당 로그인 아이디값이 저장된다.)
		// 이것 때문에 url에 아이디 표시안할 수 있다. (@RequestParm 하면 주소에 담아야하는것같습니다??)
		// ex) syso하면 yoonhee 해당 아이디가 출력됨
		String id = (String)session.getAttribute(LOGIN);
		
		// 로그인을 했을 때 아이디 정보값을 가져온다.
		if(id != null) {  
			ms.userInfo(id, m); // 회원정보 저장 ex. info.id
		}
		
		//=== 마이페이지 관련 정보
		ProgramBoardDTO programBoardCheckNum = new ProgramBoardDTO();
		// 마이페이지 커뮤니티 게시글 -> 제목클릭 -> board contentViewf -> 다시 글목록 클릭 시 마이페이지 게시글로 오도록 정보값 지정
		m.addAttribute("programBoardCheckNum", programBoardCheckNum.getProgramBoardNum());
		//===
		
		mbs.mypageBoardProgramWriteList(id, m, num); // 프로그램 게시판 페이징, 카운트 얻는 mbs: 아이디, 모델, 페이지번호 넘겨줌

		m.addAttribute("num", num); 		 		 // 페이지 번호 저장
		
		return "mypageBoard/write/mypageBoardProgramWriteList";
	}
	
	
}











