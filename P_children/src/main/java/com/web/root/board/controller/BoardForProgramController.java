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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.web.root.board.service.BoardFileService;
import com.web.root.board.service.BoardForProgramService;
import com.web.root.session.name.MemberSession;

@Controller
@RequestMapping("programBoard")
public class BoardForProgramController implements MemberSession{

	@Autowired
	BoardForProgramService bfps;
	
	@Autowired
	BoardFileService bfs;
	
	@RequestMapping("writeFormForProgram")
	public String writeFormForProgram (Model model, HttpSession session) {
		model.addAttribute("user", session.getAttribute(LOGIN));
		return "programBoard/writeFormForProgram";
	}
	
	@PostMapping(value="position1Selected", produces="application/json; charset=utf-8")
	@ResponseBody
	public String position1Selected(@RequestBody String position1SelectedValue) {
		return position1SelectedValue;
	}
	
	@PostMapping("writeSaveForProgram")
	public void writeSaveForProgram(MultipartHttpServletRequest mul, HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		// programBoard 입력 및 결과 메시지 출력
		String message = bfps.writeSaveForProgram(mul,request);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(message);
	}
	
}
