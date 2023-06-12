package com.web.root.mybatis.kakao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.web.root.kakaoPay.dto.KakaoPaymentApproveResultDTO;

public interface KakaoPayMapper {

	void registKakaoPaymentApproveResult(KakaoPaymentApproveResultDTO kakaoPaymentApproveResultDTO);

	int selectKakaoPaymentApproveCount();

	List<KakaoPaymentApproveResultDTO> selectKakaoPaymentApproveList(@Param("start") int start, @Param("end") int end);

	void cancelCheck(@Param("tid") String tid);



}
