package com.web.root.board.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.web.root.board.dto.ProgramBoardDTO;

public interface BoardForProgramService {

	//public String writeSaveForProgram(MultipartHttpServletRequest mul, HttpServletRequest request);
	
	public void programBoardAllList(Model model, int num, HttpServletRequest request);
	
	public ProgramBoardDTO programContentView(Model model, HttpServletRequest request);
	
	public void programHitplus(ProgramBoardDTO programBoardDTO);
	
	public String modifySaveForProgram(MultipartHttpServletRequest mul, HttpServletRequest request);
	
	public String deleteProgram(Model model, HttpServletRequest request);
	
	public String paidProgramContentView(HttpServletRequest request);
	
	}
