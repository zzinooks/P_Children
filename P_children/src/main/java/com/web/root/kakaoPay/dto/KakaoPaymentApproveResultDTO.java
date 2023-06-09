package com.web.root.kakaoPay.dto;

public class KakaoPaymentApproveResultDTO {
	private String tid;
	private String cid;
	private String aid;
	
	public KakaoPaymentApproveResultDTO() {
		super();
	}

	public KakaoPaymentApproveResultDTO(String tid, String cid, String aid) {
		this.tid = tid;
		this.cid = cid;
		this.aid = aid;
	}

	public String getTid() {
		return tid;
	}

	public void setTid(String tid) {
		this.tid = tid;
	}

	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

	public String getAid() {
		return aid;
	}

	public void setAid(String aid) {
		this.aid = aid;
	}
	
	
	
		
	
}
