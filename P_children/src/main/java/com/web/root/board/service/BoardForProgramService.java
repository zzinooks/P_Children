package com.web.root.board.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface BoardForProgramService {

	public String writeSaveForProgram(MultipartHttpServletRequest mul, HttpServletRequest request);
}
