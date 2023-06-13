package com.web.root.board.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.web.root.board.dto.BoardDTO;
import com.web.root.board.dto.NoticeBoardDTO;
import com.web.root.board.service.BoardFileService;
import com.web.root.board.service.BoardService;
import com.web.root.member.dto.MemberDTO;
import com.web.root.member.service.MemberService;
import com.web.root.session.name.MemberSession;

@Controller
@RequestMapping("board")
public class BoardController implements MemberSession{

	@Autowired
	BoardService bs;
	
	@Autowired
	BoardFileService bfs;
	
	@Autowired
	MemberService ms;
	
	//============================ 주진욱 시작 ===========================================
	
	// board Read 기능: All List up 하기
	@GetMapping("boardAllList")
	public String boardAllList(HttpSession session, Model model, @RequestParam(value="num", required = false, defaultValue="1") int num, HttpServletRequest request ) {
		
		// boardList 생성
		bs.boardAllList(model, num, request);
		
		// 카카오톡 로그인 check
		try {
			String kakaoIdCheck = (String) session.getAttribute("kakaoId");
			
			// 로그인값 불러오기
			if(kakaoIdCheck.equals(null)) { // 일반 로그인, noLogin 인 경우
				String id = (String) session.getAttribute(LOGIN);
				ms.userInfo(id, model);
			} else {
				MemberDTO memberDTO = new MemberDTO();
				memberDTO.setId(kakaoIdCheck);
				memberDTO.setGrade("bronze");
				model.addAttribute("info", memberDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		// 로그인 유저 grade 확인을 위한 "admin" 모델에 추가하기
		model.addAttribute("admin", ADMIN);
		return "/board/boardAllList"; 
	}
	
	// board Create 기능을 위한 Form 생성
	@RequestMapping("writeForm")
	public String writeForm(HttpSession session, Model model) {
		
		String id = (String) session.getAttribute(LOGIN);
		model.addAttribute("user", id);
		return "/board/writeForm";
	}
	
	// board Create 기능 : 실제 DB 작업 시행
	@PostMapping("writeSave")
	public void writeSave(Model model, MultipartHttpServletRequest mul, 
							HttpServletResponse response, 
							HttpServletRequest request) throws IOException {
		
		// board 입력 및 결과 메시지 출력
		String message = bs.writeSave(mul,request);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(message);
	}
	
	// board Read 기능 : content 하나 보기
	@RequestMapping("contentView")
	public String contentView(Model model, HttpServletRequest request, HttpSession session, HttpServletResponse response) throws Exception {
		
		BoardDTO dto = bs.contentView(model, request);
		String user = (String) session.getAttribute(LOGIN);
		
		model.addAttribute("dto", dto);
		model.addAttribute("user", user);
		
		try {
			// 카카오톡 로그인 check
			String kakaoIdCheck = (String) session.getAttribute("kakaoId");
			
			// 로그인값 불러오기
			if(kakaoIdCheck.equals(null)) { // 일반 로그인, noLogin 인 경우
				String id = (String) session.getAttribute(LOGIN);
				ms.userInfo(id, model);
			} else {
				MemberDTO memberDTO = new MemberDTO();
				memberDTO.setId(kakaoIdCheck);
				memberDTO.setGrade("bronze");
				model.addAttribute("info", memberDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("admin", ADMIN);
		
		
		bs.hitplus(dto);
		return "/board/contentView";
	}
	
	// board 파일 업로드시 이미지에 보이게 하기
	@GetMapping("download")
	public void download(@RequestParam("file_name") String file_name, HttpServletResponse response) throws Exception {
		
		response.addHeader("Content-disposition", "attachment; fileName=" +URLEncoder.encode(file_name, "utf-8"));
		File file = new File(BoardFileService.IMAGE_REPO + "\\" + file_name);
		FileInputStream in = new FileInputStream(file);
		FileCopyUtils.copy(in, response.getOutputStream());
		in.close();
		
	}
	
	// board Update Form 생성
	@RequestMapping("modifyForm")
	public String modifyForm(Model model, HttpServletRequest request) {
		
		BoardDTO dto = bs.contentView(model, request);
		
		model.addAttribute("dto", dto);
		return "/board/modifyForm";
	}
	
	// board Update 기능 : 수정사항 저장하기 (DB에 반영)
	@PostMapping("modifySave")
	public void modifySave(Model model,HttpServletRequest request, MultipartHttpServletRequest mul, HttpServletResponse response) throws IOException {
		
		MultipartFile file = mul.getFile("file");
		
		BoardDTO dto = bs.contentView(model, request);
		
		// 수정 파일 존재시 실제 저장된 파일 삭제
		if(file.getSize() != 0) {
			bfs.deleteFile(dto.getFile_name());
		}
		
		// board 입력 및 결과 메시지 출력
		String message = bs.modifySave(mul,request);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(message);
	
	} // modifySave() end
	
	// board Delete 기능 : (DB에 반영)
	@RequestMapping("delete")
	public void delete(Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 파일 삭제
		bfs.deleteFile(request.getParameter("file_name"));

		// write_no로 DB 내용 삭제하기
		String message = bs.deleteBoard(model,request);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(message);
	}
	
	// BoardAllList에서 category 선택시 해당 category 데이터 List up 하기
	@RequestMapping(value="selectingCategory/{category}", produces="application/json; charset=utf-8")
	@ResponseBody
	public int selectingCategory(@PathVariable("category") String category, @RequestParam(value="num", required = false, defaultValue="1") int num,
			Model model, HttpSession session) {
		System.out.println("num은 " + num);
		System.out.println("여기까지" + category + "정보 잘 도착!");
		bs.selectingCategory(model,category, num);
		
		
		// 로그인 정보 저장
		String user = (String) session.getAttribute(LOGIN);
		model.addAttribute("num",num); // 페이지 번호 저장
		
		try {
			// 카카오톡 로그인 check
			String kakaoIdCheck = (String) session.getAttribute("kakaoId");
			
			// 로그인값 불러오기
			if(kakaoIdCheck.equals(null)) { // 일반 로그인, noLogin 인 경우
				String id = (String) session.getAttribute(LOGIN);
				ms.userInfo(id, model);
			} else {
				MemberDTO memberDTO = new MemberDTO();
				memberDTO.setId(kakaoIdCheck);
				memberDTO.setGrade("bronze");
				model.addAttribute("info", memberDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("admin", ADMIN); // 관리자 아이디 저장
		return 1;
	}	
	
	
	//============================ 주진욱 끝 ===========================================
	
	
	
	
	
	//============================ 최윤희 시작 ===========================================
	
	
	// 공지사항 게시판
	@RequestMapping("notice/noticeBoardAllList")						
	public String noticeBoardAllList(HttpSession session, Model model, 
									@RequestParam(value="num", required = false, defaultValue="1") int num, 
									HttpServletRequest request) {
		
		bs.noticeBoardAllList(model, num, request);
		String id = (String) session.getAttribute(LOGIN);
		
		// 로그인을 했을 때 아이디 정보값을 가져온다.
		if(id != null) {
			ms.userInfo(id, model); // 회원정보 저장
		}
		
		model.addAttribute("num",num); // 페이지 번호 저장
		
		model.addAttribute("admin", ADMIN); // 관리자 아이디 저장
		return "board/notice/noticeBoardAllList";
	}
	
	// 공지사항 게시글 보기
	@RequestMapping("notice/noticeBoardContentView")
	public String noticeBoardContentView(Model model, HttpServletRequest request, HttpSession session, 
										 HttpServletResponse response) throws Exception {
		
		//== 공지게시판에서 검색하고 글보기 했을 때 검색값들 넘겨주기
		String notice_category = request.getParameter("notice_category");				// 카테고리 옵션 저장
		String notice_searchCategory = request.getParameter("notice_searchCategory");	// 검색 카테고리 옵션 저장
		String notice_searchKeyword = request.getParameter("notice_searchKeyword");		// 검색 키워드 저장
		//===================================
		
		NoticeBoardDTO noticeBoardDTO = bs.noticeBoardContentView(request); // 요청받은 글번호로 NoticeBoardDTO 글 내용 찾아서 저장  
		String user = (String) session.getAttribute(LOGIN);  // 아이디 저장
		
		model.addAttribute("num", request.getParameter("num")); // 페이지 번호 저장 -> 글 보고 글목록 갈 때 해당 페이지로 가기위해
		model.addAttribute("noticeBoardDTO", noticeBoardDTO);  // 해당 글 번호 내용들 NoticeBoardDTO에 저장
		
		// 로그인 상태로 공지사항 게시글을 볼 때 회원 아이디와 정보 저장
		if(user != null) {
			model.addAttribute("user", user); // 회원 id 저장
			ms.userInfo(user, model); 		  // 회원 아이디로 회원 전체 정보 model에 저장(info.~)
		}
		
		model.addAttribute("admin", ADMIN); // 관리자 저장
		
		// 검색 값들 저장
		model.addAttribute("notice_category", notice_category); 			// 요청온 카테고리 옵션 저장
		model.addAttribute("notice_searchCategory", notice_searchCategory); // 요청온 검색 카테고리 저장
		model.addAttribute("notice_searchKeyword", notice_searchKeyword); 	// 요청온 검색 키워드 저장
		
		bs.noticeBoardHitplus(noticeBoardDTO); // 조회수 증가
		
		return "board/notice/noticeBoardContentView";
	}
	
	
	// 공지사항 글 작성 폼
	@RequestMapping("notice/noticeBoardWriteForm")
	public String noticeBoardWriteForm(HttpSession session, Model model) {
		
		String id = (String) session.getAttribute(LOGIN);  // 로그인 아이디 문자열로 저장
		model.addAttribute("user", id);		// jsp에 전달하기 위해 model에 저장
		
		return "board/notice/noticeBoardWriteForm";
	}
	
	
	// 공지사항 작성
	@PostMapping("notice/noticeBoardWriteSave")
	public void noticeBoardWriteSave(MultipartHttpServletRequest mul,
								  HttpServletResponse response,
								  HttpServletRequest request) throws IOException {
		// board 입력 및 결과 메시지 출력
		String message = bs.noticeBoardWriteSave(mul, request);
		response.setContentType("text/html; charset=utf-8");  // 요청에 대한 응답 인코딩 처리
		PrintWriter out = response.getWriter(); // 출력 객체 생성
		out.print(message); // 메시지 출력
	}
	
	
	// 이미지 다운로드(이미지 미리보기)
	@RequestMapping("notice/noticeBoardDownload")
	public void noticeBoardDownload(@RequestParam("file_name") String file_name, 
									HttpServletResponse response) throws Exception {
		
		response.addHeader("Content-disposition", "attachment; fileName=" + URLEncoder.encode(file_name, "utf-8"));
		File file = new File(BoardFileService.IMAGE_NOTICE_REPO + "\\" + file_name);
		FileInputStream in = new FileInputStream(file);
		FileCopyUtils.copy(in, response.getOutputStream());
		in.close();
	}
	
	
	
	
	// 공지사항 게시글 수정 폼
	@RequestMapping("notice/noticeBoardModifyForm")
	public String noticeBoardModifyForm(Model model, HttpServletRequest request) {
		NoticeBoardDTO noticeBoardDTO = bs.noticeBoardContentView(request);  // 요청온 글번호로 해당 내용 찾아서 
		
		model.addAttribute("noticeBoardDTO", noticeBoardDTO);  // 모델로 저장
		
		return "board/notice/noticeBoardModifyForm";
	}
	
	
	// 공지사항 수정 결과
	@PostMapping("notice/noticeBoardModifySave")
	public void noticeBoardModifySave(MultipartHttpServletRequest mul,
									  HttpServletRequest request,  
									  HttpServletResponse response) throws IOException {
		
		// board 입력 및 결과 메시지 출력
		String message = bs.noticeBoardModifySave(mul, request);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(message);
	}
	
	
	// 공지사항 게시글 삭제
	@RequestMapping("notice/noticeBoardDelete")
	public void noticeBoardDelete(Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 파일 삭제 (파일 이름값 넘김)
		bfs.noticeBoardDeleteFile(request.getParameter("file_name"));

		// write_no넘겨서 DB 내용 삭제하기
		String message = bs.noticeBoardDelete(request);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(message);
		
	}
	
	
	// 공지사항 카테고리 + 검색 조회
	@RequestMapping(value="notice/noticeSearchForm")
	public String noticeSearchForm(HttpServletRequest request, HttpSession session, Model m,
				      			   @RequestParam(value="num", required = false, defaultValue="1") int num) {

		String notice_category = request.getParameter("notice_category");				// 카테고리 옵션 저장
		String notice_searchCategory = request.getParameter("notice_searchCategory");	// 검색 카테고리 옵션 저장
		String notice_searchKeyword = request.getParameter("notice_searchKeyword");		// 검색 키워드 저장
		
		bs.noticeSearchForm(notice_category, notice_searchCategory, notice_searchKeyword, m, num); 	// 서비스에게 내용 넘겨줌
		
		String id = (String) session.getAttribute(LOGIN);	// 아이디 세션 저장
		
		// 로그인을 했을 때 아이디 정보값을 가져온다.
		if(id != null) {
			ms.userInfo(id, m); // 회원정보 저장
		}
		
		m.addAttribute("num", num); 		// 페이지 번호 저장
		m.addAttribute("admin", ADMIN); 	// 관리자 아이디 저장
		
		// 서비스에서 요청을 받지않은 이유는 처음 값 
		// (카테고리: noticeAll, 검색카테고리: 제목, 검색키워드: "") 을 저장하기 위해서
		// 서비스에서는 쿼리문 조회를 위해서 해당 내용들을 "%%"로 바꾸기 때문에 .jsp에서는 "%%"가 사용불가
		// 즉 서비스에서 요청내용을 받게되면 처음 쿼리문으로 전체를 "%%"로 변경 -> 다시 ""로 변환해줘야한다.
		
		m.addAttribute("notice_category", notice_category); 			// 요청온 카테고리 옵션 저장
		m.addAttribute("notice_searchCategory", notice_searchCategory); // 요청온 검색 카테고리 저장
		m.addAttribute("notice_searchKeyword", notice_searchKeyword); 	// 요청온 검색 키워드 저장
		
		return "board/notice/noticeBoardAllList";
	}
	
		
		
	//============================ 최윤희 끝 ===========================================
	
	
	
	
	
	
}
