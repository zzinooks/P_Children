package com.web.root.mybatis.board;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.web.root.board.dto.BoardDTO;
import com.web.root.board.dto.BoardRepDTO;

public interface BoardMapper {
	
	//public List<BoardDTO> boardAllList();
	public List<BoardDTO> boardAllList(@Param("s") int start, @Param("e") int end);
	
	public int selectBoardCount();
	
	public void saveData(Map<String, String> map);
	
	public int writeSave(BoardDTO dto);
	
	public BoardDTO contentView(BoardDTO dto);
	
	public void hitplus(BoardDTO dto);
	
	public int modifySave(BoardDTO dto);
	
	public int modifySaveWithFile(BoardDTO dto);
	
	public int deleteBoard(int write_no);
	
	// 답글 기능 ------------------------------------------------
	
	public int addReply(Map<String, Object> map);
	
	public List<BoardRepDTO> getRepList(int write_group);
	
	public int deleteReply(BoardRepDTO dto);
	
	public int updateReply(Map<String, String> map);
	
	public List<BoardRepDTO> getReCommentList(int reply_no);
	


}
