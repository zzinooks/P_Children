package com.web.root.member.service;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.web.root.member.dto.KakaoLoginDTO;
//github.com/ssp930/P_Children
import com.web.root.member.dto.MemberDTO;
import com.web.root.mybatis.member.MemberMapper;

@Service
public class MemberServiceImp1 implements MemberService {

	@Autowired
	MemberMapper mapper;
	
	@Autowired
	CheckMailService cms;
	
	@Inject
	JavaMailSender mailSender;
	
	
	@Override
	public MemberDTO member_information(String id) {
		return mapper.member_information(id);
	}

	@Override
	public void modify_save(HttpServletRequest request) {
		MemberDTO dto = new MemberDTO();
		dto.setId(request.getParameter("id"));
		dto.setPwd(request.getParameter("re_pwd"));
		dto.setNickname(request.getParameter("nickname"));
		dto.setPhone(request.getParameter("phone"));
		dto.setAddr(request.getParameter("addr"));

		mapper.modify_save(dto);
	}
	
	@Override
	public void member_board(Model model, int num) {
		int pageLetter = 5; 
		int allCount = mapper.selectMember_boardCount(); 
		int repeat = allCount/pageLetter;  
		if(allCount % pageLetter != 0)
			repeat += 1;
		int end = num * pageLetter;
		int start = end + 1 - pageLetter;
		model.addAttribute("repeat", repeat);
		model.addAttribute("my_board_list", mapper.member_board(start, end));
	}

	@Override
	public void memberInfo(Model model, int num) {
		int pageLetter = 10; 
		int allCount = mapper.selectMemberCount(); 
		int repeat = allCount/pageLetter;  
		if(allCount % pageLetter != 0)
			repeat += 1;
		int end = num * pageLetter;
		int start = end + 1 - pageLetter;
		model.addAttribute("repeat", repeat);
		model.addAttribute("memberList", mapper.memberInfo(start, end));
		
	}
	
	public void manager_board(Model model, int num) {
		int pageLetter = 5; 
		int allCount = mapper.selectBoardCount(); 
		int repeat = allCount/pageLetter;  
		if(allCount % pageLetter != 0)
			repeat += 1;
		int end = num * pageLetter;
		int start = end + 1 - pageLetter;
		model.addAttribute("repeat", repeat);
		model.addAttribute("boardList", mapper.manager_board(start, end));
	}

	@Override
	public void manager_qna(Model model, int num) {
		int pageLetter = 10; 
		int allCount = mapper.selectQnaCount(); 
		int repeat = allCount/pageLetter;  
		if(allCount % pageLetter != 0)
			repeat += 1;
		int end = num * pageLetter;
		int start = end + 1 - pageLetter;
		model.addAttribute("repeat", repeat);
		model.addAttribute("qnaList", mapper.manager_qna(start, end));		
		
	}
	
	

	@Override
	public void member_leave_save(HttpServletRequest request) {
		MemberDTO dto = new MemberDTO();
		dto.setId(request.getParameter("id"));
		dto.setPwd(request.getParameter("pwd"));
		mapper.member_leave_save(dto);
	}

	@Override
	public void userInfo(String userid, Model model) {
		MemberDTO dto = mapper.getMember(userid);
		model.addAttribute("info", dto);
		
	}
	
	//============================ 박성수 시작 ===========================================
	
	
	@Override
	public String registHost(MemberDTO dto) {
		String message = "";
		int result = 0;
		if(dto.getUserSelect().equals("member")) {
			result = mapper.registMember(dto);
			return message;
		}
		result = mapper.registHost(dto);
		if(result == 1) {
			message = "회원가입 완료.";
		}
		return message;
	}
	
	@Override
	public String getHostInfo(String id) {
		MemberDTO dto = new MemberDTO();
		dto = mapper.getHostInfo(id);
		if(dto == null) {
			return "OK";
		}
		return "NO";
	}
	
	@Override
	public String checkEmail(String email) {
		MemberDTO dto = new MemberDTO();
		dto = mapper.checkEmail(email);
		if(dto == null) {
			return "OK";
		}
		return "NO";
	}
	
	@Override
	public int sendEmail(String email) {
		return cms.sendEmail(email); 
		
	}
	
	
	
