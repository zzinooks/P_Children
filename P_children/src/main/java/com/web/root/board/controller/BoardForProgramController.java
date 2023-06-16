package com.web.root.board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.web.root.board.dto.BoardDTO;
import com.web.root.board.dto.BoardDibsDTO;
import com.web.root.board.dto.ProgramBoardDTO;
import com.web.root.board.service.BoardFileService;
import com.web.root.board.service.BoardForProgramService;
import com.web.root.kakao.resource.KakaoDeveloper;
import com.web.root.board.service.BoardService;
import com.web.root.kakao.service.KakaoService;
import com.web.root.member.dto.MemberDTO;
import com.web.root.member.service.MemberService;
import com.web.root.session.name.MemberSession;

@Controller
@RequestMapping("programBoard")
public class BoardForProgramController implements MemberSession, KakaoDeveloper{

	@Autowired
	BoardForProgramService bfps;
	
	@Autowired
	BoardFileService bfs;
	
	@Autowired
	MemberService ms;

	@Autowired
	KakaoService ks;
	
	@Autowired
	BoardService bs;
	
	// 프로그램 입력 view 호출
	@RequestMapping("writeFormForProgram")
	public String writeFormForProgram (Model model, HttpSession session) {
		model.addAttribute("user", session.getAttribute(LOGIN));
		return "programBoard/writeFormForProgram";
	}
	
	// 프로그램 입력 view에서 위치1 선택될 시 해당하는 위치2 나옴
	@PostMapping(value="position1Selected", produces="application/json; charset=utf-8")
	@ResponseBody
	public String position1Selected(@RequestBody String position1SelectedValue) {
		return position1SelectedValue;
	}
	
	// 프로그램 입력 (DB에 입력)
	@PostMapping("writeSaveForProgram")
	public void writeSaveForProgram(MultipartHttpServletRequest mul, HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		// programBoard 입력 및 결과 메시지 출력
		String message = bfps.writeSaveForProgram(mul,request);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(message);
	}
	
	// 프로그램 boardAllList
	@GetMapping("programBoardAllList")
	public String programBoardAllList(HttpSession session, Model model, @RequestParam(value="num", required = false, defaultValue="1") int num, HttpServletRequest request ) {
		bfps.programBoardAllList(model, num, request);
		
		// 카카오톡 로그인 check
		String kakaoIdCheck = (String) session.getAttribute("kakaoId");
			
		// 로그인값 불러오기
		if(kakaoIdCheck == null) { // 일반 로그인, 비로그인인 경우 (카카오톡이 아닌 경우)
			String id = (String) session.getAttribute(LOGIN);
			if(id == null) { // 비로그인인 경우
				model.addAttribute("id", id);
			} else {	// 일반 로그인인 경우
				ms.userInfo(id, model);
			}
			
		} else { // 카카오톡 로그인인 경우
			MemberDTO memberDTO = new MemberDTO();
			memberDTO.setId(kakaoIdCheck);
			memberDTO.setGrade("bronze");
			model.addAttribute("info", memberDTO);
		}
		model.addAttribute("admin", ADMIN);
		
		return "/programBoard/programBoardAllList";  
		
	}
	
	// 프로그램 contentView
	@RequestMapping("programContentView")
	public String programContentView(Model model, HttpServletRequest request, HttpSession session) {
		
		// (1) 정보 가져오기
		// (1-1) programBoard 정보 하나 가져오기
		ProgramBoardDTO programBoardDTO = bfps.programContentView(model, request);
		
		// (1-2) 로그인값 불러오기
		// 카카오톡 로그인 check
		String kakaoIdCheck = (String) session.getAttribute(LOGIN);
		
		// 로그인값 불러오기
		if(kakaoIdCheck == null) { // 일반 로그인, 비로그인인 경우 (카카오톡이 아닌 경우)
			String id = (String) session.getAttribute(LOGIN);
			if(id == null) { // 비로그인인 경우
				model.addAttribute("id", id);
			} else {	// 일반 로그인인 경우
				ms.userInfo(id, model);
			}
			
		} else { // 카카오톡 로그인인 경우
			MemberDTO memberDTO = new MemberDTO();
			memberDTO.setId(kakaoIdCheck);
			memberDTO.setGrade("bronze");
			model.addAttribute("info", memberDTO);
		}
		
		//(1-3) boardDib(찜하기) 정보 가져오기
		Map<String, Object> mapForBoardDib = new HashMap<String, Object>();
		if(kakaoIdCheck != null) { // 로그인 했을 시 찜했는지 확인하는 정보 가져오기
			mapForBoardDib.put("id", kakaoIdCheck);
			mapForBoardDib.put("write_no", request.getParameter("write_no"));
			BoardDibsDTO boardDibsDTO = bs.getDibsByIdWriteNo(mapForBoardDib);		
		
			// 정보 담기
			if(boardDibsDTO == null) {	// 찜한 적이 없을 때
				model.addAttribute("state", 0);
			} else {					// 찜한 적이 있을 때
				model.addAttribute("state", boardDibsDTO.getDibs_state());
			}
		}
		
		// (1-4) 게시판 찜한 숫자 가져오기
		int dibsNum = bs.getdibsNumByWriteNo(Integer.parseInt(request.getParameter("write_no"))); 
		
		// (2) 정보 담기
		model.addAttribute("programBoardDTO", programBoardDTO);
		model.addAttribute("user", kakaoIdCheck);
		// grade 확인을 위한 admin(== "gold") 추가
		model.addAttribute("admin", ADMIN);
		
		model.addAttribute("dibsNum", dibsNum);
		// (3) 조회수 증가
		bfps.programHitplus(programBoardDTO);
		
		return "/programBoard/programBoardContentView";
	}
	
