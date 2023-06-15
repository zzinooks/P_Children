package com.web.root.board.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

/*
CREATE TABLE programBoard(
write_no NUMBER(10) PRIMARY KEY,
id VARCHAR2(15) NOT NULL,
title VARCHAR2(100) NOT NULL,
petKind VARCHAR2(40) NOT NULL,
mateName VARCHAR2(40) NOT NULL,
mateImage VARCHAR2(100),
content VARCHAR2(300),
position1 VARCHAR2(100),
position2 VARCHAR2(100),
startDate VARCHAR2(20),
startTime VARCHAR2(20),
endDate VARCHAR2(20),
endTime VARCHAR2(20),
priceForProgram NUMBER(20),
savedate DATE DEFAULT SYSDATE,
hit NUMBER(10) DEFAULT 0,
state VARCHAR2(20) '예약 가능'

 */
public class ProgramBoardDTO_test {
	
	// 속성(property)
	private int write_no;
	private String id;
	private String title;
	private String petKind;
	private String mateName;
	private String mateImage;
	private String content;
	private String position1;
	private String position2;
	private String startDate;
	private String startTime;
	private String endDate;
	private String endTime;
	private int priceForProgram;
	private String savedate;
	private int hit;
	private String state;
	private String program_key;
	
	
	// 생성자
	public ProgramBoardDTO_test() {
		super();
	}
	public ProgramBoardDTO_test(int write_no, String id, String title, String petKind, String mateName, String mateImage,
			String content, String position1, String position2, String startDate, String startTime, String endDate,
			String endTime, int priceForProgram, String savedate, int hit, String state) {
		super();
		this.write_no = write_no;
		this.id = id;
		this.title = title;
		this.petKind = petKind;
		this.mateName = mateName;
		this.mateImage = mateImage;
		this.content = content;
		this.position1 = position1;
		this.position2 = position2;
		this.startDate = startDate;
		this.startTime = startTime;
		this.endDate = endDate;
		this.endTime = endTime;
		this.priceForProgram = priceForProgram;
		this.savedate = savedate;
		this.hit = hit;
		this.state = state;
	}
	
	
	// getter와 setter
	public int getWrite_no() {
		return write_no;
	}
	
	public void setWrite_no(int write_no) {
		this.write_no = write_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPetKind() {
		return petKind;
	}
	public void setPetKind(String petKind) {
		this.petKind = petKind;
	}
	public String getMateName() {
		return mateName;
	}
	public void setMateName(String mateName) {
		this.mateName = mateName;
	}
	public String getMateImage() {
		return mateImage;
	}
	public void setMateImage(String mateImage) {
		this.mateImage = mateImage;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPosition1() {
		return position1;
	}
	public void setPosition1(String position1) {
		this.position1 = position1;
	}
	public String getPosition2() {
		return position2;
	}
	public void setPosition2(String position2) {
		this.position2 = position2;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public int getPriceForProgram() {
		return priceForProgram;
	}
	public void setPriceForProgram(int priceForProgram) {
		this.priceForProgram = priceForProgram;
	}
	public String getSavedate() {
		return savedate;
	}
	public void setSavedate(Timestamp savedate) {
		SimpleDateFormat format = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
		this.savedate = format.format(savedate);
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getProgram_key() {
		return program_key;
	}
	public void setProgram_key(String program_key) {
		this.program_key = program_key;
	}
	
	
	
	

	

}
