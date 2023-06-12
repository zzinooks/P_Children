package com.web.root.board.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.web.root.board.dto.BoardDTO;
import com.web.root.board.dto.ProgramBoardDTO;
import com.web.root.mybatis.board.BoardMapper;

@Service
public class BoardForProgramServiceImpl implements BoardForProgramService {

	@Autowired
	BoardMapper mapper;
	
	@Autowired
	BoardFileService bfs;
	
	// 프로그램 입력(DB에 저장)
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
			url = "/programBoard/programBoardAllList";
		} else {
			msg = "글 등록 실패...";
			url = "/programBoard/writeFormForProgram";
		}
		
		return bfs.getMessage(request, msg, url);
	}

	@Override
	public void programBoardAllList(Model model, int num, HttpServletRequest request) {
		
		int pageLetter = 3; // 한 페이지 당 글 목록수
		int allCount= mapper.selectProgramBoardCount(); // 전체 글수
		int repeat = allCount/pageLetter; // 마지막 페이지 번호
		if(allCount % pageLetter != 0)
			repeat += 1;
		int end = num * pageLetter;
		int start = end +1 - pageLetter;
		
		// 페이징
		int totalPage = (allCount - 1)/pageLetter + 1;
		int block = 3;
		int startPage = (num - 1)/block*block + 1;
		int endPage = startPage + block - 1;
		if (endPage > totalPage) endPage = totalPage;
		
		// 정보 담기
		model.addAttribute("repeat", repeat);
		model.addAttribute("programBoardList", mapper.programBoardAllList(start, end));
		model.addAttribute("endPage", endPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("block", block);
		model.addAttribute("totalPage", totalPage);
		
	}

	@Override
	public ProgramBoardDTO programContentView(Model model, HttpServletRequest request) {
		int write_no = Integer.parseInt(request.getParameter("write_no"));
		
		ProgramBoardDTO programBoardDTO = new ProgramBoardDTO();
		programBoardDTO.setWrite_no(write_no);
		
		return mapper.programContentView(programBoardDTO);
	}

	@Override
	public void programHitplus(ProgramBoardDTO programBoardDTO) {
		mapper.programHitplus(programBoardDTO);
		
	}

	@Override
	public String modifySaveForProgram(MultipartHttpServletRequest mul, HttpServletRequest request) {
		
		// form 에서 받은 정보 DTO에 담기
		ProgramBoardDTO programBoardDTO = new ProgramBoardDTO();
		programBoardDTO.setWrite_no(Integer.parseInt(mul.getParameter("write_no")));
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
		programBoardDTO.setState(mul.getParameter("state"));
		programBoardDTO.setPriceForProgram(Integer.parseInt(mul.getParameter("priceForProgram")));
		
		MultipartFile file = mul.getFile("file");
		
		int result = 0;	// modify 성공 여부 확인값
		
		// 수정파일 존재시 file_name 설정 및 실제 파일 저장
		if(file.getSize() != 0) {	// 이미지가 있는지 확인
			
			programBoardDTO.setMateImage(bfs.saveFile(file));
			result = mapper.modifySaveForProgramWithFile(programBoardDTO);
			
		} else {
			result = mapper.modifySaveForProgram(programBoardDTO);
		}
		// DB에서 Modify 실행
		
		
		// 실패
		String msg, url;
		if(result == 1) {
			msg = "글이 수정 되었습니다";
		url = "/programBoard/programBoardAllList?num="+ request.getParameter("num");
		} else {
			msg = "글수정 실패~";
		url = "/programBoard/modifyProgramForm?write_no=" + programBoardDTO.getWrite_no();
		}
		return bfs.getMessage(request, msg, url);
	}

	// 프로그램 삭제
	@Override
	public String deleteProgram(Model model, HttpServletRequest request) {
		
		int result = 0; // 삭제 성공유무 결과값 (1: 성공, 0: 실패)
		
		
		int write_no = Integer.parseInt(request.getParameter("write_no"));
		result = mapper.deleteProgram(write_no);
		
		String msg, url;
		if(result == 1) {
			msg = "글이 삭제 되었습니다";
			url = "/programBoard/programBoardAllList";
		} else {
			msg = "글삭제 실패~";
			url = "/programBoard/programBoardContentView?write_no=" + write_no;
		}
		return bfs.getMessage(request, msg, url);
	}
	
	
	
	
	
	
	
	
	
	
}
