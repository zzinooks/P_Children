package com.web.root.mybatis.board;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.web.root.board.dto.BoardDTO;
import com.web.root.board.dto.BoardRepDTO;
import com.web.root.board.dto.NoticeBoardDTO;

public interface BoardMapper {
	
	//============================ 주진욱 시작 ===========================================
	
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
	
	// 댓글 기능 ------------------------------------------------
	
	public int addReply(Map<String, Object> map);
	
	public List<BoardRepDTO> getRepList(int write_group);
	
	public int deleteReply(BoardRepDTO dto);
	
	public int updateReply(Map<String, String> map);
	
	// 답글(대댓글) 기능 -----------------------------------------------
	public List<BoardRepDTO> getReCommentList(int reply_no);
	
	public int addReComment(Map<String, Object> map);
	
	public int updateReComment(Map<String, String> map);
	
	
	//============================ 주진욱 끝 ===========================================
	
	
	
	
	
	//============================ 최윤희 시작 ===========================================
	
	
	// DB에 담겨있는 전체 게시글 수 (전체 글 수)
	public int selectNoticeBoardCount();
	
	// 페이징
	public List<NoticeBoardDTO> noticeBoardAllList(@Param("s") int start, @Param("e") int end);
	
	// 공지사항 게시글 보기
	public NoticeBoardDTO noticeBoardContentView(NoticeBoardDTO noticeBoardDTO);
	
	// 조회수 증가
	public void noticeBoardHitplus(NoticeBoardDTO noticeBoardDTO);
	
	// NoticeBoardDTO 에 담은 내용 저장(insert)
	public int noticeBoardWriteSave(NoticeBoardDTO noticeBoardDTO);
	
	// 공지사항 게시글 수정
	public int noticeBoardModifySaveWithFile(NoticeBoardDTO noticeBoardDTO);
	
	// 공지사항 게시글 삭제
	public int noticeBoardDelete(int write_no);
	
		
	//============================ 최윤희 끝 ===========================================
	
	
	

}
