package com.web.root.board.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

public interface BoardFileService {

	// 파일 저장 위치
	public static final String IMAGE_REPO = "C:\\0900_JAVA_jjw\\6. Spring\\web_repo";
	
	public String getMessage(HttpServletRequest request, String msg, String url);
	
	public String saveFile(MultipartFile file);
	
	public void deleteFile(String file_name);
	
	
}
