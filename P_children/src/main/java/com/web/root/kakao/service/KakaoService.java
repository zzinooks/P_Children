package com.web.root.kakao.service;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

public interface KakaoService {

	void getKakaoMapLatLng(String addrMerge);

	void createLatLngJson(Model model, HttpSession session);

}
