package com.web.root.mybatis.member;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.web.root.board.dto.BoardDTO;
import com.web.root.member.dto.KakaoLoginDTO;
import com.web.root.member.dto.MemberDTO;
import com.web.root.qna.dto.QnaDTO;


public interface MemberMapper {
	
	public MemberDTO member_information(String id);
	public MemberDTO getMemberInfo(MemberDTO dto);
	
	public MemberDTO getMember(String userid);
	public void modify_save(MemberDTO dto);
	public void member_leave_save(MemberDTO dto);
	
	public int selectBoardCount();
	public int selectMemberCount();
	public int selectQnaCount();
	public int selectMember_boardCount();
	
	public List<MemberDTO> memberInfo(@Param("s") int start, @Param("e") int end);
	public List<BoardDTO> manager_board(@Param("s") int start, @Param("e") int end);
	public List<QnaDTO>	manager_qna(@Param("s") int start, @Param("e") int end);
	public List<MemberDTO> member_board(@Param("s") int start, @Param("e") int end);

	//============================ 박성수 시작 ===========================================
	
	public int registMember(MemberDTO dto);
	
	public int registHost(MemberDTO dto);

	public MemberDTO getHostInfo(String id);
	
	MemberDTO checkEmail(String email);
	
	public MemberDTO checkEmail_host(String email);
	
	public int registKakaoUser(KakaoLoginDTO kakaoLogindto);
	
	public KakaoLoginDTO kakaoUserCheck(String kakaoId);
	
	
	
	//============================ 박성수 끝 ===========================================
	
	
	
	//============================ 최윤희 ===========================================
	
	public MemberDTO userCheck(String id);
	
	public MemberDTO findUserId(String findUserEmail);
	
	public MemberDTO findUserHostId(String findUserEmail);
	
	public MemberDTO findUserPwd(String findUserId);
	
	public MemberDTO findUserHostPwd(String findUserEmail);

	public void userUpdatePwd(MemberDTO dto);
	

	
	
	

	//============================ 최윤희 끝 ===========================================
	

}
