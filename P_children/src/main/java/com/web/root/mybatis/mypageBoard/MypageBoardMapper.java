package com.web.root.mybatis.mypageBoard;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.web.root.board.dto.BoardDTO;

public interface MypageBoardMapper {

	//============================ 최윤희 시작 ===========================================
	
	// 내가 작성한 페이지 총 카운드
	public int mypageBoardAllCount(String id);
	
	// 내가 작성한 페이지 페이징
	public List<BoardDTO> mypageBoardList(BoardDTO myboardDTO);	
	
	//============================ 최윤희 끝 ===========================================
	
}
