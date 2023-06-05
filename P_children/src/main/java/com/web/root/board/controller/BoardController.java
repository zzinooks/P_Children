package com.web.root.board.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.web.root.board.dto.BoardDTO;
import com.web.root.board.dto.BoardRepDTO;
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
	
	/*
	@GetMapping("boardAllList")
	public String boardAllList(Model model, @RequestParam(value="num", required = false, defaultValue="1") int num ) {
		bs.boardAllList(model);
		return "/board/boardAllList";
	}
	*/
	
	@GetMapping("boardAllList")
	public String boardAllList(HttpSession session, Model model, @RequestParam(value="num", required = false, defaultValue="1") int num, HttpServletRequest request ) {
		bs.boardAllList(model, num, request);
		String id = (String) session.getAttribute(LOGIN);
		
		ms.userInfo(id, model);
		model.addAttribute("admin", ADMIN);
		return "/board/boardAllList"; 
	}
	
	@RequestMapping("writeForm")
	public String writeForm(HttpSession session, Model model) {
		String id = (String) session.getAttribute(LOGIN);
		//MemberDTO dto = ms.getMember(id);
		model.addAttribute("user", id);
		return "/board/writeForm";
	}
	
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
	
	@RequestMapping("contentView")
	public String contentView(Model model, HttpServletRequest request, HttpSession session, HttpServletResponse response) throws Exception {
		
		BoardDTO dto = bs.contentView(model, request);
		String user = (String) session.getAttribute(LOGIN);
		
		model.addAttribute("dto", dto);
		model.addAttribute("user", user);
		
		ms.userInfo(user, model);
		model.addAttribute("admin", ADMIN);
		
		//String id = (String) session.getAttribute(LOGIN);
		//	ms.userInfo(id, model);
		
		bs.hitplus(dto);
		return "/board/contentView";
	}
	
	@GetMapping("download")
	public void download(@RequestParam("file_name") String file_name, HttpServletResponse response) throws Exception {
		
		response.addHeader("Content-disposition", "attachment; fileName=" +URLEncoder.encode(file_name, "utf-8"));
		File file = new File(BoardFileService.IMAGE_REPO + "\\" + file_name);
		FileInputStream in = new FileInputStream(file);
		FileCopyUtils.copy(in, response.getOutputStream());
		in.close();
		
	}
	
	@RequestMapping("modifyForm")
	public String modifyForm(Model model, HttpServletRequest request) {
		
		BoardDTO dto = bs.contentView(model, request);
		
		model.addAttribute("dto", dto);
		return "/board/modifyForm";
	}
	
	@PostMapping("modifySave")
	public void modifySave(Model model,HttpServletRequest request, MultipartHttpServletRequest mul, HttpServletResponse response) throws IOException {
		
		MultipartFile file = mul.getFile("file");
		
		BoardDTO dto = bs.contentView(model, request);
		
		// 수정 파일 존재시 실제 저장된 파일 삭제
		if(file.getSize() != 0) {
			//bfs.deleteFile(dto.getImage_file_name());
		}
		
		// board 입력 및 결과 메시지 출력
		String message = bs.modifySave(mul,request);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(message);
	
	} // modifySave() end
	
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
	
}