	@Override
	public String getkakaoToken(String code, String tokenURL) throws IOException {
		ObjectMapper objectMapper = new ObjectMapper();
		RestTemplate restTemplate = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		MultiValueMap<String, String> params =
				new LinkedMultiValueMap<String, String>();
		params.add("grant_type", "authorization_code");		
		params.add("client_id", "50cc79dc82404d34d4da829c82e31cd2");		
		params.add("redirect_uri", "http://localhost:8080/root/member/kakaoCode");		
		params.add("code", code);
		
		HttpEntity<MultiValueMap<String, String>> entity =
				new HttpEntity<>(params, headers);
		
		ResponseEntity<String> response = 
				restTemplate.postForEntity(tokenURL, entity, String.class);
		
		return objectMapper.readTree(response.getBody())
					.get("access_token").asText();
		
	}
	
	@Override
	public int registKakaoUser(String token, String kakaoIdURL, HttpSession session) throws IOException {
		ObjectMapper objectMapper = new ObjectMapper();
		RestTemplate restTemplate = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		
		headers.add("Authorization", "Bearer "+token);
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		HttpEntity<String> entity = new HttpEntity<>(headers);
		ResponseEntity<String> response = 
					 restTemplate.exchange(kakaoIdURL, HttpMethod.GET, entity, String.class);
		
		JsonNode responseBody = objectMapper.readTree(response.getBody());
		String kakaoId = responseBody.get("id").asText();
		String kakaoLoginEmail = null;
		if(responseBody.get("kakao_account").get("email") != null) {
			kakaoLoginEmail = responseBody.get("kakao_account").get("email").asText();
		}
		KakaoLoginDTO kakaoLogindto = new KakaoLoginDTO(kakaoId, kakaoLoginEmail);
		KakaoLoginDTO kakaoUserCheck = mapper.kakaoUserCheck(kakaoId);
		
		int result = 0;
		if(kakaoUserCheck == null) {
			result = mapper.registKakaoUser(kakaoLogindto);
		}
		session.setAttribute("kakaoId", kakaoId);
		session.setAttribute("kakaoAccessToken", token);
		return result;
	}
	
	@Override
	public String kakaoLogout(String token, String kakaoLogouturl) {
		ObjectMapper objectMapper = new ObjectMapper();
		RestTemplate restTemplate = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		
		headers.add("Content-type", "application/x-www-form-urlencoded");
		headers.add("Authorization", "Bearer "+token);
		
		HttpEntity<String> entity = new HttpEntity<>(headers);
		ResponseEntity<String> response = 
				restTemplate.postForEntity(kakaoLogouturl, entity, String.class);
		
		String kakaoLogoutId = "";
		try {
			kakaoLogoutId = objectMapper.readTree(response.getBody()).get("id").asText();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return kakaoLogoutId;
	}
	
	
	//============================ 박성수 끝 ===========================================
	
	
	//============================ 최윤희 ===========================================	
	 
	
	// 로그인 유저 체크
	@Override
	public int userCheck(HttpServletRequest request) {
		MemberDTO dto = mapper.userCheck(request.getParameter("id"));  // 입력받은 아이디값 전달

		if(dto != null) {  // dto에 값이 있으면
			if(request.getParameter("pwd").equals(dto.getPwd())) {  // 입력받은 비밀번호와 
				return 1; // 로그인 성공							// dto에서 찾아 저장된 비밀번호가 같은지 확인
			}
		}
		return 0; // 로그인 실패	
	}
	
	
	// 아이디 찾기
	@Override
	public int findUserId(HttpServletRequest request, Model model) {
		
		// 입력받은 이메일 전달
		MemberDTO dto = mapper.findUserId(request.getParameter("findUserEmail")); 
		
		// 입력받은 휴대폰 번호와 DB에서 찾은 휴대폰 번호가 같은지
		if(dto != null) {
			if(request.getParameter("findUserPhone").equals(dto.getPhone())) {  
				model.addAttribute("findUserId", dto);
				return 1;
			}
		}
		return 0;
	}
	
	
	// 비밀번호 찾기
	@Override
	public int findUserPwd(HttpServletRequest request, Model model) {
		
		// 입력받은 아이디 전달하여 dto에 회원정보 전부 저장
		MemberDTO dto = mapper.findUserPwd(request.getParameter("findUserId"));
		
		if(dto != null) {
			model.addAttribute("findUserPwd", dto);
			return 1;
		} 
		return 0;
	}
	
	
	// 비밀번호 찾기 메일 인증
	@Override
	public int sendFindPwdEmailCode(String email) {
		return cms.sendFindPwdEmailCode(email);
	}

	
	// 비밀번호 수정
	@Override
	public void userUpdatePwd(MemberDTO dto) {
		mapper.userUpdatePwd(dto); 
	}

	
	//============================ 최윤희 끝 ===========================================
	
	
	
}











