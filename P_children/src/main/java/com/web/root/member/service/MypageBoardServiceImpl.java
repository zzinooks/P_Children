package com.web.root.member.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.web.root.board.dto.BoardDTO;
import com.web.root.board.dto.NoticeBoardDTO;
import com.web.root.mybatis.mypageBoard.MypageBoardMapper;

@Service
public class MypageBoardServiceImpl implements MypageBoardService {

	@Autowired
	private MypageBoardMapper mapper;
	
	
	//============================ 최윤희 시작 ===========================================
	
	// 내가 작성한 글 전체 목록
	@Override
	public void mypageBoardWriteList(String id, Model m, int num) {
		
		List<BoardDTO> myboardListPageDTO = new ArrayList<BoardDTO>();
		BoardDTO myboardDTO = new BoardDTO();
		
		int pageLetter = 5;  // 한 페이지 당 글 목록수
		int allCount = mapper.mypageBoardAllCount(id); // 해당 id DB에 담겨있는 전체 글 수
		int repeat = allCount/pageLetter; // 마지막 페이지 번호
		if(allCount % pageLetter != 0) {
			repeat += 1;
		}
		int end = num * pageLetter;
		int start = end + 1 - pageLetter;
		
		// 페이징
		int totalPage = (allCount - 1)/pageLetter + 1;
		int block = 3;
		int startPage = (num - 1)/block * block + 1;
		int endPage = startPage + block - 1;
		if (endPage > totalPage) endPage = totalPage;
		
		myboardDTO.setId(id);
		myboardDTO.setStart(start);
		myboardDTO.setEnd(end);
		
		myboardListPageDTO = mapper.mypageBoardList(myboardDTO);
		
		m.addAttribute("repeat", repeat);
		m.addAttribute("mypageBoardList", myboardListPageDTO); // 시작과 끝 페이지 안에서 내용 가져오기
		m.addAttribute("endPage", endPage);
		m.addAttribute("startPage", startPage);
		m.addAttribute("block", block);
		m.addAttribute("totalPage", totalPage);
	}
	
	//============================ 최윤희 끝 ===========================================
	
	
}













