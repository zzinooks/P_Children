package com.web.root.mybatis.member;

import java.util.List;
import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.springframework.ui.Model;

import com.web.root.board.dto.BoardDTO;
import com.web.root.member.dto.MemberDTO;
import com.web.root.qna.dto.QnaDTO;

public interface MemberMapper {
	
	public MemberDTO userCheck(String id);
	public MemberDTO getMember(String userid);
	
	public int selectBoardCount();
	public int selectMemberCount();
	public int selectQnaCount();
	
	public List<MemberDTO> memberInfo(@Param("s") int start, @Param("e") int end);
	public List<BoardDTO> manager_board(@Param("s") int start, @Param("e") int end);
	public List<QnaDTO>	manager_qna(@Param("s") int start, @Param("e") int end);
}
