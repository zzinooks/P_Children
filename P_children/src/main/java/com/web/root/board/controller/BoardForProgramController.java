package com.web.root.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.root.board.service.BoardForProgramService;

@Controller
@RequestMapping("programBoard")
public class BoardForProgramController {
//
//	@Autowired
//	BoardForProgramService bfps;
	
	@RequestMapping("writeFormForProgram")
	public String writeFormForProgram () {
		return "programBoard/writeFormForProgram";
	}
}
