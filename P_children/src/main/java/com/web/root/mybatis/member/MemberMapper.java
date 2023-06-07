package com.web.root.mybatis.member;

import java.util.List;
import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.springframework.ui.Model;

import com.web.root.board.dto.BoardDTO;
import com.web.root.member.dto.MemberDTO;
import com.web.root.member.dto.MemberDTO;
import com.web.root.qna.dto.QnaDTO;


public interface MemberMapper {
	
	public MemberDTO getMember(String userid);
	
	public int selectBoardCount();
	public int selectMemberCount();
	public int selectQnaCount();
	
	public List<MemberDTO> memberInfo(@Param("s") int start, @Param("e") int end);
	public List<BoardDTO> manager_board(@Param("s") int start, @Param("e") int end);
	public List<QnaDTO>	manager_qna(@Param("s") int start, @Param("e") int end);

	//============================ 박성수 시작 ===========================================
	
	public int registMember(MemberDTO dto);
	
	public int registHost(MemberDTO dto);

	public MemberDTO getHostInfo(String id);
	
	MemberDTO checkEmail(String email);
	
	public MemberDTO checkEmail_host(String email);
	
	
	//============================ 박성수 끝 ===========================================
	
	
	
	//============================ 최윤희 ===========================================
	
	public MemberDTO userCheck(String id);
	
	public MemberDTO userCheckHost(String id);
	
	public MemberDTO findUserId(String findUserEmail);
	
	public MemberDTO findUserHostId(String findUserEmail);
	
	public MemberDTO findUserPwd(String findUserId);
	
	public MemberDTO findUserHostPwd(String findUserEmail);

	public void userUpdatePwd(MemberDTO dto);
	
	public void userUpdateHostPwd(MemberDTO hostDTO);

	
	
	

	//============================ 최윤희 끝 ===========================================
	

}
