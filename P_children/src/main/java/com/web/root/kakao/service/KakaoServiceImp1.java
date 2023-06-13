package com.web.root.kakao.service;

import java.io.IOException;
import java.net.URI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.web.root.kakao.dto.KakaoMapLatLngDTO;
import com.web.root.mybatis.kakao.KakaoMapper;
import com.web.root.session.name.KakaoDeveloper;

@Service
public class KakaoServiceImp1 implements KakaoService, KakaoDeveloper{
	
	@Autowired
	KakaoMapper kakaoMapper;
	
	
	@Override
	public void getKakaoMapLatLng(String addrMerge) {
		ObjectMapper objectMapper = new ObjectMapper();
		RestTemplate restTemplate = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		
		headers.add("Authorization", "KakaoAK "+ REST_API_KEY);
		
		UriComponentsBuilder builder = UriComponentsBuilder.fromUriString(SEARCH_ADDRESS_URL)
		        .queryParam("query", addrMerge);
		URI uri = builder.build().encode().toUri();
				
		HttpEntity<String> entity = new HttpEntity<>(headers);
		ResponseEntity<String> response = 
					 restTemplate.exchange(uri, HttpMethod.GET, entity, String.class);
		
		try {
			System.out.println(objectMapper.readTree(response.getBody())
				    .get("documents")
				    .get(0));
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		String x_ = "";
		String y_ = "";
		
		try {
			// 경도. longitude -> lng
			x_ = objectMapper.readTree(response.getBody())
			    .get("documents")
			    .get(0)
			    .get("address")
			    .get("x").asText();
			
			// 위도. latitude -> lat
			y_ = objectMapper.readTree(response.getBody())
				.get("documents")
				.get(0)
				.get("address")
				.get("y").asText();
		} catch (IOException e) {
			e.printStackTrace();
		}
		double x = Double.parseDouble(x_);
		double y = Double.parseDouble(y_);
		
		KakaoMapLatLngDTO kakaoMapLatLngDTO = new KakaoMapLatLngDTO(y, x);
		kakaoMapper.insertProgramLatLng(kakaoMapLatLngDTO);
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
