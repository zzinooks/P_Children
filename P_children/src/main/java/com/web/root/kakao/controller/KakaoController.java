package com.web.root.kakao.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.root.kakao.service.KakaoService;

@Controller
@RequestMapping("kakao")
public class KakaoController {
	
	@Autowired
	KakaoService ks;
	
	@GetMapping("kakaoMapTest")
	public String kakaoMapTest() {
		return "sungsu/kakaoMap/kakaoMapTest";
	}
	
	//  입력한 주소로 위도, 경도 좌표 정보 요청하기.
	@RequestMapping("kakaoMapGetLatLng")
	public String getLatLng(HttpServletRequest request) {
		String addrMerge = request.getParameter("addr2"); 
		ks.getKakaoMapLatLng(addrMerge);
		return "sungsu/kakaoMap/kakaoMapResult";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}































