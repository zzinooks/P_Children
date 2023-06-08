package com.web.root.board.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.web.root.board.dto.ProgramBoardDTO;
import com.web.root.mybatis.board.BoardMapper;

@Service
public class BoardForProgramServiceImpl implements BoardForProgramService {

	@Autowired
	BoardMapper mapper;
	
	@Autowired
	BoardFileService bfs;
	
	@Override
	public String writeSaveForProgram(MultipartHttpServletRequest mul, HttpServletRequest request) {
		
		// form 에서 받은 data 저장
		ProgramBoardDTO programBoardDTO = new ProgramBoardDTO();
		programBoardDTO.setId(mul.getParameter("id"));
		programBoardDTO.setTitle(mul.getParameter("title"));
		programBoardDTO.setPetKind(mul.getParameter("petKind"));
		programBoardDTO.setMateName(mul.getParameter("mateName"));
		programBoardDTO.setContent(mul.getParameter("content"));
		programBoardDTO.setPosition1(mul.getParameter("position1"));
		programBoardDTO.setPosition2(mul.getParameter("position2"));
		programBoardDTO.setStartDate(mul.getParameter("startDate"));
		programBoardDTO.setStartTime(mul.getParameter("startTime"));
		programBoardDTO.setEndDate(mul.getParameter("endDate"));
		programBoardDTO.setEndTime(mul.getParameter("endTime"));
		programBoardDTO.setPriceForProgram(Integer.parseInt(mul.getParameter("priceForProgram")));
		
		// form에서 받은 이미지 파일 받기
		MultipartFile file = mul.getFile("file");
		
		if(file.getSize() != 0) {	// 이미지 파일 있을 경우
			programBoardDTO.setMateImage(bfs.saveFile(file));
		} else {
			programBoardDTO.setMateImage("nan");
		}
		
		int result = 0;
		try {
			result = mapper.writeSaveForProgram(programBoardDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String msg, url;
		if(result ==1) {
			msg = "새글이 등록되었습니다";
			url = "/index";
		} else {
			msg = "글 등록 실패...";
			url = "/programBoard/writeFormForProgram";
		}
		
		return bfs.getMessage(request, msg, url);
	}

	
}
