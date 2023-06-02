package com.web.root.mybatis.member;

import java.util.List;
import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.springframework.ui.Model;

import com.web.root.board.dto.BoardDTO;
import com.web.root.member.dto.HostDTO;
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
	
	int registMember(MemberDTO dto);
	
	public int registHost(HostDTO dto);

	MemberDTO getMemberInfo(String id);
	
	public MemberDTO getHostInfo(String id);
	
	MemberDTO checkEmail(String email);
	
	public MemberDTO checkEmail_host(String email);
	
	
	//============================ 박성수 끝 ===========================================
	
	
	
	//============================ 최윤희 ===========================================
	
	public MemberDTO userCheck(String id);
	
	public MemberDTO findUserId(String findUserEmail);
	
	public MemberDTO findUserPwd(String findUserId);

	public void userRePwd(MemberDTO dto);
	
	public MemberDTO userCheckHost(String id); // hostDTO 만들기

	//============================ 최윤희 끝 ===========================================
	

}
