package com.web.root.mybatis.member;

<<<<<<< HEAD
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
=======
import com.web.root.member.dto.MemberDTO;

public interface MemberMapper {

	//============================ 박성수 시작 ===========================================
	
	int registMember(MemberDTO dto);

	MemberDTO getMemberInfo(String id);
	
	MemberDTO checkEmail(String email);
	
	//============================ 박성수 끝 ===========================================
	
	
	
	//============================ 최윤희 ===========================================
	
	public MemberDTO userCheck(String id);
	
	// 아이디 찾기
	public MemberDTO findUserId(String findUserEmail);
	
	// 비밀번호 찾기
	public MemberDTO findUserPwd(String findUserId);

	
	
	// 비밀번호 찾고 비밀번호 수정
	//public void userRePwd(String id, String newPwd);
	
>>>>>>> branch 'main' of https://github.com/ssp930/P_Children.git
}
