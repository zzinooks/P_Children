package com.web.root.board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.web.root.board.dto.BoardDTO;
import com.web.root.board.dto.ProgramBoardDTO;
import com.web.root.board.service.BoardFileService;
import com.web.root.board.service.BoardForProgramService;
import com.web.root.member.dto.MemberDTO;
import com.web.root.member.service.MemberService;
import com.web.root.session.name.MemberSession;

@Controller
@RequestMapping("programBoard")
public class BoardForProgramController implements MemberSession{

	@Autowired
	BoardForProgramService bfps;
	
	@Autowired
	BoardFileService bfs;
	
	@Autowired
	MemberService ms;
	
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
		return "/programBoard/programBoardAllList"; 
	}
	
	// 프로그램 contentView
	@RequestMapping("programContentView")
	public String programContentView(Model model, HttpServletRequest request, HttpSession session) {
		ProgramBoardDTO programBoardDTO = bfps.programContentView(model, request);
		String user = (String) session.getAttribute(LOGIN);
		
		model.addAttribute("programBoardDTO", programBoardDTO);
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
		
		// grade 확인을 위한 admin(== "gold") 추가
		model.addAttribute("admin", ADMIN);
		
		// 조회수 증가
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
	public void paidProgramContentView(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		// 카카오 페이 승인 결과 DB에 연동
		String message = bfps.paidProgramContentView(request);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(message);
		
	}
}
