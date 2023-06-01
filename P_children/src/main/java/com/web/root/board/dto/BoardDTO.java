package com.web.root.board.dto;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

/*
CREATE TABLE board(
write_no NUMBER(10) PRIMARY KEY,
title VARCHAR2(100),
content VARCHAR2(300),
savedate DATE DEFAULT SYSDATE,
hit NUMBER(10) DEFAULT 0,
file_name VARCHAR2(100),
id VARCHAR2(20) NOT NULL,
);
 */

public class BoardDTO {
	
	
	// 속성(property)
	private int write_no;
	private String title;
	private String content;
	private String savedate;
	private int hit;
	private String file_name;
	private String id;
	
	// 생성자
	public BoardDTO() {
		super();
	}
	
	public BoardDTO(int write_no, String title, String content, String savedate, int hit, String file_name, String id) {
		super();
		this.write_no = write_no;
		this.title = title;
		this.content = content;
		this.savedate = savedate;
		this.hit = hit;
		this.file_name = file_name;
		this.id = id;
	}

	// getter와 setter
	public int getWrite_no() {
		return write_no;
	}
	
	public void setWrite_no(int write_no) {
		this.write_no = write_no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setSavedate(Timestamp savedate) {
		SimpleDateFormat format = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
		this.savedate = format.format(savedate);
	}
	public String getSavedate() {
		return savedate;
	}
//	public void setSavedate(String savedate) {
//		this.savedate = savedate;
//	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	
	

}
