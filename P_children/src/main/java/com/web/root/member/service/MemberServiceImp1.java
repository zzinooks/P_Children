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

import com.fasterxml.jackson.databind.ObjectMapper;
import com.web.root.member.dto.MemberDTO;
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
	public void info(String userid, Model model) {
		MemberDTO dto = mapper.getMember(userid);
		model.addAttribute("info", dto);
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
	
	ObjectMapper objectMapper = new ObjectMapper();
	RestTemplate restTemplate = new RestTemplate();
	HttpHeaders headers = new HttpHeaders();
	
	@Override
	public String getkakaoToken(String code, String tokenURL) throws IOException {
		
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		MultiValueMap<String, String> params =
				new LinkedMultiValueMap<String, String>();
		params.add("grant_type", "authorization_code");		
		params.add("client_id", "50cc79dc82404d34d4da829c82e31cd2");		
		params.add("redirect_uri", "http://localhost:8080/root/member/kakaoCode");		
		params.add("code", code);
		
		
		HttpEntity<MultiValueMap<String, String>> entity =
				new HttpEntity<>(params, headers);
		
		ResponseEntity<String> response = restTemplate.postForEntity(
				tokenURL, entity, String.class);
		
		System.out.println(response);
		System.out.println();
		
		return objectMapper.readTree(response.getBody())
					.get("access_token").asText();
		
	}
	
	@Override
	public String getKakaoId(String token, String kakaoIdURL) throws IOException {
		headers.add("Authorization", "Bearer "+token);
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		HttpEntity<String> entity = new HttpEntity<>(headers);
		ResponseEntity<String> response = 
					 restTemplate.exchange(kakaoIdURL, HttpMethod.GET, entity, String.class);
		System.out.println(response.getBody());
		return objectMapper.readTree(response.getBody())
				.get("id").asText();
					
	}
	
	
	//============================ 박성수 끝 ===========================================
	
	
	//============================ 최윤희 ===========================================	
	 
	
	// 로그인 유저 체크
	@Override
	public int userCheck(HttpServletRequest request) {
		MemberDTO dto = mapper.userCheck(request.getParameter("id"));

		if(dto != null) {
			if(request.getParameter("pwd").equals(dto.getPwd())) {
				return 1; // 로그인 성공
			}
		}
		return 0; // 로그인 실패
		
	}
	
	// 로그인 호스트 유저 체크
	@Override
	public int userCheckHost(HttpServletRequest request) {
		MemberDTO dto = mapper.userCheckHost(request.getParameter("id"));
		if(dto != null) {
			if(request.getParameter("pwd").equals(dto.getPwd())) {
				return 1; // 로그인 성공
			}
		}
		return 0; // 로그인 실패
	}
	
	// 아이디 찾기
	@Override
	public int findUserId(HttpServletRequest request, Model model) {
		
		if(request.getParameter("userSelect").equals("member")) { // 요청받은 내용이 member이면
			MemberDTO dto = mapper.findUserId(request.getParameter("findUserEmail"));
			
			if(dto != null) {
				if(request.getParameter("findUserPhone").equals(dto.getPhone())) {
					model.addAttribute("findUserId", dto);
					return 1;
				}
			} else {
				return 0;
			}
			
		} else if(request.getParameter("userSelect").equals("host")) { // 요청받은 내용이 host이면
			MemberDTO hostDTO = mapper.findUserHostId(request.getParameter("findUserEmail"));
			if(hostDTO != null) {
				if(request.getParameter("findUserPhone").equals(hostDTO.getPhone())) {
					model.addAttribute("findUserId", hostDTO);
					return 1;
				}
			}
			return 0;
		}
		return 0;
	}
	
	// 비밀번호 찾기
	@Override
	public int findUserPwd(HttpServletRequest request, Model model) {
		
		if(request.getParameter("userSelect").equals("member")) { // 요청받은 내용이 member이면
			MemberDTO dto = mapper.findUserPwd(request.getParameter("findUserId"));
			if(dto != null) {
				model.addAttribute("findUserPwd", dto);
				return 1;
			} 
			
		} else if(request.getParameter("userSelect").equals("host")) { // 요청받은 내용이 host이면
			MemberDTO hostDTO = mapper.findUserHostPwd(request.getParameter("findUserId"));
			if(hostDTO != null) {
				model.addAttribute("findUserPwd", hostDTO);
				return 1;
			}
		}
		
		return 0;
	}
	
	// 비밀번호 찾기 메일 인증
	@Override
	public int sendFindPwdEmailCode(String email) {
		return cms.sendFindPwdEmailCode(email);
	}

	@Override
	public void userUpdatePwd(MemberDTO dto) {
		mapper.userUpdatePwd(dto); 
	}
	
	@Override
	public void userUpdateHostPwd(MemberDTO hostDTO) {
		mapper.userUpdateHostPwd(hostDTO);
	}
	
	
	//============================ 최윤희 끝 ===========================================
	
	
	
}