	// 프로그램 modifyView
	@RequestMapping("modifyProgramForm")
	public String modifyProgramForm(Model model, HttpServletRequest request, HttpSession session) {
		
		ProgramBoardDTO programBoardDTO = bfps.programContentView(model, request);
		String user = (String) session.getAttribute(LOGIN);
		
		model.addAttribute("programBoardDTO", programBoardDTO);
		model.addAttribute("user", user);
		model.addAttribute("admin", ADMIN);
		
		return "programBoard/modifyProgramForm";
	}
	
	
	// 프로그램 수정(DB에서 수정)
	@RequestMapping("modifySaveForProgram")
	public void modifySaveForProgram(MultipartHttpServletRequest mul,Model model, HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		MultipartFile file = mul.getFile("file");
		
		ProgramBoardDTO programBoardDTO = bfps.programContentView(model, request);
		
		// 수정 파일 존재시 실제 저장된 파일 삭제
		if(file.getSize() != 0) {
			bfs.deleteFile(programBoardDTO.getMateImage());
		}
		
		// board 입력 및 결과 메시지 출력
		String message = bfps.modifySaveForProgram(mul,request);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(message);
	}
	
	// 프로그램 삭제(DB에서 삭제)
	@RequestMapping("deleteProgram")
	public void deleteProgram(Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		// write_no로 programBoardDTO 받아오기
		ProgramBoardDTO programBoardDTO = bfps.programContentView(model, request);
		
		if(!programBoardDTO.getMateImage().equals("nan")) { // 메이트 이미지 파일 있을 경우
			// 파일 삭제
			bfs.deleteFile(programBoardDTO.getMateImage());
		}
		// write_no로 DB 내용 삭제하기
		String message = bfps.deleteProgram(model,request);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(message);		
	}
	
	// 카카오 페이 승인 시 프로그램 결재 완료 후 승인 대기로 이동
	@RequestMapping("paidProgramContentView")
	public void paidProgramContentView(HttpServletRequest request, HttpServletResponse response, @RequestParam("pg_token") String pg_token, HttpSession session, Model model) throws IOException {
		// 성수 : 카카오 페이 실패시 진행 코드. 테스트 때는 그럴일이 없어서 확인 불가 ㅋㅋ
		if(pg_token == null) {
			String message = bfps.kakaoPayFail(request);
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println(message);
		}
		
		// 카카오 페이 결제 승인
		ms.kakaoPaymentApprove(KAKAO_PAYMENT_APPROVE_URL, ADMIN_KEY, pg_token, session);
		
		// 카카오 페이 승인 결과 DB에 연동
		String message = bfps.paidProgramContentView(request);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(message);
		
	}
	
	// 여기서부터는 찜하기 기능
	// 찜하기 버튼 클릭시 토글 기능(프로그램 게시판)
	@PostMapping(value="toggleDibs/{write_no}", produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> toggleDibs(@RequestBody Map<String, Object> map,@PathVariable("write_no") String write_no, HttpSession session, Model model, HttpServletRequest request) {
		int result = bs.toggleDibs(map);
		System.out.println(write_no +"입니다~!!");
		int dibsNum = bs.getdibsNumByWriteNo(Integer.parseInt(write_no));
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		System.out.println(result + ": result");
		System.out.println(dibsNum + ": dibsNum");
		returnMap.put("result", result);
		returnMap.put("changedDibsNum", dibsNum);
		
		return returnMap;
	}
	
	// =============================== 성수 시작 ========================================
	
	// 프로그램 카카오 지도에 맵핑하기
	@GetMapping("kakaoMapLatLng_json")
	public String createProgramLatLng_json(Model model, HttpSession session) {
		ks.createLatLngJson(model, session);
		return "sungsu/kakaoMap/kakaoMapResult";
	}
	
	
	// =============================== 성수 끝 ========================================
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
